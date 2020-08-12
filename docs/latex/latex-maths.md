---
title: LaTeX Maths Symbols
---

# $\LaTeX$ Maths Symbols

## Basics

Name | LaTeX | Display
:---: | :---: | :---:
LaTeX | `\LaTeX` | $\LaTeX$
text | `\text` | $\text{text}$
math roman | `\mathrm` | $\mathrm{C}$
subscript | `_` | $x_i$
superscript | `^` | $y^\alpha$
dot | `\int` | $\cdot$
overline | `\overline` | $\overline{XY}$
sin | `\sin` | $\sin$
limit | `\lim_{n\to\infty}` | $\lim_{n\to\infty}$
integral | `\int` | $\int$
sum | `\sum_{i=1}^n` | $\sum_{i=1}^n$
production | `\prod` | $\prod$
limits | `\limits` / `\nolimits` | $\sum\limits_{i=1}^n$
square root | `\sqrt[n]` | $\sqrt[n]{x}$
vector | `\vec` | $\vec{e}$
right arrow | `\overrightarrow` | $\overrightarrow{AB}$
fraction | `\frac{}{}` | $\frac{x}{\ln x}$
tiny fraction | `\tfrac{}{}` | $\tfrac{\sin x}{x}$
clossal fraction | `\cfrac{}{}` | $\cfrac{\text{numerator}}{\text{denominator}}$
numbering | `\tag{1.1}` / `\tag*{1.1}` | $(1.1)$ / $1.1$

## Spaces

Name | LaTeX | Spacing | Display
:---: | :---: | :---: | :---:
thin space | `\,` or `\thinspace` | 3 mu | $A\, B$
mediuim space | `\:` or `\medspace` | 4 mu | $A\hspace{4mu} B$
thick space | `\;` or `\thickspace` | 5 mu | $A\; B$
thicker space | `\ ` | 6 mu  | $A\ B$
quad | `\quad` | 1 em = 18 mu | $A\quad B$
2 quad | `\qquad` | 2 em = 36 mu | $A\qquad B$
neg thin space | `\!` or `\negthinspace` | -3 mu | $A\negthinspace B$
neg medium space | `\negmedspace` | -4 mu | $A\negmedspace B$
neg thick space | `\negthickspace` | -5 mu | $A\negthickspace B$
horizontal space | `\hspace{0mu}` | specified mu / em | $A\hspace{0mu} B$
phantom | `\phantom{abc}` | as specified text | $A\phantom{abc} B$
horizontal phantom | `\hphantom{abc}` | as wide as specified text | $A\hphantom{abc} B$
vertical phantom | `\vphantom{abc}` | as high as specified text | $A\vphantom{abc} B$

## Matrices

$$
\begin{matrix}
a_{11} & a_{12}\\
a_{21} & a_{22}
\end{matrix}
$$

```latex
\begin{matrix}
a_{11} & a_{12}\\
a_{21} & a_{22}
\end{matrix}
```

Name | LaTeX | Borders 
:---: | :---: | :---: 
matrix | `matrix` | (None)
small matrix | `smallmatrix` | (None)
determinant | `vmatrix` | $\vert \cdots \vert$ 
norm | `Vmatrix`  | $\Vert \cdots \Vert$ 
parenthesis matrix | `pmatrix` | $(\cdots)$
bracket matrix | `bmatrix` | $[\cdots]$ 
brace matrix | `Bmatrix` | $\lbrace\cdots\rbrace$ 

## Delimiters

