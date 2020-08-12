# Josephus Survivor

[Josephus Survivor \| 5 kyu \| Codewars](https://www.codewars.com/kata/josephus-survivor){:target="_blank"}

总人数为 $n$，编号为 $0$ ~ $n-1$，报数 $k$。每一轮后，问题变为一个新的约瑟夫问题，但总人数和每人序号发生了变化。设进行到某一轮开始时，剩余人数为 $m$，记其中任一人 $p$ 此时的编号为 $p_m$. 此轮游戏中发生的序号变化为：

$$
\begin{aligned}
0 &\rightarrow m-k\\
1 &\rightarrow m-k+1\\
2 &\rightarrow m-k+2\\
&\vdots\\
k-1 &\rightarrow m-1,\ \text{killed}\\
k &\rightarrow 0\\
&\vdots\\
m-1 &\rightarrow m-k-1\\
\end{aligned}
$$

可得以下递推关系：

$$
p_{m} = (p_{m-1} + k) \operatorname{\%} m
$$

则问题可转述为，记胜者为 $p$，$p_1 = 0$（最后一轮结束后仅剩胜者一人，其新编号将变为 $0$），求 $p_n$.

```c
int josephus_survivor(int n, int k) {
	int res = 0;
	for(int i = 2; i <= n; i++)
		res = (res + k)%i;
	return res+1;
}
```
