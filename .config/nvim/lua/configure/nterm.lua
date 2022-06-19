-- [[ plugin nterm config ]]
-- [[ github : https://github.com/jlesquembre/nterm.nvim ]]
-- [[ doc : ?? ]]

-- print('start load plugin/nterm.lua')


local nterm = require('nterm.main').init {
  maps = true,  -- load defaut mappings
  shell = "bash",
  size = 10,
  direction = "horizontal", -- horizontal or vertical
  popup = 2000,     -- Number of miliseconds to show the info about the commmand. 0 to dissable
  popup_pos = "SE", --  one of "NE" "SE" "SW" "NW"
  autoclose = 2000, -- If command is sucesful, close the terminal after that number of miliseconds. 0 to disable}
}

-- [[ mappings from init ]]
-- mode	    key     	Action
-- normal	<leader>tt	term_toggle()
-- normal	<leader>tl	term_send_cur_line()
-- normal	<leader>tf	term_focus()
-- normal	<leader>gpp	term_send('git push', 'git')
-- normal	<leader>gps	term_send('git push --set-upstream origin HEAD', 'git')
-- normal	<leader>gpf	term_send('git push --force-with-lease', 'git')
-- normal	<leader>gpt	term_send('git push --tags', 'git')
-- normal	<leader>gpu	term_send('git pull --ff-only', 'git')
-- normal	<leader>gt	term_focus('git')



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

local vimp = require('vimp')
vimp.nnoremap('<A-n>', function ()
  local nterm = require('nterm.main')
  -- local r = nterm.term_toggle({name='yo'})
  -- print(r)
end)

