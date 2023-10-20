---
date:
    created: 2022-07-06
categories:
    - CUDA
---


# CUDA Basics

<!-- more -->

[^cudabasics]: [CUDA C/C++ Basics](https://www.nvidia.com/docs/IO/116711/sc11-cuda-c-basics.pdf)

[^eveneasiercuda]: [An Even Easier Introduction to CUDA | NVIDIA Technical Blog](https://developer.nvidia.com/blog/even-easier-introduction-cuda/)

##### Question

How many blocks are needed to run $N$ threads, if each block runs $M$ threads?

??? Answer
    $\left\lfloor\dfrac{N+M-1}{M}\right\rfloor$.

    If $N \div M = k$ remainder $r$, $\left\lfloor\dfrac{N+M-1}{M}\right\rfloor = k+1 + \left\lfloor\dfrac{r-1}{M}\right\rfloor = \begin{cases}
        k, & M \mid N, \\
        k+1, & M \nmid N.
    \end{cases}$

##### Terminology

Host: CPU and CPU memory.

Device: GPU and GPU memory.


### Compile and profiling

Compile temp.cu to ./temp:
```
nvcc temp.cu -o temp
```

Profile:
```
nvprof ./temp
```


### Simple memory management

[^cudamemmanag]: [Memory Management - CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY.html)

```c
cudaMalloc(void** devPtr, size_t size);
```

```c
cudaMallocManaged(void** devPtr, size_t size);
```

```c
cudaMemcpy(void* dst, const void* src, size_t count, cudaMemcpyKind kind);
```

```c
cudaFree(void* devPtr);
```

Those are similar to C equivalents `malloc()`, `memcpy()` and `free()`


### `__global__` functions

`__global__` functions runs on the device and is called from host code.

Called with triple angle brackets: `<<<BLOCKS, THREADS_PER_BLOCK>>>`, and each thread can access the location information such as `threadIdx`, `blockIdx`, `blockDim`.


#### Example

Vanilla array addition on CPU:

```c
void add(int n, float *x, float *y)
{
    for (int i = 0; i < n; ++i)
        y[i] = x[i] + y[i];
}
// add(n, x, y)
```

Runs on `N` block, with 1 thread per block and 1 operation per thread:
```c
__global__ void add(int n, int *x, int *y)
{
    int i = threadIdx.x;
    if (i < n)
        y[i] = x[i] + y[i];
}
// add<<<N, 1>>>
```

Runs on 1 block, with 256 thread, and multiple operations per thread:
```c
__global__ void add(int n, float *x, float *y)
{
    int index = threadIdx.x;
    int stride = blockDim.x;
    for (int i = index; i < n; i += stride)
        y[i] = x[i] + y[i];
}
// add<<<1, 256>>>(N, x, y);
```

Runs on `N` blocks, with `M` threads per block and one operation per thread. Full code:
```c
#include <stdio.h>
#include <time.h>
#include <math.h>

__global__ void add(int n, float *x, float *y)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < n)
    {
        y[index] = x[index] + y[index];
    }
}

void add_cpu(int n, float *x, float *y)
{
    for (int i = 0; i < n; ++i)
    {
        y[i] = x[i] + y[i];
    }
}

float add_max_error(float *y, int n)
{
    float maxError = 0.0f;
    for (int i = 0; i < n; i++)
    {
        maxError = fmax(maxError, fabs(y[i] - 3.0f));
    }
    return maxError;
}

int main()
{
    clock_t start = clock();

    int N = 1 << 28;
    int M = 1024;

    float *x, *y;
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));
    for (int i = 0; i < N; ++i)
    {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    add<<<(N+M-1)/M, M>>>(N, x, y);

    cudaDeviceSynchronize();

    clock_t end = clock();
    float seconds = (float)(end - start) / CLOCKS_PER_SEC;
    printf("Total run duration %.6fs.\n", seconds);

    float maxError = add_max_error(y, N);
    printf("Max error %.6f.\n", maxError);

    cudaFree(x);
    cudaFree(y);

    return 0;
}
```

### Shared memory

Shared memory is declared using `__shared__`, and allocated per block. Threads within a block share access to this on-chip memory with extremely fast speed. The device memory, by opposition, is referred to as global memory.

#### Example

1D stencil aggregates elements within a radius.

```c
void stencil_1d_cpu(int n, float *in, float *out)
{
    float res = 0;
    for (int i = RADIUS; i < n - RADIUS; ++i)
    {
        res = 0;
        for (int j = i - RADIUS; j <= i + RADIUS; ++j)
        {
            res += in[j];
        }
        out[i] = res;
    }
}
```

This implementation on CUDA first copies data to shared memory, and process them within blocks. Note that `__syncthreads()` function guarantees timeline of each thread within a block joins at this point.

```c
#define RADIUS 3
__global__ void stencil_1d(int n, float *in, float *out)
{
    __shared__ float temp[N_THREAD_PER_BLOCK + 2*RADIUS];
    int global_index = threadIdx.x + blockIdx.x * blockDim.x;
    int local_index = threadIdx.x + RADIUS;

    // elements in the middle
    temp[local_index] = in[global_index];
    if (threadIdx.x < RADIUS)
    {
        // first RADIUS elements
        temp[threadIdx.x] = in[global_index - RADIUS];
        // last RADIUS elements
        temp[local_index + blockDim.x] = in[global_index + N_THREAD_PER_BLOCK];
    }

    __syncthreads();

    float res = 0;
    for (int i = local_index - RADIUS; i <= local_index + RADIUS; ++i)
    {
        res += temp[i];
    }
    if (global_index >= RADIUS && global_index < n - RADIUS)
    {
        out[global_index] = res;
    }
}
```

And the function to check correctness.

```c
float stencil_1d_max_error(int n, float *x, float expected)
{
    float maxError = 0;
    for(int i = 0; i < n; ++i)
    {
        if (i >= RADIUS && i < n - RADIUS)
        {
            maxError = fmax(maxError, fabs(x[i] - expected));
        }
    }
    return maxError;
}
```
