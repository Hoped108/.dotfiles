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

" toggle floating terminal with <leader>t or <F12>
nnoremap <silent> <leader>t :FloatermToggle<CR>

" 关闭搜索高亮
nnoremap <silent> <leader>h :nohlsearch<CR>

" buffer切换
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>

" 文件名、项目内容和已打开的 buffer。
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<Space>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <leader>ft :Tags<CR>

" Tagbar (Function & Symbol Outline)
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autofocus = 1

" 窗口跳转优化（不用反复按Ctrl-W）
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Smart Quit function ---
function! SmartQuit() abort
  " Check if floaterm plugin functions exist and if any floaterm buffer is
  " loaded
  if exists('*floaterm#buflist#gather')
    let l:terms = floaterm#buflist#gather()
    if !empty(l:terms)
      silent! FloatermKill!
    endif
  endif
  " Proceed to quit current window or file
  quit
endfunction

" 保存与快速退出
nnoremap <leader>w :write<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :call SmartQuit()<CR>
tnoremap <silent> <leader>q <C-\><C-n>:call SmartQuit()<CR>

" --- Documentation & Help Keymaps ---

" Open the comprehensive user manual table of contents in a full tab
nnoremap <leader>? :tab help user-manual<CR>
