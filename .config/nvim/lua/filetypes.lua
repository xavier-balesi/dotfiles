-- [[ filetype association ]]

-- Jenkinsfile
local au_id = vim.api.nvim_create_augroup('jenkins-groovy', { clear = true })
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
  pattern = { "Jenkinsfile*" },
  command = [[ setf groovy ]],
  group = au_id,
})
--
-- Dockerfile
local au_id = vim.api.nvim_create_augroup('dockerfile', { clear = true })
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
  pattern = { "Dockerfile*" },
  command = [[ setf dockerfile ]],
  group = au_id,
})

-- helm templates
local au_id = vim.api.nvim_create_augroup('helm-gotmpl', { clear = true })
vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" }, {
    pattern = {
      "*/helm/**/templates/*.yaml",
      "*/helm/*/values.yaml",
      "*/helmfile.d/*.yaml"
    },
    command = [[ setf helm ]],
    group = au_id,
  }
)
