-- [[ plugin tabline config ]]
-- [[ github: https://github.com/kdheepak/tabline.nvim ]]
-- [[ doc: help tabline.txt ]]

require('tabline').setup {
  enable = false
}


require('lualine').setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require('tabline').tabline_buffers },
    lualine_x = { 'branch' },
    lualine_y = { require('tabline').tabline_tabs },
    lualine_z = {},
  },
  extensions = { 'toggleterm', 'fugitive', 'nvim-tree', 'nvim-dap-ui' },
})
