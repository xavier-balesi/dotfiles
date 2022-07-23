-- [[ plugin telescope config ]]
-- [[ github: https://github.com/nvim-telescope/telescope.nvim ]]
-- [[ doc: help telescope ]]

local vimp = require('vimp')

require('telescope').setup{
  defaults = {
    layout_config = {
      -- winblend = 15
    }
  },
  -- pickers = {
  --   registers = {
  --     theme = "get_cursor",
      -- winblend = 15,
      -- initial_mode = 'normal',
      -- layout_config = { height = 20, width = 65 },
  --   }
  -- }
}
require('telescope').load_extension('coc')

function PopRegisters()
  local registers = require('telescope.builtin').registers
  local overconf = {
    winblend = 15,
    initial_mode = 'normal',
    layout_config = { height = 20, width = 65 },
  }
  local get_cursor = require('telescope.themes').get_cursor
  return registers(get_cursor(overconf))
end

vimp.nnoremap('ff', ":Telescope find_files prompt_prefix=🔍 winblend=15<cr>")
vimp.nnoremap('fb', ":Telescope buffers winblend=15<cr>")
vimp.nnoremap('fg', ":Telescope live_grep theme=get_dropdown winblend=15<cr>")
vimp.nnoremap('fr', ":lua PopRegisters()<cr>")
-- vimp.nnoremap('fr', ":Telescope registers<cr>")
vimp.nnoremap('fk', ":Telescope keymaps winblend=15<cr>")
vimp.nnoremap('fq', ":Telescope quickfix theme=get_ivy winblend=15<cr>")
vimp.nnoremap('fl', ":Telescope resume<cr>")
