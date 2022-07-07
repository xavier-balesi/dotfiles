-- [[ filetype association ]]

-- Jenkinsfile
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
  pattern = { "Jenkinsfile*" },
  command = [[ setf groovy ]],
})

-- helm templates
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
  pattern = { "**/helm/*/templates/*.yaml" },
  command = [[ setf mustache ]],
})
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
  pattern = { "*.yaml.gotmpl" },
  command = [[ setf yaml ]],
})
