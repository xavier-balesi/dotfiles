-- Telescope
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

local telescope = {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
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
        },
    },
    keys = function()
        local builtin = require("telescope.builtin")
        return {
            { 'ff',  builtin.find_files,                desc = 'Telescope find_files' },
            { 'fb',  builtin.buffers,                   desc = 'Telescope buffers' },
            { 'fc',  builtin.commands,                  desc = 'Telescope commands' },
            { 'fd',  builtin.diagnostics,               desc = 'Telescope diagnostics' },
            { 'fh',  builtin.command_history,           desc = 'Telescope command_history' },
            { 'fg',  builtin.live_grep,                 desc = 'Telescope live_grep' },
            { 'fis', builtin.grep_string,               desc = 'Telescope grep_string' },
            { 'fib', builtin.current_buffer_fuzzy_find, desc = 'Telescope current_buffer_fuzzy_find' },
            { 'fk',  builtin.keymaps,                   desc = 'Telescope keymaps' },
            { 'fq',  builtin.quickfix,                  desc = 'Telescope quickfix' },
            { 'fl',  builtin.resume,                    desc = 'Telescope resume' },
            { 'fr',  PopRegisters,                      desc = 'Telescope registers' },
        }
    end

}

return {
    telescope,
}
