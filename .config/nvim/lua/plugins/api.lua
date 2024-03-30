local vim_rest_console = {
    'diepm/vim-rest-console',
    init = function()
        vim.g.vrc_output_buffer_name = '__REST_1_OUTPUT__.rest'
        vim.g.vrc_syntax_highlight_response = 0
        vim.g.vrc_elasticsearch_support = 1
        vim.api.nvim_exec([[
          let g:vrc_curl_opts = { '-i':'', '-s':'' }
        ]], true)
    end,
}

return {
    vim_rest_console,
}
