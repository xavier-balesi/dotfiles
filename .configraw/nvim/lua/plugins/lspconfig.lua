local lspconfig_plugin = {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile', 'BufEnter' },
    dependencies = {
        'folke/neodev.nvim',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'nvim-telescope/telescope.nvim',
    },
    keys = function()
        local telescope = require('telescope.builtin')
        return {
            { 'gr',         telescope.lsp_references,                                  desc = '[LSP] telescope reference' },
            { 'gi',         vim.lsp.buf.implementation },
            { 'gD',         vim.lsp.buf.declaration },
            { 'gn',         vim.lsp.buf.rename },
            { 'gef',        telescope.lsp_definitions },
            { 'ga',         vim.lsp.buf.code_action,                                   mode = 'v' },
            { 'ga',         vim.lsp.buf.code_action },
            { 'gh',         vim.lsp.buf.hover },
            { 'gd',         function() return telescope.diagnostics({ bufnr = 0 }) end },
            { 'gw',         function() return telescope.diagnostics() end },
            { '<leader>sd', vim.diagnostic.open_float },
            { '[d',         vim.diagnostic.goto_prev },
            { ']d',         vim.diagnostic.goto_next },
        }
    end,
    init = function()
        local border = "rounded"

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = border,
            })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = border
            }
        )

        vim.diagnostic.config {
            float = { border = border }
        }
    end
}

-- neovim and lua developement support
-- particulary recognize `vim.*` global
local neodev = {
    lazy = false,
    'folke/neodev.nvim',
    opts = {},
}

local lsp_signature = {
    'ray-x/lsp_signature.nvim',
    opts = {
        debug = false,
        verbose = false,
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded",
        },
        hint_enable = true,
        floating_window = false,
        toggle_key = '<M-x>',
        -- transparency = 50,
    }
}


local nvim_java_plugin = {
    'nvim-java/nvim-java',
    main = 'java',
    ft = { 'java' },
    dependencies = {
        'nvim-java/lua-async-await',
        'nvim-java/nvim-java-core',
        'nvim-java/nvim-java-refactor',
        'nvim-java/nvim-java-test',
        'nvim-java/nvim-java-dap',
        'MunifTanjim/nui.nvim',
        'mfussenegger/nvim-dap',
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        require('java').setup()
        require('lspconfig').jdtls.setup({})
    end,
}

return {
    lspconfig_plugin,
    neodev,
    lsp_signature,
    nvim_java_plugin,
}
