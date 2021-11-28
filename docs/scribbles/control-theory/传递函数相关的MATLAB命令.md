# 传递函数相关的 MATLAB 命令

### 多项式

使用系数行向量表示。如 $p(x) = x^2 + 4x + 4$ 表示为
```
p = [1 4 4]
```
将 $x_0$ 代入求值
```
val = polyval(p, x0)
```

求解 $p(x) = 0$
```
r = roots(p)    % r = [-2; -2]
```
由这些根重新构造多项式
```
p = poly(r)
```

多项式相乘（卷积）
```
conv(p1, p2)
```

部分分式展开
```
[r, p, k] = residue(num, den)
```
`p` 为展开后各分式极点，`r` 为各分式在极点上的留数（分子），`k` 为余下的常数项。反过来，也可以将部分分式合并
```
[num, den] = residue(r, p, k)
```

化简分式（零极点对消）
```
sys0 = minreal(sys)
```

求极限
```
Ess = limit(s*E, s, 0)
```

拉普拉斯变换
```
sys_s = laplace(sys_t_sym, t, s)
```
相似地有 `ilaplace` 函数。函数接受的都是 `syms` 表达式。

极大值与极大值点
```
y_max = max(y)
[y_max, t_p] = max(y)
```

符号表达式代值（使用 `eval` 求值）
```
y_dynamic = eval(subs(res, [omega_n, zeta], [sqrt(21), 2/2/sqrt(21)]))
y_infty = eval(subs(y_dynamic, t, 1e8))
```

### 传递函数

若传递函数有上述多项式形式的分子 `num` 与 分母 `den`，则系统为
```
sys = tf(num, den)
```
此系统之零点与极点分别为
```
z = zero(sys)
p = pole(sys)
```

绘制零极点分布图
```
pzmap(sys)
```

以零点、极点、增益来描述模型
```
sys = zpk(z, p, k)
```

这两种描述系统的方式可以互相转换
```
[num, den] = zp2tf(z, p, k)
[z, p, k] = tf2zp(num, den)
```

各系统之串联、并联、反馈连接
```
sys = series(G1, G2)
sys = parallel(G1, G2)
sys = feedback(G1, H1, sign)
```

阶跃稳态值（low-frequency gain）
```
y = dcgain(sys)
```

阶跃响应
```
step(sys)
% or
t = 0:0.1:10
y = step(sys, t)
plot(t, y)
```
相似地有 `impulse` 函数。

求任意输入信号的响应
```
t = 0:0.1:10
r = t
y = lsim(sys, r, t)
plot(y, t)
```

传递函数转多项式
```
[num, den] = tfdata(sys, 'v')
```

多项式转符号表达式
```
syms s
sys_sym = poly2sym(num, s)/poly2sym(den, s)
```


### 其它

显示空行
```
disp(newline)
```

字符串格式化
```
disp(sprintf('Overshoot = %.2f%%', overshoot*100))
```

四舍五入至 $10^{-n}$ 位
```
x = round(x, n)
```

调整图位置
```
figure(1)
...
set(figure(1),'Position',[100,50,1200,900])
```
其中参数分别为左间距、下间距、宽、高的像素值。

图中显示字符
```
text(t_p - 0.06, y_p + 0.02, 'Peak')
```

显示水平/竖直线
```
xline(t_p, '--', 'Peak time', 'LabelVerticalAlignment', 'bottom')
yline(y_p, '--', 'Peak response', 'LabelVerticalAlignment', 'bottom')
```
