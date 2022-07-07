
require('utils.install_packer')

local function get_config(name)
  return string.format('require("configure/%s")', name)
end

require('packer').startup({function()
  use { 'wbthomason/packer.nvim' }

  -- nvim-tree
  use { 'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      as = 'nvim-tree',
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = get_config('nvimtree'),
 }

  -- sessions
  use {
    'rmagatti/auto-session',
    as = 'auto-session',
    config = get_config('auto-session'),
  }

  -- helpers
  use { 'tpope/vim-surround', config = get_config('vim-surround') }
  use { 'Raimondi/delimitMate' }
  use { 'svermeulen/vimpeccable' }
  use { 'Asheq/close-buffers.vim' }
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use { 'nvim-lua/plenary.nvim' }
  use { 'diepm/vim-rest-console', config = get_config('vim-rest-console') }

  -- UI Style
  use {
    'nvim-lualine/lualine.nvim',
    config = get_config('lualine'),
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use {
    'kdheepak/tabline.nvim',
    config = get_config('tabline'),
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
  }
  use { 'rcarriga/nvim-notify', config = function() vim.notify = require('notify') end }

  -- ColorSchemes
  use { 'rktjmp/lush.nvim' }
  use { 'rebelot/kanagawa.nvim' }
  use { 'folke/lsp-colors.nvim' }
  use { 'sainnhe/gruvbox-material' }
  use { 'briones-gabriel/darcula-solid.nvim' }
  use { 'adisen99/codeschool.nvim' }
  use { 'savq/melange' }

  -- git
  use { 'airblade/vim-gitgutter', config = get_config('gitgutter') }
  use { 'kdheepak/lazygit.nvim', config = get_config('lazygit') }
  -- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('diffview').setup() end }


  -- Terminals
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = get_config('toggleterm') }
  use { 'voldikss/vim-floaterm', config = get_config('floatterm') }

    -- cool but the popups doesn't works
    -- use {
    --   'jlesquembre/nterm.nvim',
    --   requires = 'Olical/aniseed',
    --   config = function () require('configure.nterm') end
    -- }

  -- Languages
  use { 'neovim/nvim-lspconfig', config = function() require'lspconfig'.pyright.setup{} end }
  -- use {
  --   'weilbith/nvim-code-action-menu',
  --   after = 'coc.nvim',
  --   requires = 'xiyaowong/coc-code-action-menu.nvim',
  --   config = function()
  --     require 'coc-code-action-menu'
  --   end,
  -- }
  use { 'stevearc/aerial.nvim', config = get_config('aerial') }
  use {
    'rmagatti/goto-preview',
    config = get_config("goto-preview")
  }
  use {
    'neoclide/coc.nvim',
    config = get_config('coc'),
    branch = 'release',
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = get_config('treesitter'),
  }
  use { 'nvim-treesitter/nvim-tree-docs', requires = { 'nvim-treesitter/nvim-treesitter' } }
  use { 'mustache/vim-mustache-handlebars' }
  use {
    "danymat/neogen",
    config = get_config('neogen'),
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }
  use { 'L3MON4D3/LuaSnip', config = get_config('luasnip') }

  -- Telescope & Cie
  use {
    'nvim-telescope/telescope.nvim',
    as = 'telescope',
    config = get_config('telescope'),
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use { 'fannheyward/telescope-coc.nvim', requires = { 'telescope' } }
  use {
    'nvim-telescope/telescope-dap.nvim',
    config = function() require('telescope').load_extension('dap') end,
    requires = { 'telescope', 'nvim-dap' }
  }

  -- debugging
  use { 'mfussenegger/nvim-dap', config = get_config('dap') }
  use {
    "rcarriga/nvim-dap-ui",
    config = get_config('nvim-dap-ui'),
    requires = {"mfussenegger/nvim-dap"},
  }

  -- tests
  use {
    "nvim-neotest/neotest",
    config = get_config('neotest'),
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  use { 'nvim-neotest/neotest-plenary' }
  use { 'nvim-neotest/neotest-python' }

  -- Lua development
  use { "bfredl/nvim-luadev" }

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})

