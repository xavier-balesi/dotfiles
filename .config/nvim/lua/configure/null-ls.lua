-- [[ plugin null-ls config ]]
-- [[ github : https://github.com/jose-elias-alvarez/null-ls.nvim ]]
-- [[ doc : ?? ]]


local null_ls = require("null-ls")
local sources = {
  -- cspell
  -- need 'npm install -g cspell'
  -- null_ls.builtins.diagnostics.cspell,
  -- null_ls.builtins.code_actions.cspell,
  -- null_ls.builtins.completion.spell,
  --
  -- git
  null_ls.builtins.code_actions.gitsigns,

  -- python
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.black.with({
    -- extra_args = { "--line-length=120" }
  }),
  -- null_ls.builtins.diagnostics.pylint,
  -- null_ls.builtins.diagnostics.flake8,

  -- golang
  null_ls.builtins.formatting.gofmt,

  -- lua
  -- null_ls.builtins.formatting.lua_format,
  -- null_ls.builtins.formatting.mdformat,
  null_ls.builtins.formatting.markdownlint,
  null_ls.builtins.diagnostics.yamllint.with {
    args = { "-d", '{rules: {key-ordering: disable}}', "--format", "parsable", "-" }
  },
  null_ls.builtins.formatting.pg_format,
  null_ls.builtins.formatting.prettier.with({
    -- requires : https://prettier.io/docs/en/install.html
    filetypes = { 'markdown' }
  }),
  -- refactoring
  -- require "ThePrimeagen/refactoring.nvim"
  null_ls.builtins.code_actions.refactoring,
}
null_ls.setup({ sources = sources })

local au_id = vim.api.nvim_create_augroup('save-reformat', { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufWritePre' }, {
    pattern = { '*.py', '*.md', '*.lua', '*.go', '*.sql' },
    command = [[ :lua vim.lsp.buf.format() ]],
    -- command = [[ call CocAction('runCommand', 'editor.action.formatDocument') ]],
    group = au_id,
  }
)
