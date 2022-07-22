# Python Type Hints[^1]

[^1]: [typing — Support for type hints](https://docs.python.org/3/library/typing.html){: target="_blank"}

Pylance supports type checking, and there is a dedicated type check: mypy.

Type hints incur negligible losses of efficiency at run time.

### Basic type names and custom class names

```python
import numpy as np

x: np.ndarray = np.zeros((3, 3))

def f(a: int, b: int) -> int:
    return a + b
```

### Recursively defined class

Use string literals instead to avoid forward references.

```python
class Node:
    def __init__(self, parent: "Node")
```

### Built-in data types

=== ">= Python 3.9"

    ```python
    x: list[int] = [0, 1]
    y: dict[str, int] = {"a": 1, "b": 2}
    ```

=== "< Python 3.9"

    ```python
    from typing import List, Dict

    x: List[int] = [0, 1]
    y: Dict[str, int] = {"a": 1, "b": 2}
    ```

### Abstractions for built-in data types[^2]

[^2]: [Collections Abstract Base Classes - collections.abc — Abstract Base Classes for Containers](https://docs.python.org/3/library/collections.abc.html#collections-abstract-base-classes){: target="_blank"}

=== ">= Python 3.9"

    ```python
    from collections.abc import Sequence

    x: Sequence[int]

    x = [0, 1]
    x = (0, 1)
    x = range(2)
    x = b'01'
    ```

=== "< Python 3.9"

    ```python
    from typing import Sequence

    x: Sequence[int]

    x = [0, 1]
    x = (0, 1)
    x = range(2)
    x = b'01'
    ```

### Multiple types

=== ">= Python 3.10"

    ```python
    x: int | None
    ```

=== "< Python 3.10"

    ```python
    from typing import Union

    x: Union[int, None]
    x = 1
    x = None
    ```

### Optional argument

```python
from typing import Optional

def f(x: Optional[int]):
    pass
```

Equivalent to `int | None`

### Any type, explicitly

```python
from typing import Any

x: Any = 0
```

### No return

`NoReturn` indicates the function raises an exception or the program quits.

```python
from typing import NoReturn

def quit() -> NoReturn:
    raise Exception

quit()
x = 0 # dead code
```

### Callable

```python
from typing import Callable

x: Callable = int
```

A slightly complicated example where arguments and returns of the callable are specified:

```python
from typing import Callable
from time import time

def timer(f: Callable[[int, int], int]):
    def wrapper(a: int, b:int) -> int:
        start = time()
        res = f(a, b)
        duration = time() - start
        print(f'{duration=:.6f}')
        return res
    return wrapper

@timer
def add(a: int, b: int) -> int:
    return a + b
```

### Literal, literally

```python
from typing import Literal

gender: Literal['m', 'f']

gender = 'm'
gender = 'f'
```

### Type alias

=== ">= Python 3.10"

    ```python
    from typing import Literal, TypeAlias

    GenderType: TypeAlias = Literal['m', 'f']

    g: GenderType = 'm'
    gender = g
    ```

=== "< Python 3.10"

    ```python
    from typing import Literal

    GenderType = Literal['m', 'f']

    g: GenderType = 'm'
    gender = g
    ```

### New type

While type alias may provide extra information about variables, different aliases of a same type are identical. A distinct type can be created through `NewType` as if it were a subclass of the original type.

```python
from typing import NewType

IdType = NewType('IdType', int)
AgeType = NewType('AgeType', int)

id: IdType = IdType(1)
age: AgeType = AgeType(1)
```

### Generics, type template

```python
from typing import Sequence, TypeVar

T = TypeVar('T')
def f(seq: Sequence[T]) -> T:
    return seq[0]
```
