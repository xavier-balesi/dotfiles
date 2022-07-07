-- [[ plugin treesitter config ]]
-- [[ github: https://github.com/nvim-treesitter/nvim-treesitter ]]
-- [[ doc: help treesitter ]]

require('nvim-treesitter.configs').setup {
  tree_docs = true,
  ensure_installed = { 'bash', 'markdown', 'rst', 'python', 'lua', 'http', 'json', 'yaml' },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
