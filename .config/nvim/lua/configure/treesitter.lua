-- [[ plugin treesitter config ]]


require('nvim-treesitter.configs').setup {
  ensure_installed = { 'python', 'lua', 'http', 'json' },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
