local dap_plugin = {
    'mfussenegger/nvim-dap',
    main = 'dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
    },
    keys = function()
        local dap = require('dap')
        return {
            { '<localleader>b',  dap.toggle_breakpoint, desc = "[DAP] toggle breakpoint" },
            { '<localleader>c',  dap.continue,          desc = "[DAP] continue" },
            { '<localleader>s',  dap.step_over,         desc = "[DAP] step over" },
            { '<localleader>i',  dap.step_into,         desc = "[DAP] step into" },
            { '<localleader>!!', dap.terminate,         desc = "[DAP] terminate" },
        }
    end
}

local dap_python = {
    'mfussenegger/nvim-dap-python',
    main = 'dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
        require('dap-python').setup()
    end,
}

local dap_go = {
    'leoluz/nvim-dap-go',
    main = 'dap-go',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function() require('dap-go').setup() end,
}

local dap_ui = {
    'rcarriga/nvim-dap-ui',
    main = 'dapui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'folke/neodev.nvim',
        'nvim-tree/nvim-tree.lua',
    },
    init = function()
        require('neodev').setup({
            library = { plugins = { 'nvim-dap-ui' }, types = true },
        })
    end,
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        local nvimtree = require('nvim-tree.view')
        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            nvimtree.close()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,
    keys = function()
        local dapui = require('dapui')
        return {
            { 'F6',             dapui.toggle },
            { '<localleader>h', function() dapui.float_element('scopes') end, desc = '[DAP-ui] hover scopes' },
            { '<localleader>e', dapui.eval,                                   mode = { 'n', 'v' },           desc = '[DAP-ui] eval' },
            { '<localleader>w', function() dapui.elements.watches.add() end,  mode = { 'n', 'v' },           desc = '[DAP-ui] add watch' },
        }
    end,
}

local telescope_dap = {
    'nvim-telescope/telescope-dap.nvim',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-telescope/telescope.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        -- require('telescope').load_extension('dap')
    end
}

return {
    dap_plugin,
    dap_python,
    dap_go,
    dap_ui,
    telescope_dap,
}
