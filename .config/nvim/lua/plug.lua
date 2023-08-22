local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
  -- themes
  Plug('ayu-theme/ayu-vim', { as = 'ayu' })

  -- status bar
  Plug 'beauwilliams/statusline.lua'

  -- tree
  Plug('ms-jpq/chadtree', { branch = 'chad', ['do'] = 'python3 -m chadtree deps' })

  -- usage
  Plug('easymotion/vim-easymotion', { as = 'easymotion' })
  Plug 'jiangmiao/auto-pairs'
  Plug('alvan/vim-closetag', { as = 'closetag' })

  -- completion
  Plug( 'neoclide/coc.nvim', { branch = 'release', as = 'coc' })
  -- Plug('ms-jpq/coq_nvim', { as = 'coq' })
  -- Plug('neovim/nvim-lspconfig', { as = 'lspconfig' })

  -- syntax
  Plug('sheerun/vim-polyglot', { as = 'polyglot' })
  Plug 'fladson/vim-kitty'
vim.call('plug#end')

-- require 'cfg.coq'
require 'cfg.chadtree'
require 'cfg.coc'
