local nvim_helm_plugin = {
    "mandos/nvim-helm",
    dependencies = { 'neovim/nvim-lspconfig' },
    config = true,
}

local vim_helm_plugin = {
    "towolf/vim-helm",
    ft = 'helm',
    dependencies = { 'neovim/nvim-lspconfig' },
}

return {
    -- nvim_helm_plugin,
    vim_helm_plugin,
}
