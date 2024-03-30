local goto_preview = {
    'rmagatti/goto-preview',
    opts = function(LazyPlugin)
        return {
            opacity = 20,
            post_open_hook = function(buf, win)
                local _opts = { expr = false, noremap = true, silent = true, buffer = buf }
                vim.keymap.set('n', 'q', ':q<CR>', _opts)
                vim.keymap.set('n', '+', '<C-W>+', _opts)
                vim.keymap.set('n', '-', '<C-W>-', _opts)
                vim.keymap.set('n', '>', '<C-W>>', _opts)
                vim.keymap.set('n', '<', '<C-W><', _opts)
            end,
        }
    end,
    keys = function(LazyPlugin)
        return {
            { 'gfd', require(LazyPlugin['name']).goto_preview_definition,     desc = '[goto-preview] definition' },
            { 'gfi', require(LazyPlugin['name']).goto_preview_implementation, desc = '[goto-preview] implementation' },
            { 'gfr', require(LazyPlugin['name']).goto_preview_references,     desc = '[goto-preview] references' },
            { 'gF',  require(LazyPlugin['name']).goto_preview_close_all_win,  desc = '[goto-preview] close all windows' },
        }
    end,
}

local glance_plugin = {
    'dnlhc/glance.nvim',
    opts = {
        theme = { mode = 'darken' },
    },
    keys = {
        { 'glr', '<CMD>Glance references<CR>',      desc = '[Glance] references' },
        { 'gld', '<CMD>Glance definitions<CR>',     desc = '[Glance] definitions' },
        { 'gli', '<CMD>Glance implementations<CR>', desc = '[Glance] implementations' },
    },
}

return {
    goto_preview,
    glance_plugin,
}
