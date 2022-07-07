-- [[ plugin neogen config ]]
-- [[ github: https://github.com/danymat/neogen ]]
-- [[ doc: help neogen ]]

require('neogen').setup {
  enabled = true,
  snippet_engine = "luasnip",
  languages = {
    python = {
      template = {
        annotation_convention = "reST"
      }
    }
  },
  placeholders_text = {
    ["description"] = "[TODO:description]",
    ["parameter"] = "[TODO:parameter]",
    ["type"] = "[TODO:type]",
  }
}

local mp = require "utils.mappings"
mp.map('n', '<M-d><M-d>', '<cmd>Neogen<CR>', { silent=true, noremap=true })
