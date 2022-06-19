
local vimp = require('vimp')

local mp = require "utils.mappings"

vim.g.mapleader = ","

-- [[ Basic remappings ]]
--
-- tab for completion nav and enter to validate
mp.map('i','<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', {expr=true,silent=true,noremap=true})
mp.map('i','<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', {expr=true,silent=true,noremap=true})
mp.map('i', '<CR>', 'pumvisible() ? "<C-Y>" : "<CR>"', {expr=true,silent=true,noremap=true})

-- [[ util functions ]]

function SplitIfNotOpen(fname)

  local home_path = os.getenv("HOME")
  fname = fname:gsub("~", home_path)

  local orig_win = vim.api.nvim_win_get_number(0)

  local alltabpages = vim.api.nvim_list_tabpages()
  local buffound = false

  for _, tabpage in ipairs(alltabpages) do
    local winlist = vim.api.nvim_tabpage_list_wins(tabpage)
    for _, win in ipairs(winlist) do
      local cur_buf = vim.api.nvim_win_get_buf(win)
      local cur_buf_file = vim.api.nvim_buf_get_name(cur_buf)
      if(cur_buf_file == fname) then
        buffound = true
        vim.api.nvim_set_current_win(win)
        break
      end
    end
    if (buffound) then
      break
    end
  end

  if (not buffound) then
    vim.cmd('vsplit ' .. fname)
  end
end

vim.cmd('command! -nargs=+ CocSplitNotOpen :lua SplitIfNotOpen(<f-args>)')

-- [[ coc mappings ]]

-- open in vsplit window but no focus on
vimp.nnoremap('gvf', ":call CocAction('jumpDefinition', 'CocSplitNotOpen')<CR>:wincmd p<CR>")
vimp.nnoremap('gvd', ":call CocAction('jumpDeclaration', 'CocSplitNotOpen')<CR>:wincmd p<CR>")

-- open in current
-- vimp.nnoremap('gef', ":call CocAction('jumpDefinition', 'edit')<CR>")
-- vimp.nnoremap('ged', ":call CocAction('jumpDeclaration', 'edit')<CR>")

-- open in preview window
vimp.nnoremap('gpf', ":call CocAction('jumpDefinition', 'pedit')<CR>")
vimp.nnoremap('gpd', ":call CocAction('jumpDeclaration', 'pedit')<CR>")

-- doc popup and preview window
vimp.nnoremap('gh', ":call CocActionAsync('doHover')<CR>")
vimp.nnoremap('ggh', ":call CocActionAsync('doHover', 'preview')<CR>")

-- refactoring
vimp.nnoremap('<leader>rn', '<Plug>(coc-rename)')
