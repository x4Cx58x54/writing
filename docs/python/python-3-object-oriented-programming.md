# Python 3 Object-oriented Programming

>*Second Edition*  
*Dusty Phillips*  
*Python 3 面向对象编程（第二版 影印版）*  
*2015, Packt Publishing Ltd., 2017, 东南大学出版社*  

---

## Chapter 1: Object-oriented Design

An *object* is a collection of *data* and associated *behaviours*.


## Chapter 2: Objects in Python

#### 建立类
```python
class <ClassName>:
    <declarations, definitions>
```

#### 成员函数
```python
def <FunctionName>(self <, arglist>):
    <statements>
```
第一个参数是当前对象自身，相当于 C++ 的 `this`. 根据惯例，命名为 `self`.

#### Initializer

类的 Initializer 函数名为 `__init__`，可接受参数.

还有一类构造函数 Constructor，函数名为 `__new__`，只接受一个参数，返回当前构造的对象. 但是该构造函数并未广泛使用.

#### 模块 | Module

将一些相关的类放入一个单独的文件（称为模块）中. 则在其它文件中可以使用 `import` 来引用其中的类.

若 `database.py` 下有 `Database` 与 `Query` 类，则有以下引用方式：

```python
import database
db = database.Database()

from database import Database, Query
db = Database()
```

#### Package

将一类模块放入文件夹，并创建 `__init__.py`，则这个文件夹就被称为 package.

假设将上述 `database.py` 放入 `ecommerce` 中，则可通过以下方式引用：

```python
# Absolute imports
import ecommerce.database
db = ecommerce.database.Database()

from ecommerce import database
db = database.Database()

from ecommerce.database import Database
db = Database()
```

```python
# Relative imports

from .database import Database # 当前文件与被引部分在同文件夹

from ..database import Database # 当前文件在被引部分的同级文件夹下

...
```

在 `__init__.py` 中亦可引用. 则在引用到此模块时自动可以执行其中的 `import`.

#### 变量封装

Python 没有变量访问权限机制. 按惯例，仅供内部使用的成员应加上 docstring 并且以下划线 `_` 开头. 若需要更强的隐藏，则可以以双下划线开头. 则在类外将隐藏此成员，但是仍可以用 `_<classname>__<membername>` 强制调用.

#### 类变量和实例变量

```python
class P:
    a = 1
    def __init__(self):
        self.b = 2
```

其中 `a` 为类变量，为类与各实例所共有，可通过类访问，也可通过实例访问. `b` 则为实例变量，为每个实例所有. 注意若通过实例改变 `a` 的值，实际上是在对同名的实例变量进行操作.

## Chapter 3: When Objects Are Alike

#### 继承

```python
class Student(People):
    pass
```

所有的类都继承自 `object` 类.

#### 重载成员函数

子类对父类的重载不需要其他说明，直接在子类定义中重写即可. 为避免代码冗余，可以在子类定义中调用父类成员函数.

```python
class Student(People):
    def __init__(self, name, sid):
        super().__init__(self, name)
        self.sid = sid
```

#### 多继承

直接在父类表中表明多个父类即可. 在调用父类成员函数时可以使用父类名：

```python
...
        People().__init__(self, name)
```

若一个多继承中父类都继承自一个类，则可能出现一个方法被调用多次的情况，这时只要在引用父类方法时使用 `super()` 即可. 实际上一般情况下对父类的引用都统一使用 `super()`.

若多继承重载的方法中出现了参数不同的情况，较好的解决方法是统一在参数表后加上 `**kwargs`，将可能出现的多余参数存入该字典.

#### 多态

#### 鸭子类型 | Duck Typing

使用鸭子类型可以巧妙地用另一种手段实现多态，也可避免多继承. 即在不同的类中用不同的方式实现同名函数.

#### 抽象类 | **A**bstract **B**ase **C**lass

```python
import abc

class Fruit:
    @abc.abstractmethod
    def ...

    @abc.abstractproperty
    def ...

    @classmethod
    def ...

    return NotImplemented
```

## Chapter 4: Expecting the Unexpected

#### Raise An Exception

```python
raise Exception("Msg")
raise TypeError("Msg")
raise ValueError("Msg")
raise ZeroDivisionError
raise # Re-raise the last exception
```

#### Try-Except

