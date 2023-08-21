local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
  -- themes
  Plug('ayu-theme/ayu-vim', { as = 'ayu' })

  -- bling
  Plug 'beauwilliams/statusline.lua'
  Plug 'fladson/vim-kitty'

  -- usage
  Plug('easymotion/vim-easymotion', { as = 'easymotion' })
  Plug 'jiangmiao/auto-pairs'
  Plug('ms-jpq/chadtree', { branch = 'chad', ['do'] = 'python3 -m chadtree deps' })
  -- Plug('ms-jpq/coq_nvim', { as = 'coq' })
  Plug( 'neoclide/coc.nvim', { branch = 'release', as = 'coc' })
  Plug('neovim/nvim-lspconfig', { as = 'lspconfig' })
vim.call('plug#end')

-- require 'cfg.coq'
require 'cfg.chadtree'
