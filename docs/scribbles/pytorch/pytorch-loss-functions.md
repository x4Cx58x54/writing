# PyTorch Loss Functions

## Cross entropy loss

Cross entropy of the predicted distribution $q$ and target distribution $p$ is defined by

$$
H(p, q) = -\sum_x p(x) \log q(x).
$$

A `torch.nn.CrossEntropyLoss` instance takes parameters `input` and `target`. The `input` is expected to be unnormalized outputs of a model (logits), and `target` can be distributions or class indices.

For unbatched data, if the target $t = 0, 1, \cdots, N_\mathrm{class} -1$ is a class index and input $y$ is a $(N_{\mathrm{class}},)$ tensor, each class weighted by $w$,

$$
l = - w_t\ln \frac{\exp y_t}{\sum_{i=0}^{N_{\mathrm{class}}}\exp y_i}.
$$

If the target $t$ is a distribution, with shape $(N_{\mathrm{class}},)$,

$$
l = -\sum_{k=0}^{N_\mathrm{class}} w_k t_k \ln \frac{\exp y_t}{\sum_{i=0}^{N_{\mathrm{class}}}\exp y_i}.
$$

For batched data, the input shape becomes $(N_\mathrm{minibatch}, N_\mathrm{class})$, and the target shape becomes $(N_\mathrm{minibatch},)$ or $(N_\mathrm{minibatch}, N_\mathrm{class})$. Resulting loss has in $N_\mathrm{minibatch}$ elements. The default `reduction` method is `mean`, that is the final result is the mean loss over the minibatch. This parameter can also be `sum` or `none`.

In the case where target contains only class indices, the loss where target is `ignore_index` is zero.



!!! Note "Logits"

    Logits are the unnormalized predicted scores of a model.

    For binary logit,


    $$
    \operatorname{logit} p = \ln \frac{p}{1-p}, \quad p \in (0, 1),
    $$

    where $p$ is the probability. Logit is also called the log-odds for it is the logarithm of the odds $\frac{p}{1-p}$.

    ![](https://upload.wikimedia.org/wikipedia/commons/c/c8/Logit.svg){: width=250px}


    Binary logit is the reverse of the sigmoid function $\displaystyle \sigma(x) = \frac{1}{1 + \mathrm{e}^{-x}} \in (0, 1)$.

    In the multi-class case, logits are normalized to probabilities using softmax.



## Negative log likelihood loss

The likelihood for predicted distribution $p$ and target distribution $q$ is defined to be

$$
L(p, q) = \prod_x q(x)^{p(x)}.
$$

So the negative log likelihood is

$$
-\log L(p, q) = -\sum_x p(x) \log q(x) = H(p, q).
$$

`torch.nn.NLLLoss` takes log probabilities $\log q$ as `input` and class indices as `target`. And the rest of the computation is the same as cross entropy as proved above.

$$
\operatorname{NLLLoss}(x, \mathrm{target}) = \operatorname{CELoss}(\log\operatorname{softmax}(x), \mathrm{target}).
$$

This can be verified by the script below.

```python
import torch

ce_loss_fn = torch.nn.CrossEntropyLoss(reduction='none')
nll_loss_fn = torch.nn.NLLLoss(reduction='none')

log_softmax_fn = torch.nn.LogSoftmax(dim=0)

n_class = 10
logits = torch.randn((n_class,))
log_prob = log_softmax_fn(logits)
target = torch.randint(0, n_class, []) # tensor of empty shape, a scalar

ce_loss = ce_loss_fn(logits, target)
nll_loss = nll_loss_fn(log_prob, target)

print(ce_loss, nll_loss)
print(torch.allclose(ce_loss, nll_loss)) # test if tensors of float are very close
```

## KL divergence loss

The input a `torch.nn.KLDivLoss` instance takes are log probabilities, and the target is in a tensor of the same shape of input, in or not in log space determined by `log_target`.

In the default case, `log_target` is false, and target is a tensor of probabilities,

$$
l = \mathrm{target} \cdot (\log \mathrm{target} - \mathrm{input}),
$$

where all the operations are element-wise. If `log_target` is true,

$$
l = \exp\mathrm{target} \cdot (\mathrm{target} - \mathrm{input}),
$$

As for PyTorch 1.12, parameter `reduction` can be `batchmean`, `mean`, `sum` or `none`. If `none`, the output is of the same shape as input and target; if `mean`, $\operatorname{output} = \sum l / \operatorname{size}(l)$; if `batchmean`, $\operatorname{output} = \sum l / \operatorname{size}(l)[0]$.

$$
D(p \parallel q) = \sum p\log\frac{p}{q} = -H(p) + H(p, q),
$$

this can be verified by the script below.

```python
import torch

ce_loss_fn = torch.nn.CrossEntropyLoss(reduction='none')
kldiv_loss_fn = torch.nn.KLDivLoss(reduction='sum')

n_class = 10
logits = torch.randn((n_class,))
probs = torch.softmax(logits, dim=0)
log_probs = torch.log(probs)

target = torch.rand((n_class,))
target /= target.sum()

target_entropy = torch.distributions.Categorical(probs=target).entropy()
kldiv = kldiv_loss_fn(log_probs, target)
ce = ce_loss_fn(logits, target)

print(torch.allclose(kldiv, -target_entropy+ce))
```

## Binary cross entropy loss

A `torch.nn.BCELoss` instance takes `input` and `target` probabilities of the same shape, and the output is also of the same shape:

$$
l = - w (y \ln x + (1-y)\ln(1-x)).
$$

A `torch.nn.BCEWithLogitsLoss` instance combines a sigmoid layer and an BCELoss layer, and takes logits as inputs.

$$
l = - w (y \ln \sigma(x) + (1-y)\ln(1-\sigma(x))).
$$
