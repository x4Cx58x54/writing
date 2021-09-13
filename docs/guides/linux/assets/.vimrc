" vim-plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'Valloric/YouCompleteMe'
call plug#end()

let g:lightline = {'colorscheme': 'one',}

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible          " Use Vim defaults (much better!)
set bs=indent,eol,start   " allow backspacing over everything in insert mode
"set ai                   " always set autoindenting on
"set backup               " keep a backup file
set viminfo='20,\"50      " read/write a .viminfo file, don't store more
                          " than 50 lines of registers
set history=200           " keep 200 lines of command line history
set ruler                 " show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add $PWD/cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 0  " disable YCM

" Keymaps
map <F5> :call CompileRun()<CR>
imap <F5> <ESC> :call CompileRun()<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'python'
        exec '!python3 %'
    endif                                                                              
endfunc

" My settings
set number
set noshowmode
syntax on
set showcmd
set t_Co=256
filetype indent on
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set linebreak
set wrap
set scrolloff=2
set autoread
"highlight LineNr ctermfg=grey
colorscheme codedark
set laststatus=2
