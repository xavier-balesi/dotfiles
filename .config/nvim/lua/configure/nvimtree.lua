
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
  }
})

-- mapping

local mp = require "utils.mappings"

mp.map('n', '<leader>n', ':NvimTreeFocus<CR>', { silent = true })
mp.map('n', '<C-t>', ':NvimTreeToggle<CR>', { silent = true })


