local nvimtree = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'kyazdani42/nvim-web-devicons',
    },
    version = '*',
    lazy = false,
    opts = {
        update_cwd = true,
        filters = {
            custom = {
                '^__pycache__$',
                '^.git$',
                '^.idea$',
                '^.vim$',
                '^.pytest_cache$',
                '^.coverage$',
                '^coverage$',
                '^.coveragerc$',
                '^pylintrc$',
                '^htmlcov$',
                '^xunit-reports$'
            }
        },
        actions = {
            open_file = {
                resize_window = false,
            }
        },
        view = {
            adaptive_size = true,
        },
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    corner = '╰ ',
                    edge = '│ ',
                    item = '│ ',
                    none = "  ",
                }
            }
        },
    },
    keys = {
        { '<leader>n',  ':NvimTreeFocus<CR>',      desc = 'nvim-tree focus' },
        { '<leader>tt', '<CMD>NvimTreeToggle<CR>', desc = 'nvim-tree toggle' },
    },
    config = function(_, opts)
        local nvim_on_attach = function(bufnr)
            local ok, api = pcall(require, 'nvim-tree.api')
            assert(ok, 'nvim-tree api module is not found')
            local function optss(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set('n', '<space>', api.node.open.edit, optss('open_file'))
        end
        opts.on_attach = nvim_on_attach
        require('nvim-tree').setup(opts)
    end
}

local dressing = {
    'stevearc/dressing.nvim',
    opts = {
        input = {
            backend = { 'nui' },
            prefer_width = 0.4,
            relative = 'editor',
        },
        select = {
            backend = { 'builtin' },
            nui = {
                relative = "cursor",
            },
            builtin = {
                relative = "cursor",
                max_width = { 140, 0.8 },
                min_width = { 20, 0.2 },
                max_height = 0.7,
                min_height = { 3 },
            },
        }
    }
}

local lualine_plugin = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    lazy = false,
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'lsp_progress' },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            tabline = {
                lualine_a = { 'buffers' },
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = {},
                lualine_y = { 'tabs' },
                lualine_z = {},
            },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            extensions = { 'toggleterm', 'fugitive', 'nvim-tree', 'nvim-dap-ui', 'quickfix' },
            options = {
                globalstatus = false,
                theme = 'gruvbox',
            }
        })
    end
}

local scope = { 'tiagovla/scope.nvim' }


local tabby = {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() end
}

local nvim_notify = {
    'rcarriga/nvim-notify',
    main = 'notify',
    init = function()
        vim.notify = require('notify')
    end
}

local ibl = {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    opts = {
        scope = {
            show_start = false,
        },
    },
    init = function()
        vim.opt.list = true
    end,
}

local pretty_fold = {
    'anuvyklack/pretty-fold.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'williamboman/mason-lspconfig.nvim' },
    lazy = false,
    opts = {
        sections = {
            left = {
                'content',
            },
            right = {
                ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
                function(config) return config.fill_char:rep(3) end
            },
        },
    },
    config = function(LazyPlugin, opts)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = true,
            lineFoldingOnly = true
        }
        local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
                -- you can add other fields for setting up lsp server in this table
            })
        end

        local pretty = require("pretty-fold")
        vim.opt.foldenable = false
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        pretty.setup(opts)
    end,
    init = function()
        vim.o.foldcolumn = 'auto:1' -- '0' is not bad
        vim.o.foldlevel = 99        -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = false
        vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:▶]]
    end,
}

local close_buffers = {
    'Asheq/close-buffers.vim',
    lazy = false,
}



local function close_nvim_tree()
    local function close_nvim_tree_buffers()
        local all_buffs = vim.api.nvim_list_bufs()

        for i, bufname in ipairs(all_buffs) do
            if bufname ~= 'NvimTree_' then
                vim.cmd(string.format('bd! %d'), i)
            end
        end
    end
    local current_tab = vim.fn.tabpagenr()
    vim.api.nvim_command [[ tabdo NvimTreeClose ]]
    vim.cmd(current_tab .. 'tabnext')
    vim.cmd(string.format('bd! %d'), vim.fn.bufnr('NvimTree_1'))

    close_nvim_tree_buffers()
    require('close-buffers').delete({ type = 'hidden' })
    require('close-buffers').delete({ type = 'nameless' })
end

local auto_session = {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        auto_session_root_dir = os.getenv('HOME') .. '/.config/nvimsessions/',
        log_level = 'info',
        auto_session_suppress_dirs = { '~/', '~/tmp', '~/dev' },
        pre_save_cmds = { close_nvim_tree },
    },

    init = function()
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,globals"
    end,
}

local statuscol_plugin = {
    'luukvbaal/statuscol.nvim',
    opts = {},
}


return {
    nvim_notify,
    pretty_fold,
    auto_session,
    nvimtree,
    dressing,
    lualine_plugin,
    scope,
    tabby,
    ibl,
    close_buffers,
    statuscol_plugin,
}
