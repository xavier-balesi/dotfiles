local luarocks_plugin = {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
}
local neorg_plugin = {
    "nvim-neorg/neorg",
    dependencies = {
        "luarocks.nvim",
    },
    ft = "norg",
    lazy = false,
    config = true,
    version = "*",
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/doc/notes",
                        tasks = "~/doc/tasks",
                    }
                }
            },
            -- ["core.gtd.base"] = {
            --    config = { -- Note that this table is optional and doesn't need to be provided
            --      workspace = "tasks"
            --    }
            -- },
            ["core.concealer"] = {
                config = { -- Note that this table is optional and doesn't need to be provided
                }
            },
            ["core.ui"] = {
                config = {} -- Note that this table is optional and doesn't need to be provided
            },
            ["core.ui.calendar"] = {
                config = {} -- Note that this table is optional and doesn't need to be provided
            },
            ["core.export"] = {
                config = {}
            },
            -- ["core.gtd.ui"] = {
            --   config = { -- Note that this table is optional and doesn't need to be provided
            --      -- Configuration here
            --  }
            -- },
            ["core.completion"] = {
                config = { -- Note that this table is optional and doesn't need to be provided
                    engine = 'nvim-cmp'
                }
            },
            ["core.integrations.treesitter"] = { config = {} },
            ["core.integrations.nvim-cmp"] = {
                config = { -- Note that this table is optional and doesn't need to be provided
                    -- Configuration here
                }
            }
        }
    }
}

return {
    luarocks_plugin,
    neorg_plugin,
}
