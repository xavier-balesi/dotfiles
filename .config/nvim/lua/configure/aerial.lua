-- [[ plugin aerial config ]]
-- [[ github: https://github.com/stevearc/aerial.nvim ]]
-- [[ doc: help aerial ]]

local aerial = require('aerial')

aerial.setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  layout = {
    default_direction = 'float',
  },
  lazy_load = false,
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
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
function toggle_aerial(focus)
  function _toggle_aerial()
    if aerial.is_open() then
      aerial.close()
    else
      aerial.open({focus=false})
      if focus then
        aerial.focus()
      end
    end
  end
  return _toggle_aerial
end

vim.keymap.set('n', '<leader>aa', toggle_aerial(false))
vim.keymap.set('n', '<leader>af', aerial.focus)
vim.keymap.set('n', '<leader>ac', aerial.close)

-- telescope extension
require('telescope').load_extension('aerial')

vim.g["aerial_is_enabled"] = 0

vim.api.nvim_exec(
[[
  command! AerialCustomOpen lua if vim.g['aerial_is_enabled'] == 1 then require'aerial'.open({focus=false}) end
  command! DisableAerial lua vim.g['aerial_is_enabled'] = 0
  command! EnableAerial lua vim.g['aerial_is_enabled'] = 1
]]
, false)

