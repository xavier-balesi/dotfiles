-- [[ plugin auto-session config ]]
-- [[ github: https://github.com/rmagatti/auto-session#command-hooks ]]
-- [[ doc: ??? ]]

vim.o.sessionoptions="blank,globals,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup {
  auto_session_root_dir = '/home/xbalesi/.config/nvimsessions/',
  log_level = 'info',
  auto_session_suppress_dirs = { '~/', '~/tmp', '~/dev' },
  pre_save_cmds = { 'tabdo NvimTreeClose', 'tabdo ToggleTermToggleAll' }
}

