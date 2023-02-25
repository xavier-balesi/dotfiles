-- [[ plugin indent-blankline config ]]
-- [[ github: https://github.com/lukas-reineke/indent-blankline.nvim ]]
-- [[ doc: ??? ]]


vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = false,
}
