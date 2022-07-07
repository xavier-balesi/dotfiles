-- [[ plugin vim-rest-console config ]]
-- [[ github: https://github.com/diepm/vim-rest-console ]]
-- [[ doc: help vim-rest-console ]]

vim.g.vrc_output_buffer_name = '__REST_1_OUTPUT__.rest'
vim.g.vrc_syntax_highlight_response = 0
vim.g.vrc_elasticsearch_support = 1

vim.api.nvim_exec([[
  let g:vrc_curl_opts = { '-i':'', '-s':'' }
]], true)