```python
try:
    <statements>
except:
    <statements_called_on_exception>
else:
    <statements_called_without_exception>
finally:
    <statements>
```

```python
try:
    <statements>
except ZeroDivisionError as zde:
    <statements>
    print(zde.args)
except (TypeError, ValueError):
    <statements>
except Exception: # Other exceptions
    <statements>
```

所有的异常都继承自 `BaseException`，而其中绝大多数又都是 `Exception` 的子类. 例外的两例是在程序退出时触发的 `SystemExit` 和 `KeyboardInterrupt`.

#### 自定义异常

```python
class MyError(Exception)
    pass
```
`Exception` 类的构造函数将参数传入 `args` 的元组当中，一般不需重载.

#### 异常处理原则

先执行完代码再处理异常，以免白白探测异常.

## Chapter 5: When to Use Object-oriented Programming

设计类的时候需要衡量它是否值得建模.

DRY 原则：*Don't Repeat Yourself.*

#### Property

`Property` 将一个类的 getter, setter, deleter 化为属性.

```python
class People:
    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, value):
        self._name = value

    @name.deleter
    def name(self):
        del self._name
```

等价于

```python
class People:

    def _get_name(self):
        return self._name

    def _set_name(self, value):
        self._name = value

    def _del_name(self):
        del self._name

    name = property(_get_name, _set_name, _del_name, 'docstring')
```

则 `name` 返回其值，`name = 'abc'` 为其赋值，`del name` 删除之.

由于成员函数一般使用动词，在以上操作时显得麻烦，故可以将其化作 property，变为名词，简化程序.

## Chapter 6: Python Data Structures

#### 空对象

可以建立最原始的对象实例

```python
o = object()
```

但是不能为这个实例添加成员，因为 `object` 类受到了 `slots` 的限制

#### 元组 | Tuple

元组一经创建，无法改变. 元组可以同时存储不同的类型.

```python
t1 = 1, 2, "123"
t2 = (1, 2, "123")
```

元组可以直接解包至变量，也可按序号访问：
```python
v1, v2, v3, v4 = t1
t1[2]
t1[1:3]
```

#### `namedtuple`

```python
from collections import namedtuple
Stock = namedtuple("Stock", "symbol current high low")
stock = Stock("FB", 75.00, high=75.03, low=74.90)
```

相同地，namedtuple 也可以解包，但它提供一种更方便的方式：

```python
stock.current
```

#### 字典 | Dictionary

```python
emptydict1 = dict()
emptydict2 = {}
stocks = {"GOOG": 613.30, "MSFT": 30.25}
stocks["GOOG"]
```

若访问的键不存在，则会出现 `KeyError` 错误. 可以使用 `get()` 方法

```python
stocks.get("GOOG")
stocks.get("MSFT", "No Result")
```

若键不存在，则返回 `None`，或者返回给定的默认值（第二个参数）.

```python
stocks.setdefault("GOOG", 0)
```

`setdefault` 也返回键对应的值，若键不存在，则以此键和默认值建立新项.

除了列表和字典，字典可以有多种键类型，包括对象. 甚至在同一字典中可以同时有多种键.

`keys()`、`values()`、`items()` 三个方法分别返回键、值和键值对元组的迭代器，可以将它们像列表一样使用，它们在 `for` 循环中尤其有用.
```python
for key, value in stock.items():
    pass
```

#### `defaultdict`

```python
from collections import defaultdict
letter_frequency = defaultdict(int)
```
`defaultdict` 的构造函数接受一个函数作为参数，如果字典内没有访问的键，则以这个函数的返回值作为默认值. 这里的函数是 `int`，`int` 类无参数调用时返回的是 0. 如果想创建一个空列表则可以用 `list`. 当然可以自定义函数.

#### `Counter`

```python
from collections import Counter
def letter_frequency(sentence):
    return Counter(sentence)
```

`Counter` 是专门用于计数的字典子类. 它的键为计数对象，值为计数结果. 亦可将一个列表传入其中.

`most_common` 返回计数最高的列表

```python
Counter(sentence).most_common(1)[0][0]
```

#### 列表 | List

列表一样可以同时存储多种类型的数据，但是一般不这样做.
下列为列表的方法：

* `append(e)`
* `insert(index, e)`
* `count(e)`
* `index(e)` 返回元素的序号，若找不到则报错
* `find(e)` 返回元素序号，找不到则返回 -1
* `reverse()`
* `sort()`

