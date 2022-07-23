-- [[ filetype association ]]

-- Jenkinsfile
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
  pattern = { "Jenkinsfile*" },
  command = [[ setf groovy ]],
})
--
-- Dockerfile
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
  pattern = { "Dockerfile*" },
  command = [[ setf dockerfile ]],
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
