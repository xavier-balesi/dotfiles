
require('utils.install_packer')

require('packer').startup({function()
  use { 'wbthomason/packer.nvim' }

  -- nvim-tree
  use { 'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      as = 'nvim-tree',
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = function () require('configure.nvimtree') end,
 }
  -- see tree of functions in code but needs lspconfig
  -- use {
  --   'stevearc/aerial.nvim',
  --   config = function() require('aerial').setup() end
  -- }

  -- sessions
  use {
    'rmagatti/auto-session',
    as = 'auto-session',
    config = function() require('configure.auto-session') end
  }

  -- helpers
  use { 'tpope/vim-surround', config = function() require('configure.vim-surround') end }
  use { 'Raimondi/delimitMate' }
  use { 'svermeulen/vimpeccable' }
  use { 'Asheq/close-buffers.vim' }
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use { 'nvim-lua/plenary.nvim' }

  use { 'NTBBloodbath/rest.nvim',
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require('configure.restvim') end
  }

  -- UI Style
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = { function() require('configure.lualine') end },
  }
  use {
    'kdheepak/tabline.nvim',
    config = function() require('configure.tabline') end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
  }
  -- use { 'gcmt/taboo.vim' }
  use { 'rcarriga/nvim-notify', config = function() vim.notify = require('notify') end }

  -- ColorSchemes

  use { 'kyazdani42/blue-moon' }
  use { 'rebelot/kanagawa.nvim' }

  use { 'rktjmp/lush.nvim' }
  use { 'briones-gabriel/darcula-solid.nvim' }
  use { 'adisen99/codeschool.nvim' }

  use { 'sainnhe/gruvbox-material' }
  use { "EdenEast/nightfox.nvim" }
  use { 'tyrannicaltoucan/vim-deep-space' }
  use { 'catppuccin/vim', as = 'catppuccin' }
  use { 'ghifarit53/tokyonight-vim' }
  use { 'savq/melange' }

  -- git
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }


  -- Terminals
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function() require('configure.toggleterm') end }
  use 'voldikss/vim-floaterm'
  -- cool but the popups doesn't works
    -- use {
    --   'jlesquembre/nterm.nvim',
    --   requires = 'Olical/aniseed',
    --   config = function () require('configure.nterm') end
    -- }

  -- Languages
  use { 'neoclide/coc.nvim', branch = 'release' }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('configure.treesitter') end,
  }
  use { 'mustache/vim-mustache-handlebars' }
  use {
    "danymat/neogen",
    config = function()
        require('neogen').setup {
          enabled = true,
          languages = {
            python = {
              template = {
                annotation_convention = "reST"
              }
            }
          }
        }
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }

  -- Telescope & Cie
  use { 'nvim-telescope/telescope.nvim', as = 'telescope', requires = { 'nvim-lua/plenary.nvim' }, config = function ()
    require('configure.telescope')
  end }
  use { 'fannheyward/telescope-coc.nvim', requires = { 'telescope' } }
  use { 'nvim-telescope/telescope-vimspector.nvim',
    requires = { 'telescope', 'puremourning/vimspector' } }

  -- debugging
  use { 'puremourning/vimspector' }
  use { 'mfussenegger/nvim-dap' }

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})

