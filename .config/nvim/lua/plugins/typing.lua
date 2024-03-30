local nvim_surround = {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
}

local nvim_autopairs = {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
}

local comment = {
    'numToStr/Comment.nvim',
    event = 'VimEnter',
    opts = {},
}

local luasnip_plugin = {
    'L3MON4D3/LuaSnip',
}

return {
    nvim_surround,
    nvim_autopairs,
    comment,
    luasnip_plugin,
}
