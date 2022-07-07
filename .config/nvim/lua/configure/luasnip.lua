-- [[ plugin luasnip config ]]
-- [[ github: https://github.com/L3MON4D3/LuaSnip ]]
-- [[ doc: help luasnip.txt ]]

local mp = require "utils.mappings"

opts = { noremap=true, silent=true }

-- press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- -1 for jumping backwards.
mp.map(
  'i',
  '<C-l>',
  "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
  { expr=true, silent=true, noremap=false }
)
mp.map('i', '<C-h>', "<cmd>lua require'luasnip'.jump(-1)<cr>", opts)
mp.map('s', '<C-l>', "<cmd>lua require'luasnip'.jump(1)<cr>", opts)
mp.map('s', '<C-h>', "<cmd>lua require'luasnip'.jump(-1)<cr>", opts)

