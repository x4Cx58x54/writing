# The Practice of Programming

>*Brian W. Kernighan, Rob Pike*  
*程序设计实践*  
*1999, Addison Wesley, 2016, 人民邮电出版社*  

---

## Style

### Names

**Use discriptive names for globals, short names for locals.**  
全局变量的名字应该能比较完整地描述其功能。每次使用时，较长的变量明能够提醒程序员这是全局量。同时，局部变量则应当简洁，比如循环变量一般使用 `i` 而不是 `theElementIndex`。Clarity is often achieved through brevity.  

还有一些命名惯例。比如指针以 `p` 结尾，全局量首字母大写，常量全部字母大写。

**Be consistent.**  
在命名用词上尽量保持统一并且简洁。

**Use active names for functions.**

**Be accurate.**

### Expressions and Statements

**Indent to show structure.**

**Use the natural form for expressions.**

**Parenthesize to resolve ambiguity.**  
即使不需要括号来改变运算顺序，但是还是可以加上括号来增加可读性，如

```c
leap_year = ((y%4 == 0) && (y%100 != 0)) || (y%400 == 0);
```

**Break up complex expressions.**

**Be clear.**  
可以通过一些运算简化表达式。尤其是使用 `?:` 运算符的时候要特别注意。这个运算符一般用于
```c
max = (a > b) ? a : b;
```
```c
printf("The list has %d item%s\n", n, n==1 ? "" : "s");
```

**Be careful with side effects.**  
当然 `++` 这类运算符是典型的例子。任何改变变量内容的复杂操作都需要注意，如
```c
scanf("%d %d", &n, &a[n]);
```
```c
int read(int *ip)
{
    scanf("%d", ip);
    return *ip;
}
f(read(&a), read(&b));
```

### Consistency and Idioms

**Use a consistent indentation and brace style.**  
还要注意 “dangling else” 的经典错误。

**Use idioms for consistency.**  
一些常用的操作有约定的的写法，比如遍历数组和链表、无限循环、读取字符。为字符数组开辟空间的写法是
```c
p = malloc(strlen(buf)+1);
strcpy(p, buf);
```
这是由于 `strlen` 不会计入末尾 `\0`，而 `strcpy` 会复制之。

**Use else-ifs for multiway decisions.**

### Function Macros

**Avoid function macros.**

**Parenthesize the macro body and arguments.**

### Magic Numbers

**Give names to magic numbers.**  
一般来说除了 0 和 1，所有的数都是 magic number，它们都应该有名字。

**Define numbers as constants, not macros.**

**Use character constants, not integers.**

**Use the language to calculate the size of an object.**

### Comments

**Don't belabor the obvious.**

**Comment functions and global data.**

**Don't comment bad code, rewrite it.**

**Don't contradict the code.**

**Clarify, don't confuse.**  
注释应当语言简洁。如果需要的注释非常繁杂，这说明代码可能需要重写。如果函数是语言标准的内容，尽量引用之。

## Design and Implementation

### The Markov Chain Algorithm

### Data Structure Alternatives

## Interfaces

### Interface principles

**Hide implementation details.**  
The implementation behind the interfaces should be hidden from the rest of the program.

**Choose a small orthogonal set of primitives.**  
The functions provided by an interface should not overlap excessively in their capabilities. And use a narrow interface: do one thing and do it well.

**Don't reach behind the user's back.**

**Do the same thing the same way everywhere.**

### Resource Management

**Free a resource in the same layer that allocated it.**

### Abort, Retry, Fail?

**Detect errors at a low level, handle them at a high level.**

**Use exceptions only for exceptional situations.**

## Debugging

### Good Clues, Easy Bugs

**Look for familiar patterns.**

**Examine the most recent change.**

**Don't make the same mistake twice.**

**Debug now, not later.**

**Get a stack trace.**

**Read before typing.**  
Resist the urge to start typing, because chances are that you do not know what's really broken, and will change the wrong thing or even break other code. Take a break for a while; sometimes what you see in the source code is what you meant rather than what you wrote.

**Explain your code to someone else.**

### No Clues, Hard Bugs

**Make the bug reproducible.**

**Divide and conquer.**

**Study the numerology of failures.**

**Display output to localize your search.**

**Write self-checking code.**

**Write a log file.**

**Draw a picture.** 
Visualize the statistic of errors.

**Use tools.**

**Keep records.**

## Last Resorts

If none of those advices above helps, it may be time to use a good debugger to step through the program. If your mental model of how something works is just plain wrong, so you're looking in the wrong place entirely, or looking in the right place but not seeing the problem, a debugger forces you to think differently.

For example, one often forget that `&` and `|` have lower precedence than `==` and `!=`:
```c
if (x & 1 == 0)
```

