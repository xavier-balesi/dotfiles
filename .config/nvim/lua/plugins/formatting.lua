local lsp_format_plugin = {
    'lukas-reineke/lsp-format.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    ops = {},
    config = function()
        local lsp_format = require('lsp-format')
        local lspconfig = require('lspconfig')
        local on_attach = function(client, bufnr)
            lsp_format.on_attach(client, bufnr)
        end

        lspconfig.lua_ls.setup { on_attach = on_attach }
        lspconfig.marksman.setup { on_attach = on_attach }
        lspconfig.helm_ls.setup { on_attach = on_attach }
    end
}

local null_ls_plugin = {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'ThePrimeagen/refactoring.nvim' },
    config = function(LazyPlugin, opts)
        local null_ls = require('null-ls')
        local sources = {
            -- git
            null_ls.builtins.code_actions.gitsigns,

            -- python formatting
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.black,

            -- markdown formatting
            null_ls.builtins.formatting.markdownlint,

            -- refactoring
            null_ls.builtins.code_actions.refactoring,

        }
        null_ls.setup({
            sources = sources
        })
    end
}

local refactoring_plugin = {
    'ThePrimeagen/refactoring.nvim',
    opts = {},
}

local au_id = vim.api.nvim_create_augroup('save-reformat', { clear = true })
vim.api.nvim_create_autocmd(
    { 'BufWritePre' }, {
        pattern  = { '*.py', '*.md', '*.go', '*.sql', '*.rs', '*.lua' },
        callback = function()
            vim.lsp.buf.format(

            )
            vim.cmd([[norm! zz]])
        end,
        group    = au_id,
    }
)

return {
    lsp_format_plugin,
    null_ls_plugin,
    refactoring_plugin,
}
