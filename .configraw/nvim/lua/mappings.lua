-- set leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

local opts = { expr = false, silent = true, noremap = true }

-- [[ Basic remappings ]]

-- tab for completion nav and enter to validate
vim.keymap.set('i', '<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr = true, silent = true, noremap = true })
vim.keymap.set('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true, silent = true, noremap = true })


-- visual mode indent better
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- windows déplacement
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- indentation
vim.keymap.set('n', '<leader><space>', "za", opts)

-- stop search hl
vim.keymap.set('n', '<leader>q', ':nohl<CR>', opts)

-- quickfix list navigation
vim.keymap.set('n', ']q', ':cnext<CR>zz', opts)
vim.keymap.set('n', '[q', ':cprev<CR>zz', opts)

-- operators remap
-- note: commented because I don't know if I use it
--       I think ib i" i' works
-- vim.keymap.set('o', 'in(', ':<c-u>normal! f(vi(<cr>', { expr = false, silent = true, noremap = true })
-- vim.keymap.set('o', 'in"', ':<c-u>normal! f"vi"<cr>', { expr = false, silent = true, noremap = true })

-- tab remap
vim.keymap.set('n', 'g[', 'gT', opts)
vim.keymap.set('n', 'g]', 'gt', opts)
