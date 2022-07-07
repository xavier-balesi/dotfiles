-- [[ plugin neotest config ]]
-- [[ github: https://github.com/nvim-neotest/neotest ]]
-- [[ doc: help neotest ]]
--
-- TODO: manage dynamically in justMyCode toggle
--
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      args = { '-v', '-s' },
    }),
    require("neotest-plenary"),
  },
  icons = {
    running = "…",
  }
})

-- mappings
local mp = require "utils.mappings"
local opts = { expr=false, silent=true, noremap=true }

mp.map('n', '<localleader>tr', ':lua require("neotest").run.run()<CR>', opts)
mp.map('n', '<localleader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
mp.map('n', '<localleader>td', ':lua require("neotest").run.run({strategy = "dap"})<CR>', opts)
mp.map('n', '<localleader>ti', ':lua require("neotest").output.open()<CR>', opts)
mp.map('n', '<localleader>tw', ':lua require("neotest").summary.toggle()<CR>', opts)
