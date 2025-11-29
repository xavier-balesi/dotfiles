local toggleterm_plugin = {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = 'VeryLazy',
    opts = {
        direction = 'horizontal',
        open_mapping = [[<A-m>]],
        terminal_mappings = [[<A-m>]],
        -- on_open = function(t) print(t.dir) end,
        start_in_insert = true,
        float_opts = {
            border = 'curved',
        },
        highlights = {
            -- highlights which map to a highlight group name and a table of it's values
            -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
            NormalFloat = {
                link = 'Normal'
            },
            FloatBorder = {
                -- guifg = "#FF0000",
                -- guibg = "#0000FF",
            },
        },
    },
    init = function()
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
    keys = {
        { '<leader>of', '<CMD>ToggleTerm direction=float<CR>', desc = '[ToggleTerm] open float' }
    }
}

return {
    toggleterm_plugin,
}
