" --- Clangd LSP Server Registration ---
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd', 
              \ '--background-index', 
              \ '--clang-tidy', 
              \ '--header-insertion=iwyu',
              \ '-j=4']},
            \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
            \ })
    augroup END
endif

" --- Diagnostics & UI Display ---
" 目标像 VSCode：有问题的行留标记，但不把消息铺在代码里；
" 光标停到问题处时才显示消息。相关选项见 :help g:lsp_diagnostics_*
let g:lsp_diagnostics_enabled = 1

" 关掉“主动报错”的展示。virtual_text 在支持它的 Vim 9 上默认是开的，
" 会在行尾追加错误文字，这是要关掉的主要一项。
let g:lsp_diagnostics_virtual_text_enabled = 0

" 诊断消息用浮窗显示（类似 VSCode 的 hover），不再占用底部命令行。
" 判定同 echo：光标落在诊断范围内才弹，移动光标就关闭；
" 需要 popup 支持，可用 has('popupwin') 自查。:help g:lsp_diagnostics_float_cursor
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 300
let g:lsp_diagnostics_echo_cursor = 0 " echo the error message at status line

" 保留“行标记”：sign 列 + 出错字符的下划线。
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_delay = 200
let g:lsp_diagnostics_highlights_enabled = 0 " disabled the background highlight

" --- Autocompletion Settings ---
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" --- LSP Key Mappings (C / C++ Buffers) ---
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> K  <plug>(lsp-hover)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>f  <plug>(lsp-document-format)
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
