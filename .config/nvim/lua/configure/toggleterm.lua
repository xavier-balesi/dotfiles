-- [[ plugin toggleterm config ]]
-- [[ github: https://github.com/akinsho/toggleterm.nvim ]]
-- [[ doc: help toggleterm ]]

-- init setup
local toggleterm = require("toggleterm").setup {
  direction = 'horizontal',
  open_mapping = [[<A-m>]],
  terminal_mappings = [[<A-m>]],
  -- on_open = function(t) print(t.dir) end,
  start_in_insert = true,
  float_opts = {
    border = 'curved',
  }
}

-- mappings
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-p>', [[<C-\><C-n><C-w>p]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-h>', [[<C-\><C-n><C-w>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-j>', [[<C-\><C-n><C-w>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-k>', [[<C-\><C-n><C-w>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-l>', [[<C-\><C-n><C-w>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')



