# OpenCV Basics

#### NumPy 数组与 OpenCV 图像结构

一个 4 行 2 列的 BGR 图像在 OpenCV 中表示为一个各维长度为 `(4, 2, 3)` 的 `np.array`，即
```
[[[bgr] [bgr]]
 [[bgr] [bgr]]
 [[bgr] [bgr]]
 [[bgr] [bgr]]]
```

`img[r1:r2, c1,c2]` 截取得到 r1 行至 r2 行，c1 列至 c2 列的子矩阵。

`b, g, r = cv2.split(img)` 将三个颜色通道分离开，相当于 `b = img[:, :, 0]` ...

`img = cv2.merge((b,g,r))` 合并三个通道，相当于 `img = np.stack((b,g,r), axis=2)`，可通过 `(b == b0).all()` 验证。

#### Matplotlib 图片显示

```python
import matplotlib.pyplot as plt
...
plt.imshow(img)
plt.show()
```

注意以上需要使用 `cv2.cvtColor` 将图片转换为 RGB 模式。若为灰度图，则需要添加参数 `cmap='gray'`。

```python
plt.subplot(2, 3, 4), plt.imshow(img, cmap='gray'), plt.title('image'), plt.axis('off')
```

#### OpenCV 边界填充

`cv2.copyMakeBorder` 函数返回一个填充后的图像，填充方式由 `borderType` 参数决定，包括：
* `cv2.BORDER_CONSTANT` 使用额外参数 `value` 指定的常值填充；
* `cv2.BORDER_REFLECT` 将边界内像素反射到边界外；
* `cv2.BORDER_REFLECT101` 反射，但边界像素不再重复；
* `cv2.BORDER_REPLICATE` 直接沿伸边界像素；
* `cv2.BORDER_WRAP` 使用对边内的像素填充。

#### OpenCV 阈值化

```python
_, img = cv2.threshold(img, thresh, maxval, type)
```

其中 `type` 参数决定阈值化行为：

* `cv2.THRESH_BINARY`：大于 `thresh` 处赋值为 `maxval`，其余为 0；
* `cv2.THRESH_BINARY_INV`：大于 `thresh` 处赋值为 0，其余为 `maxval`；
* `cv2.THRESH_TRUNC`：大于 `thresh` 处赋值为 `thresh`，其余不变；
* `cv2.THRESH_TOZERO`：大于 `thresh` 处不变，其余赋值为 0；
* `cv2.THRESH_TOZERO_INV`：大于 `thresh` 处赋值为 0，其余不变。


#### OpenCV 图像滤波

均值滤波：卷积核为元素全为 1/mn 的矩阵。

```python
img = cv2.blur(img, (m,n))
```

高斯滤波：卷积核各元素以高斯分布决定。

```python
img = cv2.GaussianBlur(img, (m,n), sigmaX)
```

中值滤波：取周围某方形域中位数作为像素值

```python
img = cv2.medianBlur(img, n)
```

#### OpenCV 基础形态学操作

```python
kernel = cv2.getStructuringElement(shape, ksize)
img = cv2.morphologyEx(img, op, kernel)
```

参数 `op` 指定要进行的形态学操作：

* `cv2.MORPH_ERODE` 腐蚀：将核中最小值赋予锚点。亦可使用 `img = cv2.erode(img, kernel)`。
* `cv2.MORPH_DILATE` 膨胀：将核中最大值赋予锚点。亦可使用 `img = cv2.dilate(img, kernel)`。
* `cv2.MORPH_OPEN` 开运算：先腐蚀再膨胀，去除较小的暗处。
* `cv2.MORPH_CLOSE` 闭运算：先膨胀再腐蚀，去除较小的亮处。
* `cv2.MORPH_GRADIENT` 梯度运算：膨胀结果减去腐蚀结果。
* `cv2.MORPH_TOPHAT` 顶帽运算：原图像减去开运算结果。
* `cv2.MORPH_BLACKHAT` 黑帽运算：闭运算结果减去原图像。

#### OpenCV 边缘检测

##### Sobel 算子

```python
img = cv2.Sobel(img, ddepth, dx, dy)
```

`ddepth` 为输出图像的深度，可选 `cv2.CV_8U`、`cv2.CV_8S`、`cv2.CV_16U`、`cv2.CV_16S` 等。`dx` 与 `dy` 取 0 或 1，表示梯度的方向。`dx == 0`，`dy == 1` 时等价于

```python
sobely = np.array([
    [-1, -2, -1],
    [ 0,  0,  0],
    [ 1,  2,  1]
])
img2 = cv2.filter2D(img, ddepth, sobely)
```

##### Scharr 算子

```python
img = cv2.Scharr(img, ddepth, dx, dy)
```

和 Sobel 相似，其横向算子为

```
[[ -3 0  3]
 [-10 0 10]
 [ -3 0  3]]
```

##### Laplace 算子

```python
img1 = cv2.Laplacian(img, ddepth)
```

Laplace 算子相当于两方向 Sobel 二阶导数之和，其矩阵为

```
[[0  1 0]
 [1 -4 1]
 [0  1 0]]
```
