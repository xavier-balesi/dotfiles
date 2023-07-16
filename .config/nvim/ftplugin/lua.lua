local opt = vim.opt
local vimp = require('vimp')

opt.tabstop = 4
opt.shiftwidth = 4
opt.textwidth = 79
opt.softtabstop = 4

opt.foldenable = false
opt.foldmethod = 'indent'

-- auto reformat
-- vim.api.nvim_command(  "autocmd BufWritePre *.py :call CocAction('format')")