`sort()` 方法将字符串按 ASCII 顺序排序，将数字按升序排序，如果列表不能排序，则返回 `TypeError`. 可以通过成员函数 `__lt__`（less than）定义序. 如果 `self` 比传入参数小，则返回 `True`.

如果需要更完整的序，则需要定义 `__lt__`、`__gt__`、`__eq__`、`__ne__`、`__le__`、`__ge__`. 借助 `total_ordering` 可以简化定义，只需要 `__lt__` 和 `__eq__` 就可以自动生成其余比较函数.

```python
from functools import total_ordering
@total_ordering
class SortList:
    ...
```
`sort()` 方法的 `key` 参数接受一个比较函数.

#### 集合 | Set

```python
s=set()
s={1, 3, 's'}
s.add("this")
```

建立空集只有一种语法. 相同地，集合可以存储多种类型，除了列表和字典. 集合是无序的，遍历使不一定以存入的顺序输出. 若需要排序，可以将其转换为列表 `list(s)`

下列为集合操作方法：接受集合为参数，作为被操作集合

* `union(s)`
* `intersection(s)`
* `symmetric_difference(s)`
* `issubset(s)`
* `issuperset(s)`
* `difference(s)`

#### 内置方法

可以使用 `dir(obj)` 来查看其所有内置方法名. 由此可以重载运算符.

#### 队列

队列有 FIFO，LIFO 和优先队列三种，它们有共同的 API

```python
from queue import Queue, LifoQueue, PriorityQueue
queue = Queue()
stack = LifoQueue()
pqueue = PriorityQueue()
```

构造函数参数有 `maxsize`

方法有
* `get()`
* `put()` （对以上两个方法，若参数 `block=False`，则在操作失败时报错）
* `full()`
* `empty()`

优先队列的使用稍有不同，它首先弹出的数据是队列中优先级最高的数据. 优先级最高被定义为升序排序的最前位. 一般使用元组作为队列元素，元组的第一项表征优先级，第二项才是数据. 另一种方法是定义队列的 `__lt__` 方法.

## Chapter 7: Python Object-oriented Shortcuts

#### 内置函数 | Built-ins

* `len(obj)` 相当于 `obj.__len__()`，返回对象的长度.
* `reversed(obj)` 相当于 `obj.__reversed__()`，返回序列对象的逆序. 在倒序 `for` 循环中有广泛应用.
* `enumerate(obj)` 将序列转换为元组的序列，第一项为序号（0 开始），第二项为原项. 在 `for` 循环中计数中有重要应用.

* `all(obj)` 接受一个可迭代对象，如果其中所有项均为真（或为非零数/非空串、表/非 `None` 值）则返回 `True`.
* `any(obj)` `all` 的“任一”形式.
* `eval(str)`, `exec(str)`, `compile(str)` 执行字符串的语句内容.

这些内置函数都在 `dir(__builtins__)` 中.

#### 文件读写

`open(filename, mode)`

* `read()` 不加参数则读入整个文件，加入则读入指定字节.
* `readline()` 读入一行.
* `readlines()` 返回每一行的列表. 一般用 `while` 读入.

相同地，有 `write()` 和 `writeline()`.

```python
with open(filename) as f:
    ...
```

`with` 语句执行前调用 `__enter__()` 方法，退出前调用 `__exit__()` 方法，不管是否发生异常. 用此语句可以代替 `try-except` 语句. 自定义类以匹配 `with`：

```python
class StringJoiner(list):
    def __enter__(self):
        return self
    def __exit__(self, type, value, tb):
        self.result = "".join(self)
```

#### 不定参数

参数表中使用 `*varargs` 将多参数存入列表 `varargs`中. `**kwargs` 存入字典中. 相同地，可以在调用时使用列表或者字典来传递显式声明的参数.

#### 函数对象

函数也是对象.

* `__name__` 属性返回函数名
* `__description__` 属性返回说明
* `__class__` 属性返回类型

函数可作为参数传入另一函数，可以以参数形式被调用.

类的成员函数本身也可作为属性. 可以将函数赋值给一个成员函数.

#### 调用对象

定义类的 `__call__` 成员函数，可以使类的实例可被调用.

## Chapter 8: Strings and Serialization