Sometimes it's the compiler vendor's fault:
```c
#define isprint(c) ((c) >= 040 && (c) < 0177)
...
while (isprint(c = getchar()))
```

### Non-reproducible Bugs

Check whether all variables have been initialized.

If the bug changes behaviour when debugging code is added, it may be a memory allocation error.

Overwriting memory by storing into memory location that isn't used until much later leads to curious bugs. For example, returning the address of a local variable.

## Testing

Debugging is what you do when you know that a program is broken. Testing is a determined, systematic attempt to break a program you think is working.

### Test as You Write the Code

**Test code at its boundaries.**

**Test pre- and post-conditions.**  
To verify that expected or necessary properties hold before and after some piece of code executes.

**Program defensively.**  
To handle "can't happen" cases.

**Check error returns.**

### Systematic Testing

**Test incrementally.**  
Testing should go hand in hand with program construction.

**Test simple parts first.**

**Know what output to expect.**  
Make sure there's something to compare with, and if there's an inverse, check if it recovers input.

**Verify conservation properties.**  
For example, the number of insertions into a data structure minus the number of deletions must equal the number of elements contained.

**Compare independent implementations.**  
Write a trivial program to use as slow but independent comparison.

**Measure test coverage.**  
Make sure that every statement has been executed during the test.

### Test Automation

**Automate regression testing.**  
A testing script in Perl:
```perl
for i in data.*
do
    old $i > out1
    new $i > out2
    if ! cmp -s out1 out2
    then
        echo $i: BAD
    fi
done
```

### Stress Test

Test using high volumes of input, data that is too large, or random and not necessarily legal inputs.

### Tips for Testing

Check array bounds.

Make the hash function return a constant to test the chaining mechanism and worst-case performance.

Write a version of your storage allocator that intentionally fails early, to test your code for recovering from out-of-memory errors.

Before shipping the code, disable the testing code that will affect performance.

Initialize arrays and variables with some distinctive value rather than common zero.

Vary your test cases.

Don't keep in implementing new features or even testing existing ones if there are known bugs; they could be affecting the test results.

Test on multiple machines, compilers and operating systems.

## Performance

### Timing and Profiling

**Automate time measurement.**  
On UNIX systems, use `time` command, or construct a timing scaffold. Remember to time the programs as any improvement are being made.

**Use a profiler.**  
A profile is a measurement of where a program spends its time. On UNIX, the command is `prof`.

**Concentrate on the hot spots.**

**Draw a picture.**

### Strategies for Speed

**Use a better algorithm or data structure.**

**Enable compiler optimizations.**  
Rerun the regression test suite after optimization as aggressive optimization may introduce bugs.

**Tune the code.**  
Adjust the details of loops and expressions. For example, avoid unnecessary recalculations.

**Don't optimize what doesn't matter.**

### Tuning the Code

Bear in mind that good compilers will do some optimizations for you and you may impede their efforts by complicating the program. Whatever you try, measure its effects, and make sure you break nothing using a regression test.

**Collect common subexpressions.**

**Replace expensive operations by cheap ones.**

**Unroll or eliminate loops.**

**Cache frequently-used loops.**

**Write a special-purpose allocator.**  
Often a hot spot in a program is memory allocation, and substantial speedups are possible by making one call to `malloc` to fetch a bug chunk of space and handing them out one at a time as needed.

**Buffer input and output.**

**Handle special cases separately.**

**Precompute results.**  
For example, if a system needs to repeatedly compute sine but only for integer degrees, precompute a table and index into it as needed.

**Use approximate values.**  
If accuracy isn't an issue, use lower-precision data types.

**Rewrite in a lower-level language.**

### Space Efficiency

**Save space by using the smallest possible data type.**

**Don't store what you can easily recompute.**

### Estimation

On a 250 MHz MIPS R10000, it produces the data, with times in nanoseconds per operation.

