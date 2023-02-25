-- [[ plugin dressing config ]]
-- [[ github: https://github.com/stevearc/dressing.nvim ]]
-- [[ doc: help dressing ]]

require('dressing').setup({
  input = {
    prefer_width = 0.4,
    relative = 'editor',
  },
  select = {
    backend = { 'builtin' },
    nui = {
      relative = "cursor",
    },
    builtin = {
      relative = "cursor",
      max_width = { 140, 0.8 },
      min_width = { 20, 0.2 },
      max_height = 0.7,
      min_height = { 3 },
    },
  }
})
