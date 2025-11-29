local au_id = vim.api.nvim_create_augroup('norg-ftype', { clear = true })

vim.api.nvim_create_autocmd(
  { 'FileType' }, {
  pattern = { 'norg' },
  command = [[
  setlocal spell
  ]],
  group = au_id,
}
)
