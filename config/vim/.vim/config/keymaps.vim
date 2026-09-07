" Updated by: GPT-6 (Codex); 保留原按键，补充文件和内容搜索。
" <Leader> 设为空格；必须写在所有 <Leader> 映射之前。
let mapleader = ' '

" 在插入、可视或命令行模式中输入 jk，回到普通模式。
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <Esc>

" 离开终端输入模式，但不关闭终端 buffer。
tnoremap <F2> <C-\><C-n>

" 打开 NERDTree。终端能否区分 Ctrl-Shift-e 和 Ctrl-e 取决于终端模拟器。
nnoremap <leader>e :NERDTreeToggle<CR>

" 进入新建 Floaterm 的命令行，但不立即执行。
" 示例：按 <Space>tc，输入 `ls`，再按 Enter。
nnoremap <leader>tc :FloatermNew --autoclose=0<Space>

" 关闭搜索高亮
nnoremap <silent> <leader>h :nohlsearch<CR>

" buffer切换
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>

" 文件名、项目内容和已打开的 buffer。
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<Space>
nnoremap <silent> <leader>fb :Buffers<CR>