Operations | Time (ns)
:--|--:
**`int` Operations** | 
`i1++` | 8
`i1 = i2 + i3` | 12
`i1 = i2 - i3` | 12
`i1 = i2 * i3` | 12
`i1 = i2 / i3` | 114
`i1 = i2 % i3` | 114
**`float` Operations** | 
`f1 = f2` | 8
`f1 = f2 + f3` | 12
`f1 = f2 - f3` | 12
`f1 = f2 * f3` | 11
`f1 = f2 / f3` | 28
**`double` Operations** | 
`d1 = d2` | 8
`d1 = d2 + d3` | 12
`d1 = d2 - d3` | 12
`d1 = d2 * d3` | 11
`d1 = d2 / d3` | 58
**Numeric Conversions** | 
`i1 = f1` | 8
`f1 = i1` | 8
**Integer Vector Operations** | 
`v[i] = i` | 49
`v[v[i]] = i` | 81
`v[v[v[i]]] = i` | 100
**Control Structures** | 
`if (i == 5) i1++` | 4
`if (i != 5) i1++` | 12
`while (i < 0) i1++` | 3
`i1 = sum(i2)` | 57
`i1 = sum(i2, i3)` | 58
`i1 = sum(i2, i3, i4)` | 54
**Input/Output** | 
`fputs(s, fp)` | 270
`fgets(s, 9, fp)` | 222
`fprintf(fp, "%d\n", i)` | 1820
`fscanf(fp, "%d", &i1)` | 2070
**Allocation** | 
`free(malloc(8))` | 342
**String Functions** | 
`strcpy(s, "0123456789")` | 157
`i1 = strcmp(s, s)` | 176
`i1 = strcmp(s, "a123456789)` | 64
**String/Number Conversions** | 
`i1 = atoi("12345")` | 402
`sscanf("12345", "%d", &i1)` | 2376
`sprintf(s, "%d", i)` | 1492
`f1 = atof("123.45")` | 4098
`sscanf("123.45", "%f", &f1)` | 6438
`sprintf(s, "%6.2f", 123.45)` | 3902
**Math Functions** | 
`i1 = rand()` | 135
`f1 = log(f2)` | 418
`f1 = exp(f2)` | 462
`f1 = sin(f2)` | 514
`f1 = sqrt(f2))` | 112

## Portability

### Language

**Stick to the standard.**

**Program in the mainstream.**

**Beware of language trouble spots.**  
Trouble spots in C and C++ are as follows:

* Size of data types. They are not accurately defined in the standard.
* Order of evaluation. The order of evaluation of expressions with side effects and functions arguments is not defined. Don't use side effect except for a very few idiomatic constructions.
* Signedness of `char`. They are not defined in the standard, so do not compare a `char` with `EOF`.
* Arithmetic or logical shift. `>>` may be arithmetic or logical right shift. Never right shift a signed value.
* Byte order. Little-endian or big-endian.
* Alignment of structure and class members. Never assume that the elements of a structure occupy contiguous memory.
* Bit fields. It's so machine-dependent that no one should use them.

**Try several compilers.**

### Headers and Libraries

**Use standard libraries.**

### Program Organization

**Use only features available everywhere.**

**Avoid conditional compilation.**

### Isolation

It is a mistake to have nonportable code scattered throughout a program.

**Localize system dependencies in separate files.**

**Hide system dependencies behind interfaces.**  
The Java approach is a good example. A Java program is translated into operations in a virtual machine.

### Data Exchange

**Use text for data exchange.**  
Binary files need specialized tools and rarely can be used together even on the same machine.

### Byte Order

**Use a fixed byte order for data exchange.**

### Portability and Upgrade

**Change the name if you change the specification.**  
One example is `sum` on UNIX, which prints the size and checksum of a file. But the algorithm of `sum` was changed during upgrade, so when use `sum` to compute copied files and getting different results on different machines, maybe the file was corrupted or we just have different versions of `sum`, or both. It is the perfect portability disaster.

**Maintain compatibility with existing programs and data.**

### Internationalization

**Don't assume ASCII.**  
Character-testing functions in `ctype.h` is dependent of the specific encoding of characters, and will work correctly in different locales.

**Don't assume English.**  
Different language often take significantly different numbers of characters to say the same thing, so there must be enough room on the screen an in arrays. The massages should be free of jargons and slangs. Collect the texts of all messages in one spot so that they can be easily replaced by translations.

## Epilogue

***Simplicity*** and ***clarity*** are first and most important. Do the simplest thing that works. Don't complicate them unless performance measurements show that more engineering is necessary. Interfaces should be clean and spare, at least until there is compelling evidence that the benefits outweigh the added complexity.

***Generality*** often goes hand in hand with simplicity, and is often the right approach to possibility as well: find the single general solution that works on each system, instead of magnifying the differences.

***Evolution*** comes next. It is not possible to create a perfect program the first time. A cycle of prototyping experiment, user feedback and further refinement is most effective.

***Interfaces*** should be consistent and easy to learn and use. Abstraction is an effective technique: imagine a perfect component or library or program; make the interface match that ideal as closely as possible; hide implementation details behind boundary.

***Automation*** is under-appreciated. It is much more effective to have a computer do your work than to do it by hand, for example in testing, in debugging session, in performance analysis and notably in writing code.

***Notation*** is also under-appreciated. It provides an organizing framework for implementing a wide range of tools and also guides the structure of the programs that write programs. Regular expressions of one of the best examples and there are countless opportunities to create little languages for specialized applications.

We hope that these ideas has given you something that will make your code easier to work with, your debugging sessions less painful, your programming more confident, and your computing more productive and more rewarding.
