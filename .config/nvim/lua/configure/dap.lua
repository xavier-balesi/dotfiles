-- [[ plugin nvim-dap config ]]
-- [[ github: https://github.com/mfussenegger/nvim-dap ]]
-- [[ doc: help dap.txt ]]
--
-- TODO: manage dynamically in justMyCode toggle

vimp = require('vimp')

vimp.nnoremap('<localleader>b', ":lua require'dap'.toggle_breakpoint()<CR>")
vimp.nnoremap('<localleader>c', ":lua require'dap'.continue()<CR>")
vimp.nnoremap('<localleader>s', ":lua require'dap'.step_over()<CR>")
vimp.nnoremap('<localleader>o', ":lua require'dap'.step_out()<CR>")
vimp.nnoremap('<localleader>i', ":lua require'dap'.step_into()<CR>")
vimp.nnoremap('<localleader>!!', ":lua require'dap'.terminate()<CR>")
