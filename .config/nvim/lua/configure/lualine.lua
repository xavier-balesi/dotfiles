-- [[ plugin lualine config ]]
-- [[ github: https://github.com/nvim-lualine/lualine.nvim ]]
-- [[ doc: help lunaline ]]

require('lualine').setup({
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {'branch'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'},
  },
  extensions = { 'toggleterm', 'fugitive', 'nvim-tree' }
})

