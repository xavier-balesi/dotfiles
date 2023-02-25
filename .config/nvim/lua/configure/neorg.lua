-- [[ plugin neorg config ]]
-- [[ github: https://github.com/nvim-neorg/neorg ]]
-- [[ doc: help neorg ]]

require('neorg').setup {
    load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
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
    ["core.norg.concealer"] = {
     config = { -- Note that this table is optional and doesn't need to be provided
       }
    },
    ["core.ui"] = {
      config = {} -- Note that this table is optional and doesn't need to be provided
    },
    -- ["core.gtd.ui"] = {
    --   config = { -- Note that this table is optional and doesn't need to be provided
    --      -- Configuration here
    --  }
    -- },
    ["core.norg.completion"] = {
       config = { -- Note that this table is optional and doesn't need to be provided
         engine = 'nvim-cmp'
       }
    },
    ["core.integrations.treesitter"] = { config = { } },
    ["core.integrations.nvim-cmp"] = {
       config = { -- Note that this table is optional and doesn't need to be provided
           -- Configuration here
       }
    }
}
}

