-- [[ plugin aerial config ]]
-- [[ github: https://github.com/stevearc/aerial.nvim ]]
-- [[ doc: help aerial ]]

require('aerial').setup({
  close_behavior = 'close',
  default_direction = 'float',
  max_width = { 40, 0.35 },
  float = {
    relative = "win",
    override = function(conf)
      local padding = 1
      conf.anchor = 'NE'
      conf.row = padding
      conf.col = vim.api.nvim_win_get_width(0) - padding
      return conf
    end,
  },
  on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialCloseAllButCurrent<CR><cmd>AerialOpen<CR>', {})
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '(', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ')', '<cmd>AerialNext<CR>', {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  end
})

-- set for pyright
require("lspconfig").pyright.setup{
  on_attach = require("aerial").on_attach,
}

-- telescope extension
require('telescope').load_extension('aerial')

vim.g["aerial_is_enabled"] = 0

-- set custom commands for floating aerial
vim.api.nvim_exec(
[[
  command AerialCustomOpen if (g:aerial_is_enabled == 1) | AerialOpen!
  command DisableAerial let g:aerial_is_enabled=0 | AerialCloseAll
  command EnableAerial let g:aerial_is_enabled=1 | AerialOpen! float
]], false)

vim.api.nvim_exec(
[[
    au! WinEnter *.py AerialCloseAll
    au WinEnter *.py AerialCustomOpen
]], false)