Name | LaTeX | Display
:---: | :---: | :---:
(direction and matching) | `\left(`, `\right)` | $\left(\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right)$
(singly sided) | `\left(`, `\right.` | $\left(\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right.$
parentheses | `(`, `)` | $\left(\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right)$
square brackets | `[`, `]` | $\left[\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right]$
braces | `\{`, `\}` or `\lbrace`, `\rbrace` | $\left\lbrace\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\rbrace$
angle brackets | `\langle`, `\rangle` | $\left\langle\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\rangle$
norm | `\Vert` or `\|`  | $\left\Vert\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\Vert$
absolute value | `\vert` or `|` | $\left\vert\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\vert$
floor | `\lfloor`, `\rfloor` | $\left\lfloor\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\rfloor$
ceiling | `\lceil`, `\rceil` | $\left\lceil\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\rceil$
slashes | `/`, `\backslash` | $\left/\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\backslash$
arrow | `\uparrow`, `\downarrow` | $\left\uparrow\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\downarrow$
strong arrow | `\Uparrow`, `\Downarrow` | $\left\Uparrow\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\Downarrow$
double arrow | `\updownarrow`, `\Updownarrow` | $\left\updownarrow\sum\limits_{k=0}^{n}{\cfrac{x^k}{k!}}\right\Updownarrow$


## Systems of Equations (Cases)

$$
\begin{cases}
x+y=1 \\
x-y=\pi
\end{cases}
$$

```latex
\begin{cases}
x+y=1 \\
x-y=\pi
\end{cases}
```

$$
\text{ReLU}(z)=
\begin{cases}
    z, & z>0 \\
    0, & z\le 0
\end{cases}
$$

```latex
\text{ReLU}(z)=
\begin{cases}
    z, & z>0 \\
    0, & z\le 0
\end{cases}
```


## Aligned Formulae

$$
\begin{aligned}
    \oint_{\partial S}\vec{E}\cdot\text{d}\vec{l}
    &=\mathscr{E} \\
    &=-\cfrac{\text{d}\varPhi}{\text{d}t} \\
    &=-\cfrac{\text{d}}{\text{d}t}\int_S\vec{B}\cdot\text{d}\vec{S} \\
    &=-\int_S\cfrac{\partial\vec{B}}{\partial t}\cdot\text{d}\vec{S}
\end{aligned}
$$

```latex
\begin{aligned}
    \oint_{\partial S}\vec{E}\cdot\text{d}\vec{l}
    &=\mathscr{E} \\
    &=-\cfrac{\text{d}\varPhi}{\text{d}t} \\
    &=-\cfrac{\text{d}}{\text{d}t}\int_S\vec{B}\cdot\text{d}\vec{S} \\
    &=-\int_S\cfrac{\partial\vec{B}}{\partial t}\cdot\text{d}\vec{S}
\end{aligned}
```


## Greek Letters

Uppercase | LaTeX | Lowercase | LaTeX
:---: | :---: | :---: | :---:
$\mathrm{A}$ | `\Alpha` | $\alpha$ | `\alpha`
$\mathrm{B}$ | `\Beta` | $\beta$ | `\beta`
$\Gamma$ | `\Gamma` | $\gamma$, $\digamma$ | `\gamma`, `\digamma`
$\Delta$ | `\Delta` | $\delta$ | `\delta`
$\mathrm{E}$ | `\Epsilon` | $\epsilon$, $\varepsilon$ | `\epsilon`, `\varepsilon`
$\mathrm{Z}$ | `\Zeta` | $\zeta$ | `\zeta`
$\mathrm{H}$ | `\Eta` | $\eta$ | `\eta`
$\Theta$ | `\Theta` | $\theta$, $\vartheta$ | `\theta`, `\vartheta`
$\mathrm{I}$ | `\Iota` | $\iota$ | `\iota`
$\mathrm{K}$ | `\Kappa` | $\kappa$, $\varkappa$ | `\kappa`, `\varkappa`
$\Lambda$ | `\Lambda` | $\lambda$ | `\lambda`
$\mathrm{M}$ | `\Mu` | $\mu$ | `\mu`
$\mathrm{N}$ | `\Nu` | $\nu$ | `\nu`
$\Xi$ | `\Xi` | $\xi$ | `\xi`
$\mathrm{O}$ | `\Omicron` | $\omicron$ | `\omicron`
$\Pi$ | `\Pi` | $\pi$, $\varpi$ | `\pi`, `\varpi`
$\mathrm{P}$ | `\Rho` | $\rho$, $\varrho$ | `\rho`, `\varrho`
$\Sigma$ | `\Sigma` | $\sigma$, $\varsigma$ | `\sigma`, `\varsigma`
$\mathrm{T}$ | `\Tau` | $\tau$ | `\tau`
$\Upsilon$ | `\Upsilon` | $\upsilon$ | `\upsilon`
$\Phi$ | `\Phi` | $\phi$, $\varphi$ | `\phi`, `\varphi`
$\mathrm{X}$ | `\Chi` | $\chi$ | `\chi`
$\Psi$ | `\Psi` | $\psi$ | `\psi`
$\Omega$ | `\Omega` | $\omega$ | `\omega`
$\varPi\ _{(\varPi \varLambda A \varGamma I A)}$ | `\varPi` 


## Fonts

Name | LaTeX | Display
:---: | :---: | :---:
Math Roman | `\mathrm` or `\mbox` | $\mathrm{Aa}$
Boldface | `\mathbf` | $\mathbf{Aa}$
Bold Symbol | `\boldsymbol` | $\boldsymbol{Aa}$
Blackboard Bold | `\mathbb` | $\mathbb{R}$
Math Italic | `\mathit` | $\mathit{123}$
Math Script | `\mathscr` | $\mathscr{E}$
Sans Serif | `\mathsf` | $\mathsf{Aa}$
Typewriter | `\mathtt` | $\mathtt{1a}$
Calligraphic | `\mathcal` | $\mathcal{AB}$
Fraktur | `\mathfrak` | $\mathfrak{Aa}$

## Accents

LaTeX | Display | LaTeX | Display | LaTeX | Display
:---: | :---: | :---: | :---: | :---: | :---:
`\bar` | $\bar{a}$ | `\dot` | $\dot{a}$ | `\ddot` | $\ddot{a}$ 
`\acute` | $\acute{a}$ | `\grave` | $\grave{a}$ | `\breve` | $\breve{a}$ 
`\check` | $\check{a}$ | `\hat` | $\hat{a}$ | `\tilde` | $\tilde{a}$ 


## Functions / Operators

LaTeX | Display | LaTeX | Display | LaTeX | Display
:---: | :---: | :---: | :---: | :---: | :---:
`\sin` | $\sin$ | `\arcsin` | $\arcsin$ | `\sinh` | $\sinh$
`\cos` | $\cos$ | `\arccos` | $\arccos$ | `\cosh` | $\cosh$
`\tan` | $\tan$ | `\arctan` | $\arctan$ | `\tanh` | $\tanh$
`\sec` | $\sec$ | `\csc` | $\csc$ | `\cot` | $\cot$
`\lim` | $\lim$ | `\limsup` | $\limsup$ | `\liminf` | $\liminf$
`\sup` | $\sup$ | `\inf` | $\inf$ | `\exp` | $\exp$
`\max` | $\max$ | `\min` | $\min$ | `\Pr` | $\Pr$
`\log` | $\log$ | `\ln` | $\ln$ | `\lg` | $\lg$
`\deg` | $\deg$ | `\hom` | $\hom$ | `\arg` | $\arg$
`\bmod` | $\bmod$ | `\dim` | $\dim$ | `\ker` | $\ker$
`\argmax` | $\argmax$ | `\argmin` | $\argmin$ | `\operatorname{}` | $\operatorname{optr}$


## Constructs

LaTeX | Display | LaTeX | Display
:---: | :---: | :---: | :---: 
`\overbrace` | $\overbrace{x_1 x_2 x_3 \cdots x_n}$ | `\underbrace` | $\underbrace{a_1+a_2+\cdots+a_n}$
`\overrightarrow` | $\overrightarrow{AB}$ | `\overleftarrow` | $\overleftarrow{BA}$
`\underleftarrow{ABC}` | $\underleftarrow{ABC}$ | `\underrightarrow{ABC}` | $\underrightarrow{ABC}$
`\overleftrightarrow{ABC}` | $\overleftrightarrow{ABC}$ | `\underleftrightarrow{ABC}` | $\underleftrightarrow{ABC}$
`\xleftarrow[A]{B}` | $\xleftarrow[A]{B}$ | `\xrightarrow[A]{B}` | $\xrightarrow[A]{B}$
`\xleftrightarrow[A]{B}` | $\xleftrightarrow[A]{B}$ | `\xlongequal[A]{B}` | $\xlongequal[A]{B}$
`\overline` | $\overline{XYZ}$ | `\underline` | $\underline{XY}$
`\widehat` | $\widehat{abc}$ | `\widetilde` | $\widetilde{MN}$  
`\overset{*}{x}` | $\overset{*}{x}$ | `\underset{*}{x}` | $\underset{*}{x}$


## Large Operation Symbols

LaTeX | Display | LaTeX | Display | LaTeX | Display
:---: | :---: | :---: | :---: | :---: | :---: 
`\sum` | $\sum$ | `\prod` | $\prod$ | `\coprod` | $\coprod$
`\int` | $\int$ | `\iint` | $\iint$ | `\iiint` | $\iiint$
`\oint` | $\oint$ | `\oiint` | $\oiint$ | `\oiiint` | $\oiiint$
`\bigcap` | $\bigcap$ | `\bigcup` | $\bigcup$ | `\biguplus` | $\biguplus$
`\bigwedge` | $\bigwedge$ | `\bigvee` | $\bigvee$ | `\bigsqcup` | $\bigsqcup$
`\bigoplus` | $\bigoplus$ | `\bigotimes` | $\bigotimes$ | `\bigodot` | $\bigodot$


## Relation Symbols

LaTeX | Display | LaTeX | Display
:---: | :---: | :---: | :---:
`\because` | $\because$ | `\therefore` | $\therefore$
`\propto` | $\propto$ | `\varpropto` | $\varpropto$
`\forall` | $\forall$ | `\exists` | $\exists$
`\emptyset` | $\emptyset$ | `\varnothing` | $\varnothing$
`\sim` | $\sim$ | `\backsim` | $\backsim$
`\simeq` | $\simeq$ | `\backsimeq` | $\backsimeq$
`\approx` | $\approx$ | `\approxeq` | $\approxeq$
`\thicksim` | $\thicksim$ | `\thickapprox` | $\thickapprox$
`\triangleq` | $\triangleq$ | `\cong` | $\cong$
`\dot=` or `\doteq` | $\doteq$ | `\doteqdot` | $\doteqdot$
`\fallingdotseq` | $\fallingdotseq$ | `\risingdotseq` | $\risingdotseq$
`\bumpeq` | $\bumpeq$ | `\Bumpeq` | $\Bumpeq$
`\circeq` | $\circeq$ | `\eqcirc` | $\eqcirc$
`\ne` or `\neq` | $\ne$ | `\not` | $\not$
`\nsim` | $\nsim$ | `\ncong` | $\ncong$
`\leqslant` | $\leqslant$ | `\geqslant` | $\geqslant$
`\le` or `\leq` | $\le$ | `\ge` or `\geq` | $\ge$
`\leqq` | $\leqq$ | `\geqq` | $\geqq$
`\equiv` | $\equiv$ | `\not\equiv` | $\not\equiv$
`\ll` | $\ll$ | `\gg` | $\gg$
`\lll` | $\lll$ | `\ggg` | $\ggg$
`\eqslantless` | $\eqslantless$ | `\eqslantgtr` | $\eqslantgtr$
`\nless` | $\nless$ | `\ngtr` | $\ngtr$
`\nleqslant` | $\nleqslant$ | `\ngeqslant` | $\ngeqslant$
`\nleq` | $\nleq$ | `\ngeq` | $\ngeq$
`\nleqq` | $\nleqq$ | `\ngeqq` | $\ngeqq$
`\lneq` | $\lneq$ | `\gneq` | $\gneq$
`\lneqq` | $\lneqq$ | `\gneqq` | $\gneqq$
`\lvertneqq` | $\lvertneqq$ | `\gvertneqq` | $\gvertneqq$
`\lesssim` | $\lesssim$ | `\gtrsim` | $\gtrsim$
`\lessapprox` | $\lessapprox$ | `\gtrapprox` | $\gtrapprox$
`\lnsim` | $\lnsim$ | `\gnsim` | $\gnsim$
`\lnapprox` | $\lnapprox$ | `\gnapprox` | $\gnapprox$
`\lessdot` | $\lessdot$ | `\gtrdot` | $\gtrdot$
`\lessgtr` | $\lessgtr$ | `\gtrless` | $\gtrless$
`\lesseqgtr` | $\lesseqgtr$ | `\gtreqless` | $\gtreqless$
`\lesseqqgtr` | $\lesseqqgtr$ | `\gtreqqless` | $\gtreqqless$
`\prec` | $\prec$ | `\succ` | $\succ$
`\preceq` | $\preceq$ | `\succeq` | $\succeq$
`\preccurlyeq` | $\preccurlyeq$ | `\succcurlyeq` | $\succcurlyeq$
`\curlyeqprec` | $\curlyeqprec$ | `\curlyeqsucc` | $\curlyeqsucc$
`\precsim` | $\precsim$ | `\succsim` | $\succsim$
`\precapprox` | $\precapprox$ | `\succapprox` | $\succapprox$
`\nprec` | $\nprec$ | `\nsucc` | $\nsucc$
`\npreceq` | $\npreceq$ | `\nsucceq` | $\nsucceq$
`\precnsim` | $\precnsim$ | `\succnsim` | $\succnsim$
`\precnapprox` | $\precnapprox$ | `\succnapprox` | $\succnapprox$
`\vartriangleleft` or `\lhd` | $\lhd$ | `\vartriangleright` or `\rhd` | $\rhd$
`\trianglelefteq` or `\unlhd` | $\unlhd$ | `\trianglerighteq` or `\unrhd` | $\unrhd$
`\triangleleft` | $\triangleleft$ | `\triangleright` | $\triangleright$
`\ntriangleleft` | $\ntriangleleft$ | `\ntriangleright` | $\ntriangleright$
`\ntrianglelefteq` | $\ntrianglelefteq$ | `\ntrianglerighteq` | $\ntrianglerighteq$
`\in` | $\in$ | `\ni` | $\ni$
`\notin` | $\notin$ | `\notni` | <!--$\notni$-->$\not\ni$
`\subset` | $\subset$ | `\supset` | $\supset$
`\subseteq` | $\subseteq$ | `\supseteq` | $\supseteq$
`\subsetneq` | $\subsetneq$ | `\supsetneq` | $\supsetneq$
`\varsubsetneq` | $\varsubsetneq$ | `\varsupsetneq` | $\varsupsetneq$
`\subseteqq` | $\subseteqq$ | `\supseteqq` | $\supseteqq$
`\subsetneqq` | $\subsetneqq$ | `\supsetneqq` | $\supsetneqq$
`\varsubsetneqq` | $\varsubsetneqq$ | `\varsupsetneqq` | $\varsupsetneqq$
`\Subset` | $\Subset$ | `\Supset` | $\Supset$
`\nsubseteq` | $\nsubseteq$ | `\nsupseteq` | $\nsupseteq$
`\nsubseteqq` | $\nsubseteqq$ | `\nsupseteqq` | $\nsupseteqq$
`\setminus` or `\backslash` | $\setminus$ | `\smallsetminus` | $\smallsetminus$
`\sqsubset` | $\sqsubset$ | `\sqsupset` | $\sqsupset$
`\sqsubseteq` | $\sqsubseteq$ | `\sqsupseteq` | $\sqsupseteq$
`\sqcap` | $\sqcap$ | `\sqcup` | $\sqcup$
`\vdash` | $\vdash$ | `\dashv` | $\dashv$
`\Vdash` | $\Vdash$ | `\vDash` | $\vDash$
`\Vvdash` | $\Vvdash$ | `\models` | $\models$
`\nvdash` | $\nvdash$ | `\nVDash` | $\nVDash$
`\nVdash` | $\nVdash$ | `\nvDash` | $\nvDash$
`\bowtie` | $\bowtie$ | `\Join` | $\Join$
`\ltimes` | $\ltimes$ | `\rtimes` | $\rtimes$
`\mid` | $\mid$ | `\parallel` | $\parallel$
`\shortmid` | $\shortmid$ | `\shortparallel` | $\shortparallel$
`\nmid` | $\nmid$ | `\nparallel` | $\nparallel$
`\nshortmid` | $\nshortmid$ | `\nshortparallel` | $\nshortparallel$
`\smile` | $\smile$ | `\frown` | $\frown$
`\smallsmile` | $\smallsmile$ | `\smallfrown` | $\smallfrown$
`\between` | $\between$ | `\pitchfork` | $\pitchfork$


## Binary Operators

LaTeX | Display | LaTeX | Display 
:---: | :---: | :---: | :---:
`\ast` | $\ast$ |  `\bullet` | $\bullet$
`\cdot` | $\cdot$ | `\centerdot` | $\centerdot$
`\times` | $\times$ | `\div` | $\div$
`\pm` | $\pm$ | `\mp` | $\mp$
`\dotplus` | $\dotplus$ | `\divideontimes` | $\divideontimes$
`\oplus` | $\oplus$ | `\ominus` | $\ominus$
`\otimes` | $\otimes$ | `\oslash` | $\oslash$
`\odot` | $\odot$ | `\circleddash` | $\circleddash$
`\circledast` | $\circledast$ | `\circledcirc` | $\circledcirc$
`\square` or `\Box` | $\square$ | `\boxdot` | $\boxdot$
`\boxplus` | $\boxplus$ | `\boxminus` | $\boxminus$
`\boxtimes` | $\boxtimes$ | `\lnot` or `\neg` | $\lnot$
`\wedge` or `\land` | $\wedge$ | `\vee` or `\lor` | $\vee$
`\barwedge` | $\barwedge$ | `\veebar` | $\veebar$
`\curlywedge` | $\curlywedge$ | `\curlyvee` | $\curlyvee$
`\doublebarwedge` | $\doublebarwedge$ | `\wr` | $\wr$
`\cap` | $\cap$ | `\cup` | $\cup$
`\Cap` or `\doublecap` | $\Cap$ | `\Cup` or `\doublecup` | $\Cup$
`\uplus` | $\uplus$ | `\intercal` | $\intercal$
`\sqcap` | $\sqcap$ | `\sqcup` | $\sqcup$
`\bot` or `\perp` | $\bot$ | `\top` | $\top$
`\dagger` | $\dagger$ | `\ddagger` | $\ddagger$
`\leftthreetimes` | $\leftthreetimes$ | `\rightthreetimes` | $\rightthreetimes$


## Miscellaneous Symbols

LaTeX | Display | LaTeX | Display 
:---: | :---: | :---: | :---:
`\prime` | $\prime$ | `\backprime` | $\backprime$
`\aleph` | $\aleph$ | `\beth` | $\beth$
`\gimel` | $\gimel$ | `\daleth` | $\daleth$
`\infty` | $\infty$ | `\And` or `\&` | $\And$
`\nabla` | $\nabla$ | `\partial` | $\partial$
`\Re` | $\Re$ | `\Im` | $\Im$
`\spadesuit` | $\spadesuit$ | `\heartsuit` | $\heartsuit$
`\clubsuit` | $\clubsuit$ | `\diamondsuit` | $\diamondsuit$
`\circ` | $\circ$ | `\bigcirc` | $\bigcirc$
`\star` | $\star$ | `\bigstar` | $\bigstar$
`\square` | $\square$ | `\blacksquare` | $\blacksquare$
`\lozenge` or `\Diamond` | $\lozenge$ | `\blacklozenge` | $\blacklozenge$
`\triangle` | $\triangle$ | `\blacktriangle` | $\blacktriangle$
`\triangledown` | $\triangledown$ | `\blacktriangledown` | $\blacktriangledown$
`\bigtriangleup` | $\bigtriangleup$ | `\bigtriangledown` | $\bigtriangledown$
`\triangleleft` | $\triangleleft$ | `\triangleright` | $\triangleright$
`\blacktriangleleft` | $\blacktriangleleft$ | `\blacktriangleright` | $\blacktriangleright$
`\diamond` | $\diamond$ | `\eth` | $\eth$
`\diagdown` | $\diagdown$ | `\diagup` | $\diagup$
`\Finv` | $\Finv$ | `\Game` | $\Game$
`\cdots` or `\dotsb` | $\cdots$ | `\ldots` or `\dots` | $\ldots$
`\vdots` | $\vdots$ | `\ddots` | $\ddots$
`\ulcorner` | $\ulcorner$ | `\urcorner` | $\urcorner$
`\llcorner` | $\llcorner$ | `\lrcorner` | $\lrcorner$
`\imath` | $\imath$ | `\jmath` | $\jmath$
`\ell` | $\ell$ | `\wp` | $\wp$
`\hbar` | $\hbar$ | `\hslash` | $\hslash$
`\sharp` | $\sharp$ | `\flat` | $\flat$
`\natural` | $\natural$ | `\surd` | $\surd$
`\angle` | $\angle$ | `\measuredangle` | $\measuredangle$
`\sphericalangle` | $\sphericalangle$ | `\complement` | $\complement$
`\amalg` | $\amalg$ | `\mho` | $\mho$
`\circledS` | $\circledS$ | `\backepsilon` | $\backepsilon$



## Arrows

LaTeX | Display | LaTeX | Display 
:---: | :---: | :---: | :---:
`\leftarrow` | $\leftarrow$ | `\rightarrow` | $\rightarrow$
`\nleftarrow` | $\nleftarrow$ | `\nrightarrow` | $\nrightarrow$
`\longleftarrow` | $\longleftarrow$ | `\longrightarrow` | $\longrightarrow$
`\Leftarrow` | $\Leftarrow$ | `\Rightarrow` | $\Rightarrow$
`\nLeftarrow` | $\nLeftarrow$ | `\nRightarrow` | $\nRightarrow$
`\Longleftarrow` | $\Longleftarrow$ | `\Longrightarrow` | $\Longrightarrow$
`\Lleftarrow` | $\Lleftarrow$ | `\Rrightarrow` | $\Rrightarrow$
`\leftleftarrows` | $\leftleftarrows$ | `\rightrightarrows` | $\rightrightarrows$
`\leftrightarrow` | $\leftrightarrow$ | `\Leftrightarrow` | $\Leftrightarrow$
`\nleftrightarrow` | $\nleftrightarrow$ | `\nLeftrightarrow` | $\nLeftrightarrow$
`\longleftrightarrow` | $\longleftrightarrow$ | `\Longleftrightarrow` | $\Longleftrightarrow$
`\leftrightarrows` | $\leftrightarrows$ | `\rightleftarrows` | $\rightleftarrows$
`\uparrow` | $\uparrow$ | `\downarrow` | $\downarrow$
`\Uparrow` | $\Uparrow$ | `\Downarrow` | $\Downarrow$
`\upuparrows` | $\upuparrows$ | `\downdownarrows` | $\downdownarrows$
`\leftharpoonup` | $\leftharpoonup$ | `\rightharpoonup` | $\rightharpoonup$
`\leftharpoondown` | $\leftharpoondown$ | `\rightharpoondown` | $\rightharpoondown$
`\upharpoonleft` | $\upharpoonleft$ | `\downharpoonleft` | $\downharpoonleft$
`\upharpoonright` | $\upharpoonright$ | `\downharpoonright` | $\downharpoonright$
`\leftrightharpoons` | $\leftrightharpoons$ | `\rightleftharpoons` | $\rightleftharpoons$
`\nearrow` | $\nearrow$ | `\nwarrow` | $\nwarrow$
`\searrow` | $\searrow$ | `\swarrow` | $\swarrow$
`\dashleftarrow` | $\dashleftarrow$ | `\dashrightarrow` | $\dashrightarrow$
`\hookleftarrow` | $\hookleftarrow$ | `\hookrightarrow` | $\hookrightarrow$
`\looparrowleft` | $\looparrowleft$ | `\looparrowright` | $\looparrowright$
`\leftarrowtail` | $\leftarrowtail$ | `\rightarrowtail` | $\rightarrowtail$
`\twoheadleftarrow` | $\twoheadleftarrow$ | `\twoheadrightarrow` | $\twoheadrightarrow$
`\curvearrowleft` | $\curvearrowleft$ | `\curvearrowright` | $\curvearrowright$
`\circlearrowleft` | $\circlearrowleft$ | `\circlearrowright` | $\circlearrowright$
`\Lsh` | $\Lsh$ | `\Rsh` | $\Rsh$
`\mapsto` | $\mapsto$ | `\longmapsto` | $\longmapsto$
`\multimap` | $\multimap$ | `\leadsto` or `\rightsuigarrow` | $\leadsto$
`\leftrightsquigarrow` | $\leftrightsquigarrow$


$\LaTeX$ formulas are now rendered by $\KaTeX$. The MathJax version was deprecated.

[KaTeX Supported Functions at katex.org](https://katex.org/docs/supported.html){:target="_blank"}
