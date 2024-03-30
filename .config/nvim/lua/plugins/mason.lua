local mason = {
    "williamboman/mason.nvim",
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
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = {
            'bashls',
            'lua_ls',
            'pyright',
            'ansiblels',
            'yamlls',
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
        mason_lspconfig.setup_handlers {
            function(server_name)
                lspconfig[server_name].setup({})
            end
        }
        lspconfig.helm_ls.setup({
            filetypes = {
                "helm",
                "helm.yaml",
            }
        })
    end
}

return {
    mason,
    mason_lspconfig,
}
