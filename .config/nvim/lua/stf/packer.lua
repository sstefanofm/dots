-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'andrew-george/telescope-themes' }
    }
  }
  use { 'nvim-telescope/telescope-ui-select.nvim' }

  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use 'tpope/vim-fugitive'

  use 'neovim/nvim-lspconfig'

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      "3rd/image.nvim", -- image support in preview window: See `# Preview Mode` for more information
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvimtools/none-ls.nvim',
    requires = {
      { 'nvimtools/none-ls-extras.nvim' },
    }
  }

  use {
    'goolord/alpha-nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    }
  }
  use { 'hrsh7th/cmp-nvim-lsp' }

  use { 'mfussenegger/nvim-jdtls' }

  use { 'lewis6991/gitsigns.nvim' }

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
        require("nvim-autopairs").setup {}
    end
  }
end)
