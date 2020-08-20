# C++

#### Pointers
```cpp
int* p;
int a = 10;
p = &a;
//*p equals to a
```
A normal pointer cannot point to a constant for this constant can be modified through the pointer.  

`void f(const int n)` variable n is a constant inside function.

`const float* p` pointer p is not a constant but it points to a constant.

`float *const p` address of p is a constant but the value is changable.

#### Void pointer
```cpp
int a = 0; int * p1 = &a;
void * p;
p = (void*) p1;
cout << *(int*)p;
```

#### Dynamic Memory  
```cpp
int * p = new int;
delete p;
int * p = new int[10];
delete [] p;
```
### Reference
```cpp
int a;
int & b = a;
```
`a` and `b` are two different names of one variable.

Notify that:

- essence: a constant pointer  
- changing adress **prohibited**
- reference of array or array elements **prohibited**
- reference of reference **prohibited**
- reference of pointer **prohibited**
- address of a reference: &b=&a

### Function
```cpp
void procedure(int param1, int param2)
{
    statements
    return;
}
```
#### Function and Pointer

The adress of a function is the name.

`double (*p) (int)`  
p is a pointer of a function.

Calling: `(*p)(5)` or `p(5)`

*note: `double *p(int)` is a normal function that returns a pointer* 

```cpp
int f(int* a)
{
    return *a;
}
...
f(&a);
```

#### Function and Reference
```cpp
void f(int& a)
```
The change of `a` is valid on the entire scoop of `a`

*note: when calling, f(x+3) is invalid*

#### Inline Function
Add `inline` before definition or prototype.  
Replace the code where the function is called, save time at the cost of memory.

If an inline function contains loop, switch or recursion, or the function is too large, `inline` will be ignored.

#### Default Parameters
#### Function Overloading
#### Array Parameters
```cpp
void arrf(int arr[], int x)
{
    return arr[x];
}
int main()
{
    int a[10] = {0};
    cout << arrf(5);
}
```

### Const
```cpp
const int x = 0;
```

### Templates

#### Function Templates
```cpp
template <class T>
T sum(T a, T b)
{
    return a + b;
}
```

#### Class Templates
```cpp
template <class T>
class circle
{
    ...
};
```

#### Template Specialization
To specify a different behavior for some data types.  
```cpp
template <class T>
class circle
{
    ...
};

template <>
class circle <char>
{
    ...
};
```

### Exceptions
```cpp
if (condition)
{
    throw expression;
}
```
```cpp
try
{
    ...
    if (condition)
    {
        throw expression;
    }
}
catch (int x)
{
    statements
}
```

### Files

### Derived Data Types

#### Struct
```cpp
struct struct1
{
    int varint;
    double vardouble;
};
...
struct1 x;
x.varint = 0;
//initialization
struct1 y = {0, 0.0};
```

#### Union
*Union types can save memory*  
```cpp
union union1
{
    int varint;
    double vardouble;
};
```

#### Enum
```cpp
enum spectrum {r, o, y, g, b, v, i, u};
```


## Object-Oriented Programming

*Abstraction, Encapsulation, Inheritance, Polymorphism*  

### Object Basics, *Abstraction* and *Encapsulation*

```cpp
class circle
{
    public:
        string name;
        double r()
        {
            return radius;
        }
        void showname();
    private:
        double radius;
};
...
circle::showname()
{
    cout << name;
    return;
}
```

#### Access Specifiers
*`public, protected, private`*  
`Public` methods can be accessed anywhere within the scope;  
`protected` methods can only be accessed by derived classes and the methods within the class;  
`private` methods can only be viewed from within the class.


#### Constructor and Destructor
```cpp
class circle
{
    public:
    circle(double r0 = 0)
    {
        radius = r0;
        return;
    }
    ~circle()
    {
        return;
    }
};
```

#### Copy Constructor
calling:

- when creating an object using another one
- when acting as an parameter and the function copies it
- when a function that returns an object
- **not** when assigning value

default: `classname obj1(obj)` copying all members of obj to obj1

```cpp
class classname
{
    public:
        int a;
        classname(const classname& obj)
        {
            a = obj.a;
        }
};
```
Reference is a **must**.  
`const` ensures that obj is not modified.

#### Object Array
```cpp
classname objname[2] = {1, 2};
```
*parameters of constructor* 

#### Constant Object
```cpp
const ClassName ObjName;
```

#### Constant Member Function
```cpp
void ClassName::FunctionName() const
{
    statements
}
```
cannot change any values and connot access non-static member functions

calling:
```cpp
const FunctionName();
```

#### Conatant Member Variables
must be initialized in constructor

#### Member Initializers
```cpp
class circle
{
    public:
        double radius;
        double color;
        circle (int r, int c): radius(r), color(c) {}
};
```

#### Friend
```cpp
class circle
{
    private:
        int radius;
    friend void r(circle &c);
};
void r(circle &c)
{
    cout << c.radius;
    return;
}
```

#### This

#### Static Member
One member shared by the whole class.
Notify that:

- `sizeof()` excludes static members
- not belonged to any specific object
- `classname::staticmem` or `obj.mem` 
- must be initialized in the file which contains the definitions of the class
- initialized outsice the class `int classname::staticvar=0;`
- cannot access non-static members

#### Operator Overloading
5 operators that cannot be overloaded: `.  *  ::  sizeof  ?:`  

```cpp
//As member function
class Complex
{
    double real;
    double imag;
    Complex operator+(const Complex&);
    friend Complex operator-(const Complex& c1, const Complex& c2);
};
Complex Complex::operator+(const Complex& c2)
{
    statements
    return value;
}
```
```cpp
//As friend function
Complex operator-(const Complex& c1, const Complex& c2)
{
    statements
    return value;
}
```
```cpp
//prefix operator
friend Complex operator ++ (Complex&);
Complex operator ++();

//suffix operator
friend Complex operator --(Complex&, int);
Complex operator --(int);
```
```cpp
//data type convert
//as member function, no parameter, no return
operator double()
{
    return real;
}
```
```cpp
//stream
istream& operator >>(istream&, Complex&);
```

### *Inheritance*

```cpp
class Base
{
    ...
};
class Derived: public Base
{
    ...
};
```
A derived class inherits all base methods with the following exceptions:

- Constructors, destructors
- Overloaded operators
- The friend functions

#### Type of inheritance

*`public, protected, private`*

- Public inheritance
    - public -> public
    - protected -> protected
- Protected inheritance
    - public -> protected
    - protected -> protected
- Private inhertance
    - public -> private
    - protected -> private

#### Constructors and destructors
While creating a derived object: 
1. Call base constructor.
2. Call derived constructor.  

While deleting a derived object:
1. Call derived destructor.
2. Call base destructor.

```cpp
//Constructor
derived::derived(arglist): base(arglist);
```

#### Compatibility

In public inhertance, a object/reference/pointer of a derived class can be assigned to a base one.

### *Polymorphism*

A member of base class can be overloaded. The derived one will be called in default unless `base::` is used.

#### virtual function

Whether a derived or base one to call depends on the type of pointer/reference.
```cpp
class base
{
    public:
        virtual void f(int);
};
class derived: public base
{
    public:
        void f(int);
};
...
base * p;
base b;
derived d;
p = &b;
p->f(0);
p = &d;
p->f(0);
```

#### Virtual Destructor
```cpp
base * p = new derived;
delete p;
//Only destructor of base called.
```
if `virtual ~base(){}`, derived destructor called.
