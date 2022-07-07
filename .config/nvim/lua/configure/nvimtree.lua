-- [[ plugin nvim-tree config ]]
-- [[ github: https://github.com/kyazdani42/nvim-tree.lua ]]
-- [[ doc: help nvim-tree ]]

require('nvim-tree').setup ({
  filters = {
    custom = {
      '^__pycache__$',
      '^.git$',
      '^.idea$',
      '^.vim$',
      '^.pytest_cache$',
      '^.coverage$',
      '^coverage$',
      '^.coveragerc$',
      '^pylintrc$',
      '^htmlcov$',
      '^xunit-reports$'
    }
  },
  actions = {
    open_file = {
      resize_window = false,
    }
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = { '<space>' }, action = "edit", mode = "n" }
      }
    }
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = '╰ ',
        edge = '│ ',
        item = '│ ',
        none = "  ",
      }
    }
  }
})

-- mappings

local mp = require "utils.mappings"

mp.map('n', '<leader>n', ':NvimTreeFocus<CR>', { silent = true })
mp.map('n', '<C-t>', ':NvimTreeToggle<CR>', { silent = true })
