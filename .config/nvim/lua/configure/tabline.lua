-- [[ plugin tabline config ]]
-- [[ github: https://github.com/kdheepak/tabline.nvim ]]
-- [[ doc: help tabline.txt ]]

require('tabline').setup {
  enable = false
}

require('lualine').setup({
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require('tabline').tabline_buffers },
    lualine_x = {},
    lualine_y = { require('tabline').tabline_tabs },
    lualine_z = {},
  }
})
