# Vim

## Moves

[All the right moves | Vim Tips Wiki](https://vim.fandom.com/wiki/All_the_right_moves){:target="_blank"}

### Move between Words

* `w` to beginning of next **word**
* `W` to beginning of next word after a whitespace
* `b` to previous beginning of word (move **back**)
* `B` to beginning of previous word before a whitespace
* `e` to **end** of word
* `E` to end of word before a whitespace
* `ge` to end of previous word

### Move between Lines

* `gg` to first line of file
* `G` to last line of file
* `ngg` to nth line of file
* `nG` to nth line of file
* `H` to **highest** of screen
* `M` to **middle** of screen
* `L` to **lowest** of screen

### Move in Line

* `0`/`^` to beginning of line
* `$` to end of line
* `_` to first non-blank character of the line
* `g_` to last non-blank character of the line

### Scrolling

* `zz` with current line to the center of the screen
* `zt` with current line to the **top**
* `zb` with current line to the **bottom**
* `ctrl-u`  half-page **up**
* `ctrl-d`  half-page **down**
* `ctrl-b`  page up (**backwards**)
* `ctrl-f`  page down (**forwards**)
* `ctrl-y`  one line up
* `ctrl-e`  one line down
* `n%` to n%

### Jumping

* `n` **next** matching search pattern
* `N` previous matching search pattern
* `*` next whole word under cursor
* `#` previous whole word under cursor
* `g*` next matching search (not whole word) pattern under cursor
* `g#` previous matching search (not whole word) pattern under cursor
* `gd` **definition**/first occurrence of the word under cursor
* `%` matching bracket
* `ctrl-o` last cursor position
* `ctrl-i` next cursor position

### Searching

* `fx` **find** next 'x' after cursor, in the same line
* `Fx` **find** previous 'x' before cursor
* `tx` **til** next 'x' (cursor before 'x')
* `Tx` **til** previous 'x'
* `;` repeat above, in same direction
* `,` repeat above, in reverse direction


## Edit

### Inserting Text (Enter Insert Mode)

[Tutorial | Vim Tips Wiki](https://vim.fandom.com/wiki/Tutorial){:target="_blank"}

* `i` **insert** at current location
* `I` **insert** at the start of current line
* `a` **append** after current location
* `A` **append** after cuttent line
* `o` **open** a line below current line
* `O` **open** a line above current line
* `s` **substitute** char (delete current char and start insert mode)
* `S` **substitute** line (delete current line and start insert mode in its place)
* `cw`/`ce` **change word** (delete to the end of current word and start insert mode)
* `cc` **change** line (same as `S`)
* `C` delete to the end of line and start insert mode

### Copy and Paste

* `y{move}` **yank**
* `yy`/`Y` yank current line, including the ending newline
* `y$` yank to the end of current line, excluding newline
* `yiw` yank current word
* `yaw` yank current word including trailing OR leading whitespace
* same as above for `d` (cut)
* `p` **paste** after cursor
* `P` paste before cursor
* `gp` and `gP` moves cursor after pasted text

### Find and Till

* `ctx` change all text till the next 'x'
* `cfx` same, but include the 'x'
* `ytx` yank all text till the next 'x'
* `yfx` same, but include the 'x'

### Search and Replace

[Search and replace | Vim Tips Wiki](https://vim.fandom.com/wiki/Search_and_replace){:target="_blank"}

* `/regex` search for regex
* `?regex` search backwards

`:s`/`:substutute` command searches for regex and replace with text.

* `:s/foo/bar/g` substitute all 'foo' in current line (**global**) with 'bar'
* `:%s/foo/bar/g` substitute 'foo' in all lines with 'bar'
* `:%s/foo/bar/gc` substitute each 'foo' with 'bar', but ask for **confirmation** first
* `:%s/\<foo\>/bar/g` substitute only whole words exactly matching 'foo' with 'bar'
* `:%s/foo/bar/gi` case-**insensitive**
* `:%s/foo\c/bar/g` **case**-insensitive
* `:%s/foo/bar/gI` case-sensitive
* `:%s/foo\C/bar/g` case-sensitive

`:set ignorecase`/`:set ic` and `:set noignorecase`/`:set noic` (default) makes searchings case-insensitive/sensitive by default.

`\zs` and `\ze` delimits the pattern to replace. For example, `:s/Copyright \zs2019\ze/2020` substitutes 2019 with 2020.

When replacing:

* `\r` is newline
* `\n` is null byte (0x00)
* `\0` is the text matched by the entire pattern
* `\1` is the text of the first backreference

### Undo and Redo

* `u` **undo** last change
* `U` reverse all changes in last modified line (creates new change)
* `ctrl-r` **redo**
* `.` repeat previous change

### Visual Mode

* `v` visual mode, press again to quit
* `shift-v` line visual mode, press again to quit
* `ctrl-v` blockwise visual mode, press again to quit

### Replace

* `rx` **replace** current char with 'x'
* `R` enter **replace** mode

### Delete

* `dw` **delete** (cut) a word
* `dd` delete current line
* `x` delete current char
* `J` delete ending newline of current line

### Switching Case

* `~` toggle case of current char or visually selected chars
* `g~iw` toggle case of current word
* `g~~` toggle case of current line
* `U` **uppercase** visually selected text
* `u` lowercase visually selected text
* `gUU` uppercase current line
* `guu` lowercase current line
* `gUiw` uppercase current word
* `guiw` lowercase current word

### Text Align

* `:ce` **center** current line
* `:le` **left**-align current line
* `:ri` **right**-align current line
* `>>` indent current line
* `<<` dedent current line
* `gqq` warp current line to textwidth (tw)
* `gqnq` warp n lines
* `gggqG` warp from `gg` to `G`

### Text Objects

Operations such as `y`, `d`, `c`, `gq` can be followed by text objects. Text objects include

* `aw` **a word**
* `as` **a sentence**
* `ap` **a paragraph**
* `ab` **a block**

and `j`, `w`...

Repeat operation by adding number `n`.

* `nj` move n lines down
* `dnw` delete n words including trailing space
* `dne` delete n words leaving trailing space (till the end of word)
* `dnl` delete n characters right
* `dnk` delete n lines up (delete n+1 lines)
* `dnb` delete n words backwards

## File Operations

* `:n` switch to next file (window)
* `:N` switch to previous file (window)
* `:e filename` open new file
* `:ls` open file history
* `:f` new current file name
* `:f filename` rename current file

## Window Operations

* `:sp`/`:split` **split** window horizontally
* `:vs`/`:vsp`/`vsplit` **vertically split** window
* `:(v)sp filename` split window and open file
* `ctrl-w j/k/h/l` move focus between windows
* `ctrl-w w`/`ctrl-w ctrl-w` move focus to next window (loop)
* `ctrl-w J/K/H/L` move current window
* `ctrl-w o`/`:only` keep current window only, close others
* `ctrl-w +/-` change window height by 1
* `ctrl-w n+/n-`/`:res(ize) +n/-n` change window height by n
* `:res(ize) n` set current window height to n
* `ctrl-w </>` change current window width by 1
* `ctrl-w n</n>`/`:vertical res(ize) +n/-n` change current window width by n
* `:vertical res(ize) n` set current window width to n
* `ctrl-w =` resize all windows equally based on splits
* `ctrl-w _` increase to max height
* `ctrl-w |` increase to max width
* `qa`/`qall` quit all
* `wa`/`wall` write all