#### 字符串操作

`str` 类中有大量字符串操作. 使用 `dir` 和 `help` 查看其中具体方法：

* `isalpha`
* `isupper` / `islower`
* `startswith` / `endswith`
* `isapace` 对所有空白字符返回真
* `istitle` 若所有单词均首字母大写则返回真
* `isnumeric` / `isdigit` / `isdecimal`

* `count`
* `find` / `rfind`
* `index` / `rindex`

* `upper` / `lower`
* `capitalize`
* `title`

* `translate` 使用字典逐词翻译

* `split` / `rsplit` 将字符串按分隔符分为列表
* `partition` / `rpartition` 在第一个出现的分隔符处分开，分为元组 `(前, 分隔符, 后)`
* `join`
* `replace`

#### 字符串格式化 `format` 方法

用双写表示花括号.

```python
print("{} {label} {}".format("x", "y", label="z"))
print("{0[1]} {0[2]}".format(["12", "34"]])
```
同理适用于多层数据结构和对象.

#### 字符串编码

Python 3 使用 Unicode 字符.

`b` 表示字符串内容直接以字节存储.

使用 `decode` 和 `encode` 方法进行转换.

```python
s = b'字符串'
print(characters.decode("UTF-8"))
```

`bytearray` 类相当于一个存储字节的列表，可修改.
```python
b = bytearray(b"abcdefgh")
b[4:6] = b"\x15\xa3"
```

#### 正则表达式

字符匹配的一般模式式将主字串 `string` 与模式 `pattern` 匹配. 若匹配成功，则 `match` 返回一个 `re.match`，否则返回 `None`. 主串是一般的字符串，模式的形式则用正则表达式.

```python
import re
if re.match(pattern, string):
    print("Regex matches.")
```

* 一般匹配：若主串以模式串开头，则匹配成功.
* 首尾字符：`^` 代表字符串首，`$` 代表字符串尾.
* 通配符（wildcard）：`.` 代表任*一个*字符.
* 字符类：`[]` 方括号中的字符代表匹配其中的任*一个*. 若要表示一个范围内的字符，可用 `[a-z]` 表示范围. 如 `[b-x]`、`[a-zA-Z0-9]`.
* 转义字符：`\.` 匹配句点本身，以上特殊字符同理. `\n` 匹配换行符 `newline`，`\t` 匹配缩进符 `Tab`，`\d` 匹配单个数字，`\s` 匹配空白字符，`\w` 匹配字母+数字+下划线.
* 重复匹配：在一个模式后加上 `*` 代表匹配这个模式零或任意多次. `+` 代表匹配任意多次，`?` 代表匹配零或一次，`{n}` 代表匹配 n 次. 可以将模式用圆括号分组，以重复多个模式. 特别地，多次匹配 `[]` 是先匹配各次而不是先匹配再重复.

`search()` 方法和 `match()` 方法类似，但是放宽了从主串开头开始匹配的要求，相当于在模式串前加上 `'^.*'`. `findall()` 则是返回不重叠的所有满足子串，它的接口较为复杂.

```python
import re
m = re.match(pattern, string):
print(m.groups()[0])
```
`match` 方法返回的对象中有 `groups()` 方法，返回的是一个元组，按顺序包含了正则表达式中所有的分组即用小括号中所匹配的字符. 若分组中又有分组，则返回顺序以左括号出现顺序为准.

#### 序列化

`pickle`模块将对象序列化，打包至文件中以便存储、传输.

```python
import pickle
with open("pickled_list", 'wb') as file:
    pickle.dump(some_data, file)
with open("pickled_list", 'rb') as file:
    loaded_data = pickle.load(file)
```

## Chapter 9: The Iterator Pattern

#### Iterators

若类含有成员函数 `__iter__`，那么此类称为可迭代的. `__iter__` 返回一个迭代器，该迭代器应当定义 `__next__` 成员函数，该函数每次返回一个迭代值. 迭代器类应当也是可迭代的，即需要有成员函数 `__iter__`，返回值为 `self`.

```python
class WordsIterable():
    def __init__(self, string):
        self.string = string
    def __iter__(self):
        return WordsIterator(self.string)

class WordsIterator():
    def __init__(self, string):
        self.words = string.split(' ')
        self.ind = 0
    def __len__(self):
        return len(self.words)
    def __iter__(self):
        return self
    def __next__(self):
        if self.ind >= len(self):
            raise StopIteration
        res = self.words[self.ind]
        self.ind += 1
        return res

for w in WordsIterable('the quick brown fox'):
    print(w)
```

