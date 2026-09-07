" Updated by: GPT-6 (Codex); 保留原设置，补齐 Vim 文件查找命令。
" Keep :Files useful even when Vim is launched outside Zsh.
if executable('fdfind')
  let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --exclude .git'
elseif executable('fd')
  let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git'
endif
" netrw 是 Vim 内置文件浏览器。直接打开目录而非使用 NERDTree 时，
" 这些选项仍会生效。
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25

" Floaterm：F12 开关窗口；F9/F10 切换终端。
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_next = '<F9>'
let g:floaterm_keymap_prev = '<F10>'
let g:floaterm_autoclose = 1
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'center'

" 可选固定尺寸；保持注释时使用 Floaterm 默认值。
let g:floaterm_height = 0.8
let g:floaterm_width = 0.8

" 在 NERDTree 中显示行号。
let g:NERDTreeShowLineNumbers = 1

" Start NERDTree and leave the cursor in it.
" See NERDTree README 103

" Airline 的 tabline 显示已打开 buffer 及其编号；可用 :buffer {编号} 跳转。
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

" default value leaves the name unmodified
"let g:airline#extensions#branch#format = 0

" to only show the tail, e.g. a branch 'feature/foo' becomes 'foo', use
"let g:airline#extensions#branch#format = 1

" to truncate all path sections but the last one, e.g. a branch
" 'foo/bar/baz' becomes 'f/b/baz', use
"let g:airline#extensions#branch#format = 2

" if a string is provided, it should be the name of a function that
" takes a string and returns the desired value
let g:airline#extensions#branch#format = 'CustomBranchName'
function! CustomBranchName(name)
  return '[' . a:name . ']'
endfunction

" Floaterm buffer 默认是 unlisted，因此 Airline 通常不显示它们。
" 下面的实验会强制加入列表，但它会改变 Floaterm 的正常 buffer 语义，故保持禁用。
"augroup show_floaterm_in_airline
"    autocmd!
"    autocmd FileType floaterm setlocal buflisted
"    autocmd User FloatermOpen,FloatermClose call airline#extensions#tabline#buflist#clean()
"augroup END
