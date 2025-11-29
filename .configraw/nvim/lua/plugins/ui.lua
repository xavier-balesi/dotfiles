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
        { '<leader>n',  ':NvimTreeFocus<CR>',        desc = 'nvim-tree focus' },
        { '<leader>tt', '<CMD>NvimTreeToggle<CR>',   desc = 'nvim-tree toggle' },
        { '<leader>tf', '<CMD>NvimTreeFindFile<CR>', desc = 'nvim-tree find file' },
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
                lualine_b = { { "filename", path = 1 } },
                lualine_c = { require("yaml_nvim").get_yaml_key },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
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

-- Tabby config
local palette = {
    accent = '#B27B4C',     -- orange
    accent_sec = '#D2AC63', -- fg4
    bg = '#312E2B',         -- bg1
    bg_sec = '#4B4541',     -- bg2
    fg = '#B7AFA7',         -- fg2
    fg_sec = '#9A8C7A',     -- fg3
}
local function make_theme()
    return {
        line = 'TabLineFill',
        head = { fg = '#000000', bg = palette.accent, style = 'bold' },
        current_tab = { fg = palette.bg, bg = palette.accent_sec, style = 'bold' },
        tab = { fg = palette.fg, bg = palette.bg_sec },
        current_win = { fg = palette.accent_sec, bg = palette.bg_sec, style = 'bold' },
        win = { fg = palette.fg, bg = palette.bg_sec },
        tail = { fg = palette.bg, bg = palette.accent_sec },
    }
end


local function tabby_config()
    local theme = make_theme()
    vim.opt.showtabline = 2
    require('tabby.tabline').set(function(line)
        local cwd = ' ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' '
        local branch = vim.b.gitsigns_head or '-'
        return {
            { { cwd, hl = theme.head }, line.sep('', theme.head, theme.line) },
            { line.sep('', theme.head, theme.line), { branch, hl = theme.head }, line.sep('', theme.head, theme.line), margin = ' ', hl = theme.head },
            line.tabs().foreach(function(tab)
                local hl = tab.is_current() and theme.current_tab or theme.tab
                return {
                    line.sep('', hl, theme.line),
                    tab.is_current() and '' or '',
                    tab.number(),
                    tab.name(),
                    line.sep('', hl, theme.line),
                    margin = ' ',
                    hl = hl,
                }
            end),
            line.spacer(),
            line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                local hl = win.is_current() and theme.current_win or theme.win

                -- exclude some buffers
                local exclude_patterns = { 'NvimTree_' }
                for _, pattern in ipairs(exclude_patterns) do
                    if win.buf_name():find(pattern) then
                        return
                    end
                end

                return {
                    line.sep('', theme.win, theme.line),
                    -- win.is_current() and '' or '',
                    win.buf_name(),
                    { win.buf().is_changed() and '' or '' },
                    line.sep('', theme.win, theme.line),
                    margin = ' ',
                    hl = hl,
                }
            end),
            { line.sep('', theme.tail, theme.line), { '  ', hl = theme.tail } },
            hl = theme.line,
        }
    end, {
        tab_name = { name_fallback = function(tabid) return "New" end },
        buf_name = { mode = 'unique' },
    })
end
local tabby = {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    -- commit = 'e14a87cba37a6948e903e9292fbf3cb673c1cf94',
    dependencies = "nvim-tree/nvim-web-devicons",
    config = tabby_config,
    keys = {
        { '<leader>tr',
            function()
                vim.ui.input({ prompt = 'Tabby rename: ' }, function(input)
                    vim.fn.execute(':Tabby rename_tab ' .. input)
                end)
            end, { desc = '[Tabby] rename current tab' } },
        { '<leader>wp', ':Tabby pick_window<CR>', { desc = '[Tabby] select window' } },
        { 'g<',         ':-tabmove<CR>',          { desc = 'move tab to left' } },
        { 'g>',         ':+tabmove<CR>',          { desc = 'move tab to right' } },

    },
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
    'bbjornstad/pretty-fold.nvim',
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
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,globals,localoptions"
    end,
}

local statuscol_plugin = {
    'luukvbaal/statuscol.nvim',
    opts = {},
}

local cool_chunk_plugin = {
    "Mr-LLLLL/cool-chunk.nvim",
    event = { "CursorHold", "CursorHoldI" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("cool-chunk").setup({
            chunk = {
                support_filetypes = {
                    "json",
                    "go",
                    "c",
                    "python",
                    "cpp",
                    "rust",
                    "h",
                    "lua",
                    "groovy",
                    "helm",
                },
            }
        })
    end
}

local specs_plugin = {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = {},
}

local yaml_plugin = {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- optional
    },
}

local killersheep_plugin = {
    "seandewar/killersheep.nvim"
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
    cool_chunk_plugin,
    specs_plugin,
    yaml_plugin,
    killersheep_plugin,
}
