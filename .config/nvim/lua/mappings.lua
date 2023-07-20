local cmd = vim.api.nvim_command

vim.g.mapleader = " "
vim.g.maplocalleader = ";"

local mp = require "utils.mappings"
local opts = { expr = false, silent = true, noremap = true }

-- [[ Basic remappings ]]

-- tab for completion nav and enter to validate
mp.map('i', '<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr = true, silent = true, noremap = true })
mp.map('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true, silent = true, noremap = true })


-- visual mode indent better
mp.map('v', '>', '>gv', opts)
mp.map('v', '<', '<gv', opts)

-- windows déplacement
mp.map('n', '<C-h>', '<C-w>h<CR>', opts)
mp.map('n', '<C-j>', '<C-w>j<CR>', opts)
mp.map('n', '<C-k>', '<C-w>k<CR>', opts)
mp.map('n', '<C-l>', '<C-w>l<CR>', opts)

-- indentation
mp.map('n', '<leader><space>', "za", opts)

-- stop search hl
mp.map('n', '<leader>q', ':nohl<CR>', opts)

-- quickfix list navigation
mp.map('n', ']q', ':cnext<CR>zz', opts)
mp.map('n', '[q', ':cprev<CR>zz', opts)

-- operators remap
mp.map('o', 'in(', ':<c-u>normal! f(vi(<cr>', { expr = false, silent = true, noremap = true })
mp.map('o', 'in"', ':<c-u>normal! f"vi"<cr>', { expr = false, silent = true, noremap = true })

-- tab remap
mp.map('n', 'g[', 'gT', opts)
mp.map('n', 'g]', 'gt', opts)
