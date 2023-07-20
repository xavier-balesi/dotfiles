-- [[ plugin tabline config ]]
-- [[ github: https://github.com/kdheepak/tabline.nvim ]]
-- [[ doc: help tabline.txt ]]

require('tabline').setup {
  enable = false
}


require('lualine').setup({
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { require("lsp-progress").progress },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { require('tabline').tabline_buffers },
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = {},
    lualine_y = { require('tabline').tabline_tabs },
    lualine_z = {},
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'toggleterm', 'fugitive', 'nvim-tree', 'nvim-dap-ui', 'quickfix' },
  options = {
    globalstatus = false,
    theme = 'gruvbox',
  }
})
