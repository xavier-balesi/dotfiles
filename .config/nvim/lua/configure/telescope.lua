-- [[ plugin telescope config ]]
-- [[ github: https://github.com/nvim-telescope/telescope.nvim ]]
-- [[ doc: help telescope ]]

require('telescope').setup({
  defaults = {
    layout_config = {
      -- winblend = 15
    }
  }
})
require('telescope').load_extension('coc')

