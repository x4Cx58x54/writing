# Linux Initial Setup

## Add User


#### 1) Add user and set password

=== "Ubuntu"
    ```
    adduser username
    ```

=== "CentOS"
    ```
    useradd username
    passwd username
    ```

#### 2) Add to sudoers

```
visudo
```

Add the following line in the file.
```
username    ALL=(ALL)   ALL
```


## Rename Computer

```
sudo hostnamectl set-hostname computername
```
This will apply to all users after reboot.

## Install Zsh and Oh-My-Zsh

#### 1) Install Zsh

=== "Ubuntu"
    ```
    sudo apt install zsh
    ```

=== "CentOS"
    ```
    sudo yum install zsh
    ```

Change default shell.
```
chsh -s /bin/zsh
```

#### 2) Install Oh-My-Zsh

Download Oh-My-Zsh.
```
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
```

Download zsh-syntax-highlighting plugin.
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### 3) Configure Zsh

Copy the configuration file [.zshrc](https://raw.githubusercontent.com/x4Cx58x54/writing/master/docs/guides/linux/assets/.zshrc){:target="_blank"} to `~`.

Some themes may require powerline fonts, which can be found at [powerline/fonts](https://github.com/powerline/fonts){:target="_blank"} and [Znuff/consolas-powerline](https://github.com/Znuff/consolas-powerline){:target="_blank"}.


## Configure Vim

#### 1) Install vim-plug

```
mkdir -p ~/.vim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim
```

To install a plugin, add `Plug 'pluginname'` in the section which starts with `call plug#begin('~/.vim/plugged')` and ends with `call plug#end()` in the vim configuration file (`~/.vimrc` or `/etc/.vimrc`), then run `:PlugInstall` in Vim.

#### 2) Install [lightline](https://github.com/itchyny/lightline.vim){:target="_blank"}

Add the following line to vim-plug section in `.vimrc`:
```
Plug 'itchyny/lightline.vim'
```

#### 3) Install [code-dark colour scheme](https://github.com/tomasiser/vim-code-dark){:target="_blank"}

Add the following line to vim-plug section in `.vimrc`:
```
Plug 'tomasiser/vim-code-dark'
```

Apply the colour scheme in `.vimrc` by
```
colorscheme codedark
```

#### 4) Install [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe){:target="_blank"}

```
Plug 'Valloric/YouCompleteMe'
```

Compile YCM

```
cd ~/.vim/plugged/YouCompleteMe
sudo python3 ./install.py --all
```

Copy YCM conf file

```
cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/
```

Configure YCM in `.vimrc`

```
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 0  " disable YCM
```

#### Other configuration settings

Copy the vim configuration file [.vimrc](https://raw.githubusercontent.com/x4Cx58x54/writing/master/docs/guides/linux/assets/.vimrc){:target="_blank"} to `.vimrc`.

## Setup Python 3.x

#### 1) Install Python 3.x and PIP

=== "Ubuntu"
    ```
    sudo apt install python3-pip
    ```
=== "CentOS"
    ```
    sudo yum install python3
    sudo yum install epel-release
    sudo yum install python3-pip
    ```

Python is installed in Ubuntu by default.

#### 2) Replace PIP source to Tsinghua mirror

```
sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

N. B.: `sudo pip3` and `pip3` install packages into different directories! And they need to configurate respectively, too. It's best to keep to one of them.


## Replace Ubuntu Software Source

Settings -> About -> Software Update -> choose a server

Or

[Ubuntu 镜像使用帮助 - TUNA](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/){:target="_blank"}
