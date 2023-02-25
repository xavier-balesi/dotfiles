local cmd = vim.api.nvim_command

vim.g.mapleader = " "
vim.g.maplocalleader = ";"

local mp = require "utils.mappings"
local opts = { expr=false, silent=true, noremap=true }

-- [[ Basic remappings ]]

-- tab for completion nav and enter to validate
mp.map('i','<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr=true, silent=true, noremap=true })
mp.map('i','<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr=true, silent=true, noremap=true })
-- mp.map('i', '<CR>', 'coc#pum#visible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { expr=true, silent=true, noremap=true })

-- cmd [[
--
-- function! CheckBackspace() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction
--
-- inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1): CheckBackspace() ? "\<Tab>" : coc#refresh()
-- inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
--
-- " Make <CR> to accept selected completion item or notify coc.nvim to format
-- " <C-g>u breaks current undo, please make your own choice.
-- inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
--
-- ]]
-- mp.map('i','<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr=true, silent=true, noremap=true })
-- mp.map('i','<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr=true, silent=true, noremap=true })
-- mp.map('i', '<CR>', 'pumvisible() ? "<C-Y>" : "<CR>"', { expr=true, silent=true, noremap=true })

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
mp.map('o', 'in(', ':<c-u>normal! f(vi(<cr>', { expr=false, silent=true, noremap=true })
mp.map('o', 'in"', ':<c-u>normal! f"vi"<cr>', { expr=false, silent=true, noremap=true })

-- goto-preview
