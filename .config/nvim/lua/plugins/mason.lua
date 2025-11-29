local mason = {
    "williamboman/mason.nvim",
    version = "^2.0.0",
    lazy = false,
    config = function()
        require('mason').setup({
            registries = {
                'github:nvim-java/mason-registry',
                'github:mason-org/mason-registry',
            },
        })
    end
}

local mason_lspconfig = {
    'williamboman/mason-lspconfig.nvim',
    version = "^2.0.0",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = {
            'bashls',
            'lua_ls',
            'pyright',
            'ansiblels',
            'yamlls',
            'jinja_lsp', -- TODO need cargo installed
            'gopls',
            'groovyls',
            'helm_ls',
            'marksman',
            -- 'black', -- not LSP but formatters, must be installed manually
            -- 'isort',
            -- 'markdownlint'
        },
    },
    config = function(LazyPlugin, opts)
        local mason_lspconfig = require('mason-lspconfig')
        local lspconfig = require('lspconfig')
        mason_lspconfig.setup(opts)
        -- mason_lspconfig.setup_handlers {
        --     function(server_name)
        --         lspconfig[server_name].setup({})
        --     end
        -- }
        lspconfig.helm_ls.setup({
            filetypes = {
                "helm",
                "helm.yaml",
            }
        })
        lspconfig.yamlls.setup({})
        -- lspconfig.yamlls.setup { on_attach = function(client, bufnr)
        --     print("yamlls on_attach client" .. client .. " bufnr " .. bufnr)
        --     print("vim.bo.filetype = " .. vim.bo[bufnr].filetype)
        --     if true or vim.bo[bufnr].filetype == 'helm' then
        --         print("buf_detach_client")
        --         vim.lsp.buf_detach_client(bufnr, client.id)
        --     end
        -- end }
        -- vim.lsp.set_log_level('DEBUG')
    end
}

return {
    mason,
    mason_lspconfig,
}
