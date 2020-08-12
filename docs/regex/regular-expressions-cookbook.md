# Regular Expressions Cookbook

*Second Edition*  
*Jan Goyvaerts, Steven Levithan*  
*正则表达式 Cookbook（第二版 影印版）*  
*2012, O'Reilly, 2013, 东南大学出版社*  


## Basic Regex Skills

#### Metacharacters
```
$()*+.?[\^{|
```
以上字符在所有情况下都是元字符，要匹配这些字符需要转义。

注意 `]` 和 `-` 要在未转义的 `[` 之后才成为元字符，`}` 只在未转义 `{` 之后作元字符。

#### `\Q` and `\E`
这两个标志之间的所有字符都作字面意义解析。

Flavour: Java 6, PCRE, Perl.

#### Case-insensitive Flags
```
(?i) (?-i)
```
之间的字符是大小写不敏感的。若无结束标志则一直到正则表达式结束有作用。

Flavour: 除 JavaScript。

#### Control Characters
```
\cA\cB\cC...\cZ
```
`c` 小写，后面的字母建议大写。分别对应 ASCII 码在 `\x01` 至 `\x1A` 的 26 个控制字符。比如：  
`\cH` = `BS` = `Backspace`  
`\cJ` = `LF` = `Line Feed`  

#### Character Classes
在字符类中，仅 `\^-]` 有特殊的含义。所以 `[$()*+.?{|]` 就按字面意义匹配。

.NET 中，可用 `[A-[B]]` 表示差集 $A\setminus B$。如 `[0-9-[4-7]]` = `[012389]`

Java 中，方括号的嵌套 `[A[B]]` 则表示并集。多个嵌套 `[A[B][C]]`、`[A[B[C]]]` 表示同样的意思。`[A&&[B]]` 则是交集。所以 `[A&&[^B]]` 就是差集。

#### Dot Match All?
```
(?s)
```
这个标志表示 inline mode。这个模式种点号 `.` 不匹配换行。

#### Or
```
(react|angular|vue)
```
表示三个中选一个匹配。为了去掉括号带来的副作用，有下一个：

#### Noncapturing Group
```
(?:react|angular|vue)
```
`:` 表示这个括号不被 backreference。也可以将加上 flags: `(?i:` 来表示其他选项。

#### Named Groups
```
(?<oddseq>[13579]*)     \k<oddseq>
```

.NET 中：
```
(?'oddseq'[13579]*)     \k'oddseq'
```

Python 中：
```
(P<oddseq>[13579]*)     (?P=oddseq)
```

#### Capture and Repetition

`(\d\d){3}` = `\d\d\d\d(\d\d)`  
to capture the whole expression,
```
((?:\d\d){3})
```
如果用 `((\d\d){3})` 匹配 `123456`，那么 `\1` = `123456`，`\2` = `56`。

#### Laziness

```
<p>.*?</p>
```
matchs a pair of tags.

But `<p>.*</p>` eats up the whole file after the beginning tag, and then start backtracking. It will match the longest gap, instead of a single paragraph.

#### Possessiveness

```
\b\d++\b
```
When testing `123abc 456`, this possesive regex tries `123` first, but fails at `a`. It quits without backtracking, therefore it will eventually match `456`.

To make a regex possesive,
```
.*+
```
Flavour: Java, PCRE, Perl, Ruby
```
(?>.*)
```
Flavour: .NET, Java, PCRE, Ruby

Matching a proper HTML file:
```
<html>(?>.*<head>)(?>.*<title>)(?>.*</title>)(?>.*</head>)
(?>.*<body[^>]*>)(?>.*</body>).*?</html>
```
