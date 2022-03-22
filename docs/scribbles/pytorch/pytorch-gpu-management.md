# PyTorch GPU Management


### Check whether CUDA is available


```py
torch.cuda.is_available()
```

Returns a bool indicating if CUDA is available. [ᵈᵒᶜ](https://pytorch.org/docs/stable/generated/torch.cuda.is_available.html){:target="_blank"}


### Get device name

```py
torch.cuda.get_device_name(device=None)
```

Returns model name of current or specified GPU. [ᵈᵒᶜ](https://pytorch.org/docs/stable/generated/torch.cuda.get_device_name.html){:target="_blank"}

`device` can be `0`, `cuda:0` etc.

### Device count

```py
torch.cuda.device_count()
```

Returns the number of GPUs available. [ᵈᵒᶜ](https://pytorch.org/docs/stable/generated/torch.cuda.device_count.html){:target="_blank"}

### Current device

```py
torch.cuda.current_device()
```

Returns the ID of current GPU. [ᵈᵒᶜ](https://pytorch.org/docs/stable/generated/torch.cuda.current_device.html)

```py
torch.cuda.set_device(device)
```

(Discouraged) Set current device. [ᵈᵒᶜ](https://pytorch.org/docs/stable/generated/torch.cuda.set_device.html)

### Set available GPUs

```py
os.environ["CUDA_VISIBLE_DEVICES"] = '0,1,2,3'
```

```sh
export CUDA_VISIBLE_DEVICES='0,1,2,3'
```

### Using multiple GPUs

```py
torch.nn.DataParallel(model, device_ids=None, output_device=None, dim=0)
```

Returns a model on multiple GPUs. [ᵈᵒᶜ](https://pytorch.org/docs/stable/generated/torch.nn.DataParallel.html)

`device_ids` can be a list of `int`, a list of `torch.device` or `None` (for all devices).
