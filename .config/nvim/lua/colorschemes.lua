-- [[ opts.lua ]]

local opt = vim.opt
local cmd = vim.api.nvim_command

opt.syntax = "ON"



-- for gruvbox material
vim.g['gruvbox_material_background'] = 'medium'
vim.g['gruvbox_material_better_performance'] = 1

-- for tokyonight
vim.g['tokyonight_style'] = 'night' -- storm or night
vim.g['tokyonight_enable_italic'] = 1

-- for edge
vim.g['edge_style'] = 'neon' -- neon or aura or ?
vim.g['edge_enable_italic'] = 1

opt.background = 'dark'
opt.termguicolors = true

-- cmd('colorscheme gruvbox')
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
