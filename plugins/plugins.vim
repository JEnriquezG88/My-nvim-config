call plug#begin('~/.local/share/nvim/plugged')

" Aquí van tus plugins
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'github/copilot.vim'

" Plugin de autocompletado
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'      " Soporte para LSP
Plug 'hrsh7th/cmp-buffer'        " Autocompletar desde el buffer
Plug 'hrsh7th/cmp-path'          " Autocompletar rutas
Plug 'hrsh7th/cmp-cmdline'       " Autocompletar comandos
Plug 'saadparwaiz1/cmp_luasnip'  " Soporte para snippets

" Soporte para LSP
Plug 'neovim/nvim-lspconfig'

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

lua << EOF
local cmp = require'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Usar luasnip para snippets
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
}

-- Configurar el LSP para TypeScript usando ts_ls
require'lspconfig'.ts_ls.setup{}
EOF


source ~/.config/nvim/plugins/config.vim
