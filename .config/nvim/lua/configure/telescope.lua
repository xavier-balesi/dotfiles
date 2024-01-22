-- [[ plugin telescope config ]]
-- [[ github: https://github.com/nvim-telescope/telescope.nvim ]]
-- [[ doc: help telescope ]]

local builtin = require("telescope.builtin")

require('telescope').setup {
    defaults = {
        layout_config = {},
        winblend = 15,
    },
    pickers = {
        find_files = { prompt_prefix = "🔍" },
        buffers = { prompt_prefix = "🔍" },
        diagnostics = { initial_mode = 'normal' },
        live_grep = { prompt_prefix = "🔍" },
        grep_string = { prompt_prefix = "🔍", initial_mode = 'normal' },
        current_buffer_fuzzy_find = { prompt_prefix = "🔍" },
    }
}

function PopRegisters()
    local registers = require('telescope.builtin').registers
    local overconf = {
        initial_mode = 'normal',
        layout_config = { height = 20, width = 65 },
    }
    local get_cursor = require('telescope.themes').get_cursor
    local ret = registers(get_cursor(overconf))
    return ret
end

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fc', builtin.commands, {})
vim.keymap.set('n', 'fd', builtin.diagnostics, {})
vim.keymap.set('n', 'fh', builtin.command_history, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fis', builtin.grep_string, {})
vim.keymap.set('n', 'fib', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', 'fk', builtin.keymaps, {})
vim.keymap.set('n', 'fq', builtin.quickfix, {})
vim.keymap.set('n', 'fl', builtin.resume, {})
vim.keymap.set('n', 'fr', PopRegisters)
