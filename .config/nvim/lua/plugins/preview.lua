local markdown_preview_plugin = {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
        vim.g.mkdp_browser = '/usr/bin/google-chrome-stable'
    end
}

return {
    markdown_preview_plugin,
}
