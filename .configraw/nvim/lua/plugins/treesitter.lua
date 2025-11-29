local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-tree-docs',
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    lazy = false,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = {
        tree_docs = true,
        ensure_installed = { 'dockerfile', 'bash', 'markdown_inline', 'markdown', 'python', 'lua', 'http', 'json',
            'regex', 'go',
            'rst', 'yaml' },
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
    },
    config = function(LazyPlugin, opts)
        local configs = require('nvim-treesitter.configs')
        configs.setup(opts)
    end,
    init = function()
        vim.opt.foldenable = false
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
        vim.o.foldtext     =
        [[substitute(getline(v:foldstart),'\\\\t',repeat('\\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
    end,
    keys = {
        { '<leader>f0', ':set foldlevel=0<CR>' },
        { '<leader>f1', ':set foldlevel=1<CR>' },
        { '<leader>f2', ':set foldlevel=2<CR>' },
        { '<leader>f3', ':set foldlevel=3<CR>' },
        { '<leader>f4', ':set foldlevel=4<CR>' },
        { '<leader>f5', ':set foldlevel=5<CR>' },
        { '<leader>f6', ':set foldlevel=6<CR>' },
        { '<leader>f7', ':set foldlevel=7<CR>' },
        { '<leader>f8', ':set foldlevel=8<CR>' },
        { '<leader>f9', ':set foldlevel=9<CR>' },
    }
}

return { treesitter }
