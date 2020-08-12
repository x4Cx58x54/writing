---
title: LaTeX Cheatsheet
---

# $\LaTeX$ Cheatsheet

> 本文内容中大部分可在各版本 LaTeX 中使用，但主要针对 XeLaTeX。

## 主要架构
```latex
% Preamble 导言
\documentclass{article}

% Packages
\usepackage{amsmath}    % Advanced maths typesetting
\usepackage{graphicx}   % Picture

% Declarations
\title{Title}
\author{Name}
\date{\today{}}

% Main Document 正文
\begin{document}
\maketitle{}
\tebleofcontents{}
\\ % Linebreak
\newpage{}
Hello World!
\end{document}
```

```latex
\section{title}
content
\subsection{title}
content
\subsubsection{title}
Sections above are automatically numbered.
\paragraph{title}
content
\subparagraph{title}
content
```

### 文档类型及参数

```latex
\documentclass{article} % 不提供 \chapter
\documentclass{book}    % 支持双面模式
\documentclass{report}

\documentclass[12pt, ...]{...}    % 主字号
\documentclass[utf8, ...]{...}    % UTF-8 编码
\documentclass[a4paper, ...]{...} % 纸张大小
\documentclass[twoside, ...]{...} % 双面模式，偶数页的左右页边距交换
```

## 中文支持

```latex
\documentclass[UTF8]{ctexart} % 相应地，也可以使用 ctexbook、ctexrep
```

### 中文字体

命令 | 字体
:---:|:---:
`\songti` | 宋体 (默认)
`\heiti` | 黑体
`\kaishu` | 楷书
`\fangsong` | 仿宋
`\yahei` | 微软雅黑

### 中文字号

```latex
\zihao{1}   % 初号
\zihao{-4}  % 小四号
```

### 中文标题设置

```latex
\usepackage{ctexcap}
```

```latex
\ctexset{section={name={~,~},format={\center\heiti\zihao{3}\textbf}}}
\ctexset{subsection={format={\heiti\zihao{4}}}}
\ctexset{subsubsection={format={\kaishu\zihao{-4}}}}
\renewcommand{\abstractname}{\zihao{3}摘\ 要}
\renewcommand{\contentsname}{目\hspace{30pt}录}
```


## 图片

```latex
\usepackage{graphicx}
```

```latex
\begin{figure}[!ht]
    \centering
    \includegraphics[totalheight=5cm]{img/1.png}
    \caption{Picture}
    \label{fig:1}
\end{figure}
```

### 子图

各子图序号默认为 `(a)`, `(b)`, ... 但同属一个 `\caption` 下. 若子图不需要小标题，可删去 `\subfigure` 之后的方括号及其内容.

```latex
\usepackage{graphicx}
\usepackage{subfigure}
```

```latex
\begin{figure}[!ht]
    \centering
    \subfigure[title1]{
        \centering
        \includegraphics[width=0.45\linewidth]{img/1.png}
    }
    \subfigure[title2]{
        \centering
        \includegraphics[width=0.45\linewidth]{img/2.png}
    }
    \centering
    \caption{Pictures}
    \label{fig:1}
\end{figure}
```

### 并列图

```latex
\usepackage{graphicx}
```

```latex
\begin{figure}[!ht]
    \centering
    \begin{minipage}[t]{0.45\linewidth}
        \centering
        \includegraphics[totalheight=5cm]{img/1.png}
        \caption{fig1}
        \label{fig:1}
    \end{minipage}
    \begin{minipage}[t]{0.45\linewidth}
        \centering
        \includegraphics[totalheight=5cm]{img/2.png}
        \caption{fig2}
        \label{fig:2}
    \end{minipage}
    \centering
\end{figure}
```

实际上 `minipage` 可用于大多数元素的并列.

## 表格

