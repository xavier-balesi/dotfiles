local neotest_plugin = {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/nvim-nio",
    },
    opts = {
        icons = {
            running = "…",
        }
    },
    keys = function()
        local neotest = require('neotest')
        return {
            { '<localleader>tr', function() neotest.run.run() end,                     desc = '[NeoTest] run current test' },
            { '<localleader>tf', function() neotest.run.run(vim.fn.expand("%")) end,   desc = '[NeoTest] run current file' },
            { '<localleader>td', function() neotest.run.run({ strategy = 'dap' }) end, desc = '[NeoTest] run strategy dap' },
            { '<localleader>to', function() neotest.output.open() end,                 desc = '[NeoTest] open output' },
            { '<localleader>tw', function() neotest.summary.toggle() end,              desc = '[NeoTest] toggle summary' },

        }
    end
}

local neotest_python_plugin = {
    'nvim-neotest/neotest-python',
    dependencies = {
        "nvim-neotest/neotest",
        'mfussenegger/nvim-dap',
    },
    ft = { 'python' },
    config = function()
        local neotest = require('neotest')
        neotest.setup({
            adapters = {
                require('neotest-python')({
                    dap = { justMyCode = false },
                    args = { '-vv', '-s' },
                })
            }
        })
    end,
    keys = function()
        local dap_python = require('dap-python')
        return {
            { '<localleader>dm', dap_python.test_method, desc = '[NeoTest][Python] debug method', ft = 'python' },
            { '<localleader>dc', dap_python.test_class,  desc = '[NeoTest][Python] debug class',  ft = 'python' },
        }
    end
}

local neotest_go_plugin = {
    "nvim-neotest/neotest-go",
    dependencies = {
        "nvim-neotest/neotest",
        'mfussenegger/nvim-dap',
    },
    ft = { 'go' },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-go')
            }
        })
    end,
    keys = function()
        local dap_go = require('dap-go')
        return {
            { '<localleader>dm', dap_go.debug_test, desc = '[NeoTest][Go] debug method', ft = 'go' },
        }
    end
}

local neotest_gradle_plugin = {
    'weilbith/neotest-gradle',
    dependencies = {
        "nvim-neotest/neotest",
        'mfussenegger/nvim-dap',
    },
    ft = { 'java', 'groovy' },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-gradle')
            }
        })
    end
}

return {
    neotest_plugin,
    neotest_python_plugin,
    neotest_go_plugin,
    neotest_gradle_plugin,
}
