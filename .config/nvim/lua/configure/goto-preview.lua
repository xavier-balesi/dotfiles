-- [[ plugin goto-preview config ]]
-- [[ github: https://github.com/rmagatti/goto-preview ]]
-- [[ doc: ??? ]]

local mp = require "utils.mappings"
local opts = { expr = false, silent = true, noremap = true }

local function post_open_hook(buf, win)
  local _opts = { expr = false, noremap = true, silent = true, buffer = buf }
  vim.keymap.set('n', 'q', ':q<CR>', _opts)
  vim.keymap.set('n', '+', '<C-W>+', _opts)
  vim.keymap.set('n', '-', '<C-W>-', _opts)
  vim.keymap.set('n', '>', '<C-W>>', _opts)
  vim.keymap.set('n', '<', '<C-W><', _opts)
end

require('goto-preview').setup {
  opacity = 20,
  post_open_hook = post_open_hook,
}

mp.map('n', "gfd", ":lua require('goto-preview').goto_preview_definition()<CR>", opts)
mp.map('n', "gfi", ":lua require('goto-preview').goto_preview_implementation()<CR>", opts)
mp.map('n', "gF", ":lua require('goto-preview').close_all_win()<CR>", opts)
-- Only set if you have telescope installed
mp.map('n', "gfr", ":lua require('goto-preview').goto_preview_references()<CR>", opts)
