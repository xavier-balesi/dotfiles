-- [[ plugin telescope config ]]
-- [[ github: https://github.com/nvim-telescope/telescope.nvim ]]
-- [[ doc: help telescope ]]

local vimp = require('vimp')

-- require('telescope').load_extension('ui-select')
require('telescope').setup {
  -- extensions = {
  --   ["ui-select"] = {
  --     require("telescope.themes").get_cursor {
  --       -- even more opts
  --     },
  --     codeactions = false,
  --   }
  -- },
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
-- require('telescope').load_extension('coc')

function PopRegisters()
  local registers = require('telescope.builtin').registers
  local overconf = {
    winblend = 15,
    initial_mode = 'normal',
    layout_config = { height = 20, width = 65 },
  }
  local get_cursor = require('telescope.themes').get_cursor
  local ret = registers(get_cursor(overconf))
  return ret
end

vimp.nnoremap('ff', ":Telescope find_files prompt_prefix=🔍 winblend=15<cr>")
vimp.nnoremap('fb', ":Telescope buffers winblend=15<cr>")
vimp.nnoremap('fc', ":Telescope commands winblend=15<cr>")
vimp.nnoremap('fd', ":Telescope diagnostics winblend=15<cr>")
vimp.nnoremap('fh', ":Telescope command_history winblend=15<cr>")
vimp.nnoremap('fg', ":Telescope live_grep prefix=🔍 winblend=15<cr>")
vimp.nnoremap('fis', ":Telescope grep_string  prefix=🔍 winblend=15<cr>")
vimp.nnoremap('fib', ":Telescope current_buffer_fuzzy_find winblend=15<cr>")
vimp.nnoremap('fk', ":Telescope keymaps winblend=15<cr>")
vimp.nnoremap('fq', ":Telescope quickfix theme=get_ivy winblend=15<cr>")
vimp.nnoremap('fl', ":Telescope resume<cr>")
vimp.nnoremap('fr', PopRegisters)
