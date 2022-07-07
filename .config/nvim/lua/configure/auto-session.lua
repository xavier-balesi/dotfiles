-- [[ plugin auto-session config ]]
-- [[ github: https://github.com/rmagatti/auto-session#command-hooks ]]
-- [[ doc: ??? ]]
--
-- TODO: close terms

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,globals"

local function restore_nviw_tree()
  local nvim_tree = require('nvim-tree')
  nvim_tree.change_dir(vim.fn.getcwd())
end

local function close_nvim_tree()
  local current_tab = vim.fn.tabpagenr()
  vim.api.nvim_command [[ tabdo NvimTreeClose ]]
  vim.cmd(current_tab .. 'tabnext')
end

require('auto-session').setup {
  auto_session_root_dir = '/home/xbalesi/.config/nvimsessions/',
  log_level = 'info',
  auto_session_suppress_dirs = { '~/', '~/tmp', '~/dev' },
  pre_save_cmds = { close_nvim_tree },
  post_restore_cmds = { 'NvimTreeToggle',  restore_nviw_tree },
}

