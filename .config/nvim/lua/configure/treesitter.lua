-- [[ plugin treesitter config ]]
-- [[ github: https://github.com/nvim-treesitter/nvim-treesitter ]]
-- [[ doc: help treesitter ]]

require('nvim-treesitter.configs').setup {
  tree_docs = true,
  ensure_installed = { 'dockerfile', 'bash', 'markdown_inline', 'markdown', 'python', 'lua', 'http', 'json', 'regex',
    'rst', 'yaml', 'gotmpl' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]a"] = "@parameter.outer",
      },
      goto_next_end = {
        ["]A"] = "@parameter.outer",
      },
      goto_previous_start = {
        ["[a"] = "@parameter.outer",
      },
      goto_previous_end = {
        ["[A"] = "@parameter.outer",
      },
    },
  },
}

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = { "src/parser.c" }
  },
  filetype = "gotmpl",
  used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" }
}

-- global foldmethod based on treesitter expr
vim.opt.foldenable = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.keymap.set('n', '<leader>f0', ':set foldlevel=0<CR>')
vim.keymap.set('n', '<leader>f1', ':set foldlevel=1<CR>')
vim.keymap.set('n', '<leader>f2', ':set foldlevel=2<CR>')
vim.keymap.set('n', '<leader>f3', ':set foldlevel=3<CR>')
vim.keymap.set('n', '<leader>f4', ':set foldlevel=4<CR>')
vim.keymap.set('n', '<leader>f5', ':set foldlevel=5<CR>')
vim.keymap.set('n', '<leader>f6', ':set foldlevel=6<CR>')
vim.keymap.set('n', '<leader>f7', ':set foldlevel=7<CR>')
vim.keymap.set('n', '<leader>f8', ':set foldlevel=8<CR>')
vim.keymap.set('n', '<leader>f9', ':set foldlevel=9<CR>')
