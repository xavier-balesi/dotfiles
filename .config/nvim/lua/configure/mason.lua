-- [[ plugin mason config ]]
-- [[ github: https://github.com/williamboman/mason.nvim ]]
-- [[ doc: help mason ]]

local servers = {
    'lua_ls',
    'bashls',
    'pyright',
}

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = servers,
}
