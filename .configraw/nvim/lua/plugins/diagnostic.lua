local trouble_plugin = {
    'folke/trouble.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = {
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
        },
    }
}

local aerial_plugin = {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        'kyazdani42/nvim-web-devicons',
    },
    opts = {
        lsp = {
            diagnostics_trigger_update = false,
        },
        close_on_select = false,
        float = {
            relative = "win",
            override = function(conf, source_win_id)
                local padding = 1
                conf.anchor = 'NE'
                conf.row = padding
                conf.col = vim.api.nvim_win_get_width(source_win_id) - padding - 2
                return conf
            end,
        },
    },
    keys = function()
        local aerial = require('aerial')
        local function open_or_focus()
            if aerial.is_open() then
                aerial.focus()
            else
                aerial.toggle({ direction = 'float' })
            end
        end
        return {
            { '<leader>aa', open_or_focus }
        }
    end
}

return {
    trouble_plugin,
    aerial_plugin,
}
