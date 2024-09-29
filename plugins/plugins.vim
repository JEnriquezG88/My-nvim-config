call plug#begin('~/.local/share/nvim/plugged')

" Aquí van tus plugins
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'github/copilot.vim'

call plug#end()
" Configuración de nvim-tree
lua << EOF
require'nvim-tree'.setup {
  view = {
    width = 30,
    side = 'left'
  },
}
EOF
source ~/.config/nvim/plugins/config.vim
