-- [[ plugin coc config ]]
-- [[ github: https://github.com/neoclide/coc.nvim ]]
-- [[ doc: help coc.txt ]]
-- [[ doc: help coc-config.txt ]]
-- [[ doc: help coc-nvim ]]

local vimp = require('vimp')

local mp = require "utils.mappings"
local opts = { expr=false, silent=true, noremap=true }

vimp.nnoremap('gr', ': Telescope coc references winblend=15<CR>')
vimp.nnoremap('gef', ': Telescope coc definitions<CR>')
vimp.nnoremap('ged', ': Telescope coc declarations<CR>')

vimp.nnoremap('gc', ': Telescope coc commands winblend=15<CR>')
vimp.nnoremap('ga', ': Telescope coc code_actions theme=get_cursor<CR>')
vimp.nnoremap('gl', ': Telescope coc line_code_actions theme=get_cursor<CR>')
vimp.nnoremap('gd', ': Telescope coc diagnostics winblend=15<CR>')
vimp.nnoremap('gw', ': Telescope coc workspace_diagnostics winblend=15<CR>')


vimp.nnoremap('ff', ":Telescope find_files prompt_prefix=🔍 winblend=15<cr>")
vimp.nnoremap('fb', ":Telescope buffers winblend=15<cr>")
vimp.nnoremap('fg', ":Telescope live_grep theme=get_dropdown winblend=15<cr>")
vimp.nnoremap('fr', ":Telescope registers theme=get_cursor winblend=15<cr>")
vimp.nnoremap('fq', ":Telescope quickfix theme=get_ivy winblend=15<cr>")
--
-- open in preview window
mp.map('n', 'gpf', ":call CocAction('jumpDefinition', 'pedit')<CR>", opts)
mp.map('n', 'gpd', ":call CocAction('jumpDeclaration', 'pedit')<CR>", opts)
mp.map('n', 'gpr', ":call CocAction('jumpReferences', 'pedit')<CR>", opts)

-- doc popup and preview window
mp.map('n', 'gh', ":call CocActionAsync('doHover')<CR>", opts)
mp.map('n', 'ggh', ":call CocActionAsync('doHover', 'preview')<CR>", opts)

-- refactoring
mp.map('n', 'gn', '<Plug>(coc-rename)', opts)

-- autofix
mp.map('n', '<leader>qf', '<Plug>(coc-fix-current)', opts)
