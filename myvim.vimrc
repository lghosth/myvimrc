"
" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible
inoremap jk <ESC>
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"noremap <C-l> <C-w>l
inoremap <C-u> <Esc>gUiwea
nnoremap  <F3> :NERDTree <CR>
 nnoremap <F4> :TagbarToggle<CR> 

let mapleader = "'"

let g:molokai_original = 1
let g:rehash256 = 1 
set background=dark
" colorscheme molokai
let g:solarized_termcolors=256

syntax enable
set background=dark
colorscheme solarized

set number
filetype plugin indent on  " Load plugins according to detected filetype.
filetype plugin on 
syntax on                  " Enable syntax highlighting.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set cursorline             " Find the current line quickly.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
"set foldmethod=indent   "设置折叠方式

"set autoindent             " Indent according to previous line.
"set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
"set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without havng to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.






call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' "目录树 git 状态显示
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
" Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/gv.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'
call plug#end()

"let g:indentLine_char = '¦'
"let g:indentLine_setColors = 0
"let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set conceallevel=1 
let g:indentLine_enabled = 1
" Vim
" let g:syntastic_<filetype>_checkers = ['<checker-name>']
" let g:airline_theme = 'moloai' 
let g:indentLine_color_term = 239
set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"
set encoding=utf-8                                                                                                                
set langmenu=zh_CN.UTF-8
set ambiwidth=double "防止特殊符号无法正常显示
let g:airline#extensions#tabline#enabled=1 "顶部tab显示"
nmap <tab> :bn<cr> "设置tab键映射"
"let g:autopep8_disable_show_diff=1

" 设置synatstic 配置
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" 配置结束

"配置ale
"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"结束ale


" 配置NERD comment
" let g:NERDSpaceDelims=1
"F1 开启和关闭 NerdTree
map <F1>:NERDTreeToggle<CR>
let NERDTreeChDirMode=1

let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$'] "设置忽略文件类型
let NERDTreeWinSize=25 "窗口大小
"结束配置NERD comment


" 配置tagbar
nmap <Leader>tb :TagbarToggle<CR>  " 将开启tagbar的快捷键设置为　<Leader>tb
let g:tagbar_ctags_bin='/usr/bin/ctags'  " 设置ctags所在路径
" let g:tagbar_width = 30　" 设置tagbar的宽度
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()　" 在某些情况下自动打开tagbar
"结束配置


"*****************   vim-autoformat   **********************
let g:autoformat_verbosemode=0 "详细模式
let g:autoformat_autoindent = 0
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
let g:formatdef_hl_js='"js-beautify"'
let g:formatdef_hl_c='"clang-format -style=\"{BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, PointerAlignment: Right, ColumnLimit: 150, SpacesBeforeTrailingComments: 1}\""' "指定格式化的方式, 使用配置参数
let g:formatters_c = ['hl_c']
let g:formatters_cpp = ['hl_c']
let g:formatters_json = ['hl_js']
let g:formatters_js = ['hl_js']
let g:formatdef_sqlformat = '"sqlformat --keywords upper -"'
let g:formatters_sql = ['sqlformat']

"保存时自动格式化指定文件类型代码
"au BufWrite *:Autoformat
"autocmd BufWrite *.sql,*.c,*.py,*.java,*.js:Autoformat "设置发生保存事件时执行格式化


"配置auto-pairs
let g:AutoPairsMapCR = 0


