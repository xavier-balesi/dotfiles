-- [[ plugin indent-blankline config ]]
-- [[ github: https://github.com/lukas-reineke/indent-blankline.nvim ]]
-- [[ doc: ??? ]]


vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

require("ibl").setup {
    scope = {
        show_start = false,
    }
}