#### Generators

最简单的生成 generator 的方式是使用圆括号版本的 list comprehension，如

```python
g = (i for i in l)
```

如果在一个函数中使用 `yield` 关键字，那么该函数实际上生成一个 generator，每一次执行至 `yield` 时，该函数会返回该值并且停留在该状态，在下次迭代时继续执行. 这是一种特殊的迭代器，无需建立一整个类进行描述，无需保存所有迭代结果，也无需保存当前状态，只需要使用 `yield` 返回值.

```python
def words(sentence):
    for word in sentence.split(' '):
        yield word

ws = words('the quick brown fox')
print(next(ws))
print(next(ws))
```

特别地如果需要从另一个 generator 返回值，则可以使用 `yield from`.

#### Coroutines

```python
def tally():
    score = 0
    while True:
        increment = yield score
        score += increment

team_red = tally()

next(team_red)
print(team_red.send(1))
print(team_red.send(2))
```

该函数生成的是一个 coroutine，其执行逻辑为

1. 创建该 coroutine 后使用 `next` 或 `.send(None)` 执行至 `yield` 语句处，暂停.
2. `.send` 方法将值传入，并赋值给表达式左边，方法返回右值.
3. 继续执行直至 `yield` 语句.

## Chapter 10, 11: Python Design Patterns

#### The decorator pattern

```python
def logging(func):
    print(f'Calling function {func.__name__}.')
    return func

def add(a, b):
    return a + b

print(logging(add)(1, 2))
```

在以上例子中，如果每次调用 `add` 函数都需要嵌套一层 `logging`，即调用 `logging(add)`，那么可以改写为

```python
...
@logging
def add(a, b):
    return a + b

print(add(1, 2))
```

一个更复杂的例子是

```python
import time

def logging(func):
    def wrapper(*args, **kwargs):
        print(f'Calling function {func.__name__}.')
        start = time.time()
        res = func(*args, **kwargs)
        end = time.time()
        print(f'Executed function {func.__name__} in {end-start} ms.')
        return res
    return wrapper

@logging
def add(a, b):
    return a + b

print(add(1, 2))
```

#### The observer pattern

在某属性更新时，通知正在观察该属性的对象

```python
class ConsoleInventoryObserver():
    def __init__(self, inventory):
        self.inventory = inventory
    def update(self):
        print(f'Change noticed: {self.inventory.product}.')

class Inventory():
    def __init__(self):
        self._product = None
        self._quantity = 0
        self.observers = []
    def add_observer(self, observer):
        self.observers.append(observer)
    def _update_observers(self):
        for observer in self.observers:
            observer.update()
    @property
    def product(self):
        return self._product
    @product.setter
    def product(self, val):
        self._product = val
        self._update_observers()

inv = Inventory()
obs = ConsoleInventoryObserver(inv)
inv.add_observer(obs)
inv.product = 'widget'
```

#### The strategy pattern and the state pattern

These two patterns are similar, and has identical implementation. But a strategy is chosen for one use case once, and a state is chosen multiple times dynamically.

```python
class LeafNode():
    def process(self):
        ...

class RootNode():
    def process(self):
        ...

class InternalNode():
    def process(self):
        ...

class Parser():
    def __init__(self, sequence):
        self.sequence = sequence
        self.state = RootNode()
    def process(self):
        self.state.process(self)
        ...
```

#### The singleton pattern

成员函数 `__new__` 在对象创建时执行（`__init__` 在对象创建之后立即执行），重载 `__new__`，保证类仅含一个实例：

```python
class OneOnly():
    _singleton = None
    def __new__(cls, *args, **kwargs):
        if cls._singleton is None:
            cls._singleton = super(OneOnly, cls).__new__(cls, *args, **kwargs)
        return cls._singleton
```

#### The template pattern

```python
class ActionsTemplate():
    def action1(self):
        raise NotImplementedError()
    def action2(self):
        raise NotImplementedError()
    def action3(self):
        raise NotImplementedError()
    def actions(self):
        self.action1()
        self.action2()
        self.action3()
```

