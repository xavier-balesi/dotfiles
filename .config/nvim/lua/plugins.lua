require('utils.install_packer')

local function get_config(name)
  return string.format('require("configure/%s")', name)
end

require('packer').startup({
  function()
    use { 'wbthomason/packer.nvim' }

    -- nvim-tree
    -- use { 'kyazdani42/nvim-tree.lua',
    use { 'nvim-tree/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      as = 'nvim-tree',
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = get_config('nvimtree'),
    }

    -- helpers
    -- use { 'tpope/vim-surround', config = get_config('vim-surround') } --
    -- prefere nvim surround over vim-surround
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = get_config('nvim-surround'),
    })
    use { 'Raimondi/delimitMate' }
    use { 'svermeulen/vimpeccable' }
    use { 'Asheq/close-buffers.vim' }
    use {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end
    }
    use { 'nvim-lua/plenary.nvim' }
    use { 'diepm/vim-rest-console', config = get_config('vim-rest-console') }
    -- -- use {
    --   "LintaoAmons/scratch.nvim",
    --   -- tag = "v0.3.2" -- use tag for stability, or without this to have latest fixed and functions
    --   config = get_config('scratch'),
    -- }
    use { 'stevearc/dressing.nvim', config = get_config('dressing') }
    use {
      "ThePrimeagen/refactoring.nvim",
      config = get_config('refactoring'),
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" }
      }
    }

    -- completion
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'f3fora/cmp-spell' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'saadparwaiz1/cmp_luasnip' }
    -- use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'hrsh7th/nvim-cmp', as = 'cmp', config = get_config('nvim-cmp') }
    -- use { "MunifTanjim/nui.nvim" }
    use {
      "jcdickinson/codeium.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "cmp",
      },
      config = function()
        require("codeium").setup({
        })
      end
    }


    -- Neorg
    use {
      "nvim-neorg/neorg",
      config = get_config('neorg'),
      requires = "nvim-lua/plenary.nvim"
    }

    -- UI Style
    use {
      'nvim-lualine/lualine.nvim',
      config = get_config('lualine'),
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use { "tiagovla/scope.nvim", config = function() require('scope').setup() end }
    use {
      'kdheepak/tabline.nvim',
      config = get_config('tabline'),
      requires = { 'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons' }
    }
    use 'nanozuki/tabby.nvim'
    use { 'rcarriga/nvim-notify', config = function() vim.notify = require('notify') end }
    -- use { "Pocco81/true-zen.nvim" }
    use { "lukas-reineke/indent-blankline.nvim", config = get_config('indent-blankline') }
    -- doesn't seem to work
    use({
      "luukvbaal/statuscol.nvim",
      config = function() require("statuscol").setup() end
    })
    use {
      'kevinhwang91/nvim-ufo',
      config = get_config('nvim-ufo'),
      requires = 'kevinhwang91/promise-async',
    }
    -- buggy but cool
    -- use { 'sunjon/shade.nvim', config = require('shade').setup({
    --   overlay_opacity = 50,
    --   opacity_step = 1,
    --   keys = {
    --     brightness_up   = '<C-Up>',
    --     brightness_down = '<C-Down>',
    --     toggle          = '<Leader>s',
    --   }
    -- }) }


    -- ColorSchemes
    use { 'rktjmp/lush.nvim' }
    use { 'rebelot/kanagawa.nvim' }
    use { 'folke/lsp-colors.nvim' }
    use { 'sainnhe/gruvbox-material' }
    use { 'morhetz/gruvbox' }
    use { 'briones-gabriel/darcula-solid.nvim' }
    use { 'adisen99/codeschool.nvim' }
    use { 'savq/melange' }
    use { 'JoosepAlviste/palenightfall.nvim' }
    use { 'AlexvZyl/nordic.nvim' }

    -- git
    use { 'lewis6991/gitsigns.nvim', config = get_config('gitsigns') }
    use { 'kdheepak/lazygit.nvim', config = get_config('lazygit') }
    use { 'f-person/git-blame.nvim', config = get_config('git-blame') }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('diffview').setup() end }


    -- Terminals
    use {
      "akinsho/toggleterm.nvim",
      tag = 'v2.*',
      config = get_config('toggleterm')
    }
    use { 'voldikss/vim-floaterm', config = get_config('floatterm') }

    -- cool but the popups doesn't works
    -- use {
    --   'jlesquembre/nterm.nvim',
    --   requires = 'Olical/aniseed',
    --   config = function () require('configure.nterm') end
    -- }

    -- Languages
    use { 'neovim/nvim-lspconfig', config = get_config('lspconfig') }
    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require 'lsp_signature'.setup {
          debug = false,
          verbose = false,
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
            border = "single"
          },
          hint_enable = false,
          toggle_key = '<M-x>'
        }
      end
    }
    use { "lukas-reineke/lsp-format.nvim" }
    use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
      end,
    })
    use {
      'https://github.com/jose-elias-alvarez/null-ls.nvim',
      config = get_config('null-ls')
    }
    use { 'stevearc/aerial.nvim',
      requires = "kyazdani42/nvim-web-devicons",
      config = get_config('aerial') }
    use {
      'rmagatti/goto-preview',
      config = get_config("goto-preview")
    }
    use({
      "dnlhc/glance.nvim",
      config = function()
        require('glance').setup({
          theme = {
            mode = 'darken'
          }
          -- your configuration
        })
        vim.keymap.set('n', 'glr', '<CMD>Glance references<CR>')
        vim.keymap.set('n', 'gld', '<CMD>Glance definitions<CR>')
      end,
    })
    -- use {
    --   'neoclide/coc.nvim',
    --   config = get_config('coc'),
    --   branch = 'release',
    -- }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = get_config('treesitter'),
    }
    use { 'nvim-treesitter/nvim-tree-docs', requires = { 'nvim-treesitter/nvim-treesitter' } }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = { 'nvim-treesitter/nvim-treesitter' } }
    use {
      "williamboman/mason.nvim",
      config = get_config('mason'),
      requires = { "neovim/nvim-lspconfig" },
    }
    use {
      "williamboman/mason-lspconfig.nvim",
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      }
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
          },
        }
      end
    }
    use { 'mustache/vim-mustache-handlebars' }
    use { 'towolf/vim-helm' }
    use {
      "danymat/neogen",
      config = get_config('neogen'),
      requires = "nvim-treesitter/nvim-treesitter",
      -- Uncomment next line if you want to follow only stable versions
      -- tag = "*"
    }
    -- use {
    --   'https://github.com/fatih/vim-go.git'
    -- }
    use { 'L3MON4D3/LuaSnip', config = get_config('luasnip') }
    use { 'rafamadriz/friendly-snippets' }
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
    })
    -- disabled because it causes fails
    -- use {
    --   'lewis6991/spellsitter.nvim',
    --   requires = "nvim-treesitter/nvim-treesitter",
    --   config = function()
    --     require('spellsitter').setup()
    --   end
    -- }
    use { -- pytrize {{{
      'AckslD/nvim-pytrize.lua',
      -- uncomment if you want to lazy load
      -- cmd = {'Pytrize', 'PytrizeClear', 'PytrizeJump'},
      -- uncomment if you want to lazy load but not use the commands
      -- module = 'pytrize',
      config = get_config("pytrize"),
    } -- }}}
    use { "aklt/plantuml-syntax" }

    -- Telescope & Cie
    use {
      'nvim-telescope/telescope.nvim',
      as = 'telescope',
      config = get_config('telescope'),
      requires = { 'nvim-lua/plenary.nvim' },
    }
    use {
      'nvim-telescope/telescope-dap.nvim',
      config = function() require('telescope').load_extension('dap') end,
      requires = { 'telescope', 'nvim-dap' }
    }
    -- use { 'nvim-telescope/telescope-ui-select.nvim' }
    -- use({
    --   "jackMort/ChatGPT.nvim",
    --   config = function()
    --     require("chatgpt").setup({
    --       -- optional configuration
    --     })
    --   end,
    --   requires = {
    --     "MunifTanjim/nui.nvim",
    --     "nvim-lua/plenary.nvim",
    --     "nvim-telescope/telescope.nvim"
    --   }
    -- })

    -- sessions
    use {
      'rmagatti/auto-session',
      as = 'auto-session',
      config = get_config('auto-session'),
    }
    use {
      'rmagatti/session-lens',
      requires = { 'rmagatti/auto-session', 'telescope' },
      config = function()
        -- require('session-lens').setup({})
        require("telescope").load_extension("session-lens")
      end
    }

    -- debugging
    use { 'mfussenegger/nvim-dap', config = get_config('dap') }
    use {
      'leoluz/nvim-dap-go',
      config = get_config('dap-go'),
      requires = { "mfussenegger/nvim-dap" },
    }
    use {
      "rcarriga/nvim-dap-ui",
      config = get_config('nvim-dap-ui'),
      requires = { "mfussenegger/nvim-dap" },
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

    -- FUn !
    use { 'eandrju/cellular-automaton.nvim' }
    use { 'seandewar/killersheep.nvim' }
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
