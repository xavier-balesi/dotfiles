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
vim.g['gruvbox_material_better_performance'] = 1

opt.background = 'dark'
opt.termguicolors = true

cmd('set background=dark')

cmd('colorscheme melange')

-- override Visual colors
-- cmd('highlight Visual guifg=#ECE1D7 guibg=#867462')
cmd('highlight Visual guifg=#e7d8cb guibg=#594d40')
cmd('highlight Folded guifg=#e7d8cb guibg=#423930')
-- cmd('highlight Folded guifg=#f7f2ee guibg=#4a4036')
