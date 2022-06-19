local vimp = require('vimp')

vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'
vimp.nnoremap('<space>', 'za')

vim.g.python_highlight_all = 1


-- auto reformat
vim.api.nvim_command("autocmd BufWritePre *.py :call CocAction('format')")
