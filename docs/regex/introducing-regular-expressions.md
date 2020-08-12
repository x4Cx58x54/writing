# Introducing Regular Expressions

> *Michael Fitzgerald*  
*正则表达式入门（影印版）*  
*2012, O'Reilly Media, 2013, 东南大学出版社*  

## Escape Characters

Regex | Pattern | Regex | Pattern
:---: | :---: | :---: | :---:
`\a` | alert
`\b` | word boundary | `\B` | non-word boundary
`\d` | digit, = `[0-9]` | `\D`|non-digit, = `[^\d]` = `[^0-9]`
`\w` | word character, = `[a-zA-Z0-9]` | `\W` | non-word character
`\0` | null
`\dxxx` | digital value for a character | `\xxx` | hexadecimal calue for a character
`\uxxx` | unicode value for a character

Regex | Pattern | Regex | Pattern
:---: | :---: | :---: | :---:
`\f` | for feed
`\h` | horizontal whitespace | `\H`|not horizontal whitespace
`\n` | newline
`\r` | carriage return
`\t` | horizontal tab
`\v` | vertical whitespace | `\V`|not vertial whitespace

## Wildcard 

`.` = any character.

## Boundaries

`^` = beginning of a file/line/string  
`$` = end of a file/line/string

They do not consume any character.

## Quote

Characters between `\Q` and `\E` are quoted as literals, for example, `\Q[]{}\E` = `\[\]\{\}`.

## Alternation

`(The|the|THE)` = 'The' or 'the' or 'THE'

## Groups

`()`

Backreference: `\1` ... or `$1` ...

Named Groups: `(?<group1>.{3})`

Reference: `$+{group1}`

## Character Classes

`[]`

`[^0-9]` except this class

`[0-3[6-9]]` union

`[a-z&&[^c]]` minus


## Quantifiers

#### Greedy
`*` = zero or more  
`?` = zero or one  
`+` = one or more  
`{m}` = m times  
`{m,}` = m times or more  
`{m,n}` = m to n times  

#### Lazy
Append a `?` to the quantifier to add laziness.

Lazy quantifiers matches as less characters as possible. For example, `5*?` is matches 0 characters.

#### Possessive
Append a `+` to the quantifier to add selfishness.

Possessive quantifiers never backtracks.

#### Lookarounds

Lookarounds do not consume characters.

`(?=abc)` : followed by 'abc'  
`(?!abc)` : not followed by 'abc'  

`(?<=abc)` : after 'abc'  
`(?<!abc)` : not after 'abc'  

Eg. : `Regular (?=Expressions)`

## Regex in Vim

Type '`/`' + regex.
