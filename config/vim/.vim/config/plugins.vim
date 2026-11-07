" Updated by: GPT-6 (Codex); 插件列表保留，修正运行路径。
" 必须先初始化 Vundle，再写 Plugin 声明。
" :PluginInstall 会读取 vundle#begin/end 之间的插件列表。
set nocompatible " Be IMproved, required for modern defaults(not compatible for vi)
filetype off

" 先把 Vundle 自己加入 'runtimepath'，再由它管理 bundle 目录。
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让 Vundle 管理它自己。
Plugin 'VundleVim/Vundle.vim'

" 界面插件。
Plugin 'voldikss/vim-floaterm'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" C/C++ Enhanced Syntax Highlighting
Plugin 'bfrg/vim-cpp-modern'

" fuzzy find
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" 快速修改括号、引号和标签
Plugin 'tpope/vim-surround'

" --- LSP Core & Completion ---
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

call vundle#end()

" Vundle 调整完 'runtimepath' 后，重新启用文件类型检测、插件和缩进规则。
filetype plugin indent on " Enable filetype detection, plugins, and indenting

" --- Lazy loading ---
" Vundle 把每个插件目录都放进了 'runtimepath'，Vim 启动时会 source 它们的
" plugin/*.vim。先把要延迟的目录摘出来，第一次用到时再放回去并 source。
" 相关文档：:help 'runtimepath'、:help load-plugins
" 注意：只对不在启动期被依赖的插件有意义；摘掉后 :help <插件> 也需先加载。
let s:lazy_plugins = ['nerdtree']

function! s:drop_runtimepath(dirs) abort
  let l:keep = []
  for l:entry in split(&runtimepath, ',')
    if index(a:dirs, l:entry) < 0
      call add(l:keep, l:entry)
    endif
  endfor
  let &runtimepath = join(l:keep, ',')
endfunction

for s:name in s:lazy_plugins
  let s:dir = expand('~/.vim/bundle/' . s:name)
  call s:drop_runtimepath([s:dir, s:dir . '/after'])
endfor
unlet s:name s:dir

" 把插件目录放回 'runtimepath' 并执行它的 plugin/*.vim；重复调用无副作用。
function! LazyLoadPlugin(name) abort
  let l:dir = expand('~/.vim/bundle/' . a:name)
  if index(split(&runtimepath, ','), l:dir) >= 0
    return
  endif
  let &runtimepath = l:dir . ',' . l:dir . '/after,' . &runtimepath
  for l:file in glob(l:dir . '/plugin/**/*.vim', 0, 1)
    execute 'source' fnameescape(l:file)
  endfor
endfunction

function! ToggleNERDTree() abort
  call LazyLoadPlugin('nerdtree')
  NERDTreeToggle
endfunction
