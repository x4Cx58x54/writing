# Broadcasting

Broadcasting of PyTorch tensors is very similar to that of NumPy arrays.

## Broadcastability

Two or more tensors are **broadcastable** if their shapes satisfy:

* none of them are empty;
* when iterated in reverse order, for one iteration, the dimension sizes are 1 or none, and the rest of them are equal.

To broadcast these tensors,

* align the shapes to the right;
* unsqueeze the tensors of fewer dimensionalities to equalize the shape lengths;
* copy the tensor along each dimension, to equalize the shapes.

For example:

```python
shapes = [
    (5, 3, 4, 6, 1, 9),
    (      4, 1, 1, 9),
    (   3, 1, 6, 8, 1),
]
print(   np.broadcast_shapes(*shapes))
#   (5, 3, 4, 6, 8, 9)
print(torch.broadcast_shapes(*shapes))
# torch.Size([5, 3, 4, 6, 8, 9])
```

Note that the `broadcast_shapes` methods raise an error if input shapes are not broadcastable.

```
(5, 3, 4, 6, 1, 9),
(   3,    1, 1, 9),
(   3, 1, 6, 8, 1),
       ^ not aligned right
```

```
(5, 3, 4, 6, 1, 9),
(      4, 1, 2, 9),
(   3, 1, 6, 8, 1),
             ^ 2 != 8 != 1
```

## Broadcast as views

A broadcast tensor/array is a view of the original one. Writing to a broadcast PyTorch tensor may bring unexpected effect:

```python
x = torch.tensor([1, 2, 3])
x_b = x.broadcast_to((2, 3))
x_b[0][0] = 4
print(x_b)
# tensor([[4, 2, 3],
#         [4, 2, 3]])
```

A broadcast NumPy array is not writable, if writing is needed, create a new array by copying:

```python
x = np.array([1, 2, 3])
x_b = np.broadcast_to(x, (2, 3))
print(x_b.flags)
# C_CONTIGUOUS : False
# F_CONTIGUOUS : False
# OWNDATA : False
# WRITEABLE : False
# ...
x_b_copy = x_b.copy()
x_b_copy[0][0] = 4
print(x_b_copy)
# [[4 2 3]
#  [1 2 3]]
```

## See Also

* <https://pytorch.org/docs/stable/notes/broadcasting.html>
* <https://numpy.org/doc/stable/user/basics.broadcasting.html>
