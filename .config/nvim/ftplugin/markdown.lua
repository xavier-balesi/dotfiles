local au_id = vim.api.nvim_create_augroup('markdown-tab', { clear = true })
vim.api.nvim_create_autocmd(
  { 'FileType' }, {
  pattern = { 'markdown' },
  command = [[
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal spell
  ]],
  group = au_id,
}
)
