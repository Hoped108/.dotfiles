" Updated by: GPT-6 (Codex); 沿用原有模块，增加本机覆盖入口。
" ~/.vimrc 只作为入口。每一类设置放在固定文件中，方便以后定位问题。
" :source 的含义是：在当前位置读取并执行另一个 Vimscript 文件。
source ~/.vim/config/plugins.vim
source ~/.vim/config/options.vim
source ~/.vim/config/keymaps.vim
source ~/.vim/config/plugin-settings.vim
source ~/.vim/config/lsp.vim
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
