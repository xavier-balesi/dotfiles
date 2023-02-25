-- [[ opts.lua ]]

local opt = vim.opt
local cmd = vim.api.nvim_command

opt.syntax = "ON"


-- for gruvbox
vim.g['gruvbox_contrast_dark'] = 'soft'
vim.g['gruvbox_sign_column'] = 'bg2'

-- for gruvbox material
vim.g['gruvbox_material_background'] = 'medium'
vim.g['gruvbox_material_foreground'] = 'mix'
vim.g['gruvbox_material_diagnostic_virtual_text'] = 'colored'

vim.g['gruvbox_material_spell_foreground'] = 'colored'
-- vim.g['gruvbox_material_enable_bold'] = 1
vim.g['gruvbox_material_better_performance'] = 1

opt.background = 'dark'
opt.termguicolors = true



-- cmd('colorscheme kanagawa')
-- cmd('colorscheme palenightfall')
-- cmd('colorscheme nordic')
cmd('colorscheme melange')
-- cmd('colorscheme gruvbox')
-- cmd('colorscheme gruvbox-material')

-- require('lush')(require('codeschool').setup({
--   plugins = {
--     "coc",
--     "cmp", -- nvim-cmp
--     "fzf",
--     "gitgutter",
--     "gitsigns",
--     "nerdtree",
--     "netrw",
--     "packer",
--     "telescope",
--     "treesitter"
--   },
--   langs = {
--     "c",
--     "css",
--     "html",
--     "java",
--     "js",
--     "json",
--     "lua",
--     "markdown",
--     "python",
--     "scala",
--     "typescript",
--     "viml",
--     "xml"
--   }
-- }))

