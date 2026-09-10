" Updated by: GPT-6 (Codex); 保留原设置，将撤销数据移出仓库。
" 显示选项。
set background=dark
set number
set relativenumber
set cursorline
syntax on

" 缩进：Tab 显示为两列；按 Tab 时实际插入空格。
set tabstop=2
set shiftwidth=2  " 执行 >> / << 缩进或者退回时增减 2 个空格
set softtabstop=2 " 插入模式按Tab/Backspace时，一次处理 2 个空格
set expandtab     " 按下Tab自动插入空格，而不是 \t
set autoindent    " 换行时保持个上一行相同的缩进级别
set smartindent

" 搜索：输入时即时匹配；默认忽略大小写，模式中出现大写字母时区分大小写。
set hlsearch
set incsearch
set ignorecase
set smartcase

" 当 Vim 编译时提供 clipboard 支持时，使用系统剪贴板。
set clipboard=unnamedplus

" Vim 内置插入补全的候选来源：当前 buffer、其他窗口、已加载 buffer、
" tags 和 include 文件。Ctrl-n打开补全菜单，Cn向下，Cp向上选择，Cy
" 确认选择，Ce取消补全，恢复原来输入
set complete=.,w,b,t,i
set completeopt=menuone,noselect

" 始终显示底部状态栏。Airline 加载后可能接管它；这里的定义是内置后备方案。
set laststatus=2
set showmode

function! CurrentMode() abort
    let l:mode = mode()
    if l:mode ==# 'n'
        return 'NORMAL'
    elseif l:mode ==# 'i'
        return 'INSERT'
    elseif l:mode ==# 'v'
        return 'VISUAL'
    elseif l:mode ==# 'V'
        return 'V-LINE'
    elseif l:mode ==# "\<C-v>"
        return 'V-BLOCK'
    elseif l:mode ==# 'R'
        return 'REPLACE'
    elseif l:mode ==# 'c'
        return 'COMMAND'
    endif
    return 'OTHER'
endfunction

set statusline=%#StatusLine#
set statusline+=\ %{CurrentMode()}
set statusline+=\ \|\ %f
set statusline+=%m
set statusline+=%=
set statusline+=line\ %l/%L
set statusline+=\ \|\ col\ %c
set statusline+=\ \|\ %p%%

" 可选实验：用 Tab 在 Vim 内置补全菜单中移动。
" 在理解默认补全行为之前保持禁用。
"function! CheckBackspace() abort
"    let l:col = col('.') - 1
"    return !l:col || getline('.')[l:col - 1] =~# '\s'
"endfunction
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : CheckBackspace() ? "\<Tab>" : "\<C-n>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set colorcolumn=100
set splitbelow
set splitright
set pumheight=10 " 设置C-n显示的菜单的高度
set scrolloff=10

" 修改过的buffer不保存也可以先切换
set hidden

" 永久撤销，关闭vim后仍可撤销
set undofile
" 提取路径（末尾加 // 是为了让 Vim 将完整路径编码为扁平文件名，避免不同目录同名文件冲突）
" 变量作用域 s:：将路径存在脚本局部变量中，避免污染全局命名空间。
let s:undo_dir = expand('~/.local/state/vim/undo')

" 判断目录是否存在，不存在则使用 'p' 参数递归创建父目录
if !isdirectory(s:undo_dir)
    call mkdir(s:undo_dir, 'p')
endif

" 确保开启持久撤销并将路径赋值给 undodir
let &undodir = s:undo_dir . '//'

" 备份和swp文件
set nobackup                " 不生成带有 ~ 结尾的冗余备份文件
set nowritebackup
set noswapfile              " 禁用 .swp 临时文件（现代环境下多数依靠 Git 和自动存盘）