表格生成器 [tablesgenerator.com](http://www.tablesgenerator.com/){: target=_blank}

### 三线表

```latex
\usepackage{booktabs}
```

```latex
\begin{table}[!ht]
    \centering
    \caption{标题}
    \begin{tabular}{列对齐}
        \toprule
        a & b & c & d \\
        \midrule
        1 & 2 & 3 & 4 \\
        10 & 20 & 30 & 40 \\
        \bottomrule
    \end{tabular}
\end{table}
```

`htbp` 强制位置。`列对齐`用一组字母表示，字母数为列数。`l` 表示左对齐，`c` 表示居中，`r` 表示右对齐。如`cccc`.

### 表格行高调整

默认的表格行高较窄，可在 tabular 环境开始之前使用以下命令。

```latex
\renewcommand\arraystretch{1.2}
```

### 表格标题间距

若将标题置于表格上方，则其间距过窄，使用以下命令增大间距。

```latex
\usepackage{caption}
```

```latex
\captionsetup[table]{skip=2pt}
```

## 列表

### 有序列表

默认以 `1.`, `2.`, ... 编号。

```latex
\begin{enumerate}
    \item item1
    \item item2
\end{enumerate}
```

### 无序列表

每项开头默认为 `·`。

```latex
\begin{itemize}
    \item item1
    \item item2
\end{itemize}
```

### 描述列表

```latex
\begin{description}
  \item[Foo] Foo
  \item[Bar] Bar
  \item[Qaz] Qaz
\end{description}
```

### 有序列表序号设置

```latex
\usepackage{enumerate}
```

```latex
\begin{enumerate}[1)]
...
```

### 自定义列表 | enumitem

文档 [texnia.com/archive/enumitem.pdf](http://www.texnia.com/archive/enumitem.pdf){: target=_blank}

```latex
\usepackage{enumitem}
```

以下为两例：

```latex
\begin{itemize}[label=\huge$\cdot$, itemsep=2pt, topsep=0pt, parsep=0pt, leftmargin=0pt, itemindent=\labelwidth+\labelsep]
...
```

```latex
\begin{enumerate}[label=(\arabic*), itemsep=0pt, topsep=0pt, parsep=0pt, leftmargin=*]
...
```

## 数学

```latex
\begin{equation}
...
\end{equation}
```

若使用 `$$` 则不会被编号。

## 目录

```latex
\setcounter{tocdepth}{3}
\tableofcontents
```
默认目录深度为 2。

目录标题修改

```latex
\renewcommand{\contentsname}{Table of Contents}
```

## 摘要

```latex
\begin{abstract}
...
\end{abstract}
```

摘要标题修改

```latex
\renewcommand{\abstractname}{ABSTRACT}
```

## 参考文献

```latex
\begin{thebibliography}{0}
\addcontentsline{toc}{section}{参考文献}
    \bibitem{标签名} 参考文献信息
\end{thebibliography}
```

需要引用时

```latex
\cite{标签名}
```

一种模板为

```latex
\clearpage
\kaishu\zihao{-4}
\begin{flushleft}
\begin{thebibliography}{0}
\addcontentsline{toc}{section}{参考文献}
    \bibitem{1} Foo Bar, Qaz.
\end{thebibliography}
\end{flushleft}
```

将引用格式改为上标：

```latex
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
```


## 附录

```latex
\begin{appendix}
\ctexset{section={name={附录~,~},format={\center\heiti\zihao{3}}}}
...
\end{appendix}
```

附录默认以大写字母编号。

## 名称与序号的样式

### 更改元素名称

```latex
\renewcommand{\contentsname}{Contents}
\renewcommand{\abstractname}{ABSTRACT}
\renewcommand{\refname}{References}
\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{Table}
```

### 设置编号样式

```latex
\renewcommand{\thefigure}{\thesection{}.\arabic{figure}}
\renewcommand{\thetable}{\thesection{}.\arabic{table}}
\renewcommand{\theequation}{\thesection{}.\arabic{equation}}
```

### 设置每章（section）重新编号

```latex
\numberwithin{figure}{section}
\numberwithin{table}{section}
\numberwithin{equation}{section}
```

### 设置计数器

```latex
\setcounter{table}{0}
\setcounter{figure}{0}
```

## 页边距

```latex
\usepackage{geometry}
```

全局页边距设置：

```latex
\geometry{top=2.5cm, bottom=2.5cm, left=3cm, right=3cm}
```

部分页面页边距设置：

```latex
\newgeometry{left=4.8cm, right=4.8cm}
...
\restoregeometry
```

## 页眉与页脚

```latex
\pagestyle{empty}   % 无页眉页脚
\pagestyle{plain}   % 无页眉，页脚为居中页码

\thispagestyle{...} % 单独设置一页的样式
```

### fancyhdr

文档 [ctex.org/documents/packages/layout/fancyhdr.htm](http://www.ctex.org/documents/packages/layout/fancyhdr.htm)

```latex
\usepackage{fancyhdr}
```

```latex
\pagestyle{fancy}
\fancyhead{} % 清空页眉
\fancyfoot{} % 清空页脚
% \fancyhf{} % 清空页眉页脚
\renewcommand{\headrulewidth}{0.3pt} % 页眉横线
\renewcommand{\footrulewidth}{0.3pt} % 页脚横线
\fancyhead[LE]{Report}
\fancyhead[RO]{\leftmark}
\fancyfoot[LE, RO]{\thepage}
```

```latex
\cfoot{}
\lhead{}
\rhead{}
...
```

如果不需要页脚横线，将对应语句注释掉即可；如果不需要页眉横线，则需要将宽度设为零。

## 页码

设置页码计数器

```latex
\setcounter{page}{1}    % 此页从 1 开始
```

设置编号方式（会同时重置页码计数器）

```latex
\pagenumbering{arabic}  % 阿拉伯数字
\pagenumbering{Roman}   % 大写罗马数字
\pagenumbering{roman}   % 小写罗马数字
\pagenumbering{Alph}    % 大写字母
\pagenumbering{alph}    % 小写字母
```

### 最后一页 | lastpage

```latex
\usepackage{lastpage}
```

```latex
\footnotesize Page \thepage\ of \pageref{LastPage}
```


## 字体与其它文字支持

```latex
\usepackage{fontspec}
```

新字体声明

```latex
\newfontfamily{\monaco}{Monaco}
```

设置默认等宽字体

```latex
\setmonofont{Monaco}
```

添加主字体

```latex
\setmainfont{CMU Serif}
```

另外，CMU Serif 支持西里尔字母和扩展拉丁字母，而又对中英文无影响。

## 源代码 | listings

```latex
\usepackage{listings}
```

一般使用直接使用 `lstlisting` 环境即可

```latex
\begin{lstlisting}[breaklines=true, frame=single, basicstyle=\small\monaco, numbers=left, numberstyle=\tiny\monaco]
...
\end{lstlisting}
```

### 预设样式

全局默认样式参数
```latex
\lstset{tabsize=4, breaklines=true}
```

单独设置样式
```latex
\lstdefinestyle{shared}
{
    backgroundcolor=\color[RGB]{248,248,248},
    basicstyle=\linespread{1.1}\normalsize\consolas,
    frame=l,
    framesep=4pt,
    framerule=0pt
}

\lstdefinestyle{appendix}
{
    basicstyle=\footnotesize\monaco,
    numbers=left,
    numberstyle=\tiny\monaco
}
```

在插入代码时直接指定 `style` 参数即可使用预设样式

```latex
\begin{lstlisting}[style=shared]
...
\end{lstlisting}
```

### 文件导入

```latex
\lstinputlisting[style=appendix]{srcfile}
```

## 间距

行高伸展因子（ctexart 中默认 1.3）。参见 [【LaTeX Tips】关于行距的研究](https://liam.page/2013/10/17/LaTeX-Linespace/){: target=_blank}。

```latex
\linespread{1.4}
```

### setspace

```latex
\usepackage{setspace}
```

```latex
\setlength{\baselineskip}{20pt} % 基本行距
\setlength{\parskip}{6pt}       % 段落间距
```

## 算法 | algorithm2e

文档 [mirrors.ctan.org/macros/latex/contrib/algorithm2e/doc/algorithm2e.pdf](http://mirrors.ctan.org/macros/latex/contrib/algorithm2e/doc/algorithm2e.pdf){: target=_blank}

```latex
\usepackage{algorithm2e}
```

```latex
\begin{algorithm}
\DontPrintSemicolon
\caption{Kruskal 算法}
\fnname{\texttt{kruskal}($V$, $E$)}
    将 $E$ 按权从小到大排序.\;
    初始化并查集.\;
    $T \la \varnothing$\;
    \For{$(u, v)$ in $E$}
    {
        \If{$u$, $v$ 不在同一集合中}
        {
            $T \la T \cup \{(u, v)\}$\;
            合并 $u$ 与 $v$ 所在集合.\;
        }
    }
    \Return T\;
\end{algorithm}
```

将算法标题移至上方[^alg-caption-above]

[^alg-caption-above]: [Algorithm2e caption above code - StackExchange](https://tex.stackexchange.com/questions/147747/algorithm2e-caption-above-code/147750#147750){: target=_blank}

```latex
\makeatletter
\renewcommand{\@algocf@capt@plain}{above} % formerly {bottom}
\makeatother
```

算法标题改为中文

```latex
\renewcommand{\algorithmcfname}{算法}
```

自定义命令

```latex
\newcommand{\la}{\leftarrow} % 方便使用左箭头表示赋值
\newcommand{\fnname}[1]{\Indm \ \ #1 \\ \Indp} % 无缩进的函数名
```

默认正体文字[^setargsty]

[^setargsty]: [Removing italic formatting from if statement - StackExchange](https://tex.stackexchange.com/questions/193991/removing-italic-formatting-from-if-statement/193997#193997){: target=_blank}

```latex
\SetArgSty{textup}
```

隐藏竖线

```latex
\usepackage[noline]{algorithm2e}
```

## 超链接 | hyperref

```latex
\usepackage{hyperref}
```

设置样式

```latex
\hypersetup
{
    colorlinks=true,
    linkcolor=black,
    filecolor=cyan,
    urlcolor=cyan,
    citecolor=cyan,
}
```

```latex
\href{https://www.ctan.org/}{CTAN}
```


## Misc

### 插入 PDF
```latex
\usepackage{pdfpages}
```

```latex
\includepdf{pdffile}
```

### 插入 LaTeX 代码

不换页
```latex
\input{texfile}
```

换页
```latex
\include{texfile}
```

### 换页

```latex
\clearpage
```

不推荐使用 `\newpage`.

一整页留空可用

```latex
\clearpage
\phantom{this page was intentionally left blank.}
\clearpage
```

留空一个偶数页

```latex
\cleardoublepage
```

该命令先执行 `\clearpage`，然后视下一页的奇偶换页。


### 横线

```latex
\noindent\rule[0.25\baselineskip]{\textwidth}{0.4pt}
```

### 脚注

```latex
\footnote{...}
```

设置脚注标记样式

```latex
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
```

### 一些自定义命令

```latex
\newcommand{\cpp}{C\raisebox{0.35ex}{\small ++}}
\newcommand{\e}[1]{\mathrm{e}^{#1}}
\newcommand{\dif}{\mathrm{d}}
```


## See Also

* [https://www.resurchify.com/latex_tutorial/latex_tutorial.php](https://www.resurchify.com/latex_tutorial/latex_tutorial.php){: target=_blank}
* [https://liam.page/categories/LaTeX/](https://liam.page/categories/LaTeX/){: target=_blank}
