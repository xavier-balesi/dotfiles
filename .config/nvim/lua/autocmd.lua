-- [[ Global autocmd ]]

-- remove trailing spaces
vim.api.nvim_create_autocmd(
  { "BufWritePre" }, {
    pattern = { "*" },
    command = [[ %s/\s\+$//e ]],
})


-- set hlsearch only in command line mode
local au_id = vim.api.nvim_create_augroup('incsearch-highlight', { clear = true })
vim.api.nvim_create_autocmd(
  { 'CmdlineEnter' }, {
    pattern = { '/,\\?' },
    command = [[ set hlsearch ]],
    group = au_id,
  }
)
vim.api.nvim_create_autocmd(
  { 'CmdlineLeave' }, {
    pattern = { '/,\\?' },
    command = [[ set nohlsearch ]],
    group = au_id,
  }
)
