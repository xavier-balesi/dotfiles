vim.o.foldcolumn = 'auto:1' -- '0' is not bad
vim.o.foldlevel = 99        -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:▶]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  require('lspconfig')[ls].setup({
    capabilities = capabilities
    -- you can add other fields for setting up lsp server in this table
  })
end

local pretty = require("pretty-fold")

pretty.setup {
  -- remove_fold_markers = false,
  sections = {
    left = {
      'content',
    },
    right = {
      ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
      function(config) return config.fill_char:rep(3) end
    }
  },
  -- fill_char = '-',
}
-- pretty.ft_setup('python', {
--   -- fill_char = '━',
--   add_close_pattern = true, -- true, 'last_line' or false
--   -- keep_indentation = false,
--   matchup_patterns = {
--     { '{',  '}' },
--     { '%(', '):' },
--     { '%(', ')' }, -- % to escape lua pattern char
--     { '%[', ']' }, -- % to escape lua pattern char
--   }
-- })
