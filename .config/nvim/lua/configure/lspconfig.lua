local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')


mason.setup({})
mason_lspconfig.setup({})
mason_lspconfig.setup_handlers {
    function(server_name)
      lspconfig[server_name].setup({})
    end
}

lspconfig.efm.setup {
    init_options = { documentFormatting = true },
    filetypes = { 'python' },
    settings = {
        rootMarkers = { '.git/' },
        languages = {
            python = {
                -- { formatCommand = "isort --profile black --quiet -", formatStdin = true },
                -- { formatCommand = "black --quiet -", formatStdin = true },
            }
        }
    }
}

require 'lspconfig'.pyright.setup {}
require 'lspconfig'.marksman.setup { on_attach = require('lsp-format').on_attach }
require 'lspconfig'.bashls.setup {}
-- require 'lspconfig'.black.setup {}
require 'lspconfig'.gopls.setup {}
-- require'lspconfig'.pylsp.setup{}

vim.diagnostic.config({
    virtual_text = {
        -- source = "always",  -- Or "if_many"
        prefix = '●', -- Could be '■', '▎', 'x'
    },
    severity_sort = true,
    float = {
        show_header = false,
        source = "always", -- Or "if_many"
        -- border = 'shadow',
        -- anchor = 'SE',
    },
})

-- lspconfig.sumneko_lua.setup {
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- }
--

local function preview_hover()
  vim.lsp.buf.hover()
  print('one')
  vim.lsp.buf.hover()
  print('two')
  vim.api.nvim_command [[
     pedit!
     q
   ]]
  print('three')
end

-- keymaps
local telescope = require 'telescope.builtin'
vim.keymap.set('n', 'gr', telescope.lsp_references)
vim.keymap.set('n', 'gn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gef', telescope.lsp_definitions)
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action)
vim.keymap.set('v', 'ga', vim.lsp.buf.code_action)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover)
vim.keymap.set('n', 'ggh', preview_hover)
vim.keymap.set('n', 'gd', function() return telescope.diagnostics({ bufnr = 0 }) end)
vim.keymap.set('n', 'gw', function() return telescope.diagnostics() end)

vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

local au_id = vim.api.nvim_create_augroup('OpenDiagFloat', { clear = true })
vim.api.nvim_create_autocmd(
    { 'CursorHold' },
    {
        pattern = { "*.py" },
        callback = vim.diagnostic.open_float,
        group = au_id,
    }
)

local function lspSymbol(name, icon)
  vim.fn.sign_define(
      'DiagnosticSign' .. name,
      { text = icon, numhl = 'DiagnosticDefault' .. name }
  )
end

vim.opt.signcolumn = 'auto:2'
lspSymbol('Error', '⛔')
lspSymbol('Information', '💡')
lspSymbol('Hint', '💡')
lspSymbol('Info', '💡')
lspSymbol('Warning', '🔔')


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
