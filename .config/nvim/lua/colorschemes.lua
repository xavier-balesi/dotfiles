-- [[ opts.lua ]]

local opt = vim.opt
local cmd = vim.api.nvim_command

opt.syntax = "ON"



-- for gruvbox material
vim.g['gruvbox_material_background'] = 'medium'
vim.g['gruvbox_material_better_performance'] = 1

-- opt.background = 'dark'
opt.termguicolors = true

cmd('colorscheme kanagawa')

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

-- vim.cmd('colorscheme gruvbox-material')
