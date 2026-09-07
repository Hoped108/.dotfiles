" Updated by: GPT-6 (Codex); 插件列表保留，修正运行路径。
" 必须先初始化 Vundle，再写 Plugin 声明。
" :PluginInstall 会读取 vundle#begin/end 之间的插件列表。
set nocompatible
filetype off

" 先把 Vundle 自己加入 'runtimepath'，再由它管理 bundle 目录。
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让 Vundle 管理它自己。
Plugin 'VundleVim/Vundle.vim'

" 通用工具。
Plugin 'tpope/vim-fugitive'
Plugin 'skywind3000/asyncrun.vim'

" 界面插件。
Plugin 'voldikss/vim-floaterm'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" fuzzy find
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" 快速修改括号、引号和标签
Plugin 'tpope/vim-surround'

call vundle#end()

" Vundle 调整完 'runtimepath' 后，重新启用文件类型检测、插件和缩进规则。
filetype plugin indent on
