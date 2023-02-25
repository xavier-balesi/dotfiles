
vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = '%r'

local mp = require "utils.mappings"
mp.map('n', '<leader>b', ':GitBlameToggle<CR>')

