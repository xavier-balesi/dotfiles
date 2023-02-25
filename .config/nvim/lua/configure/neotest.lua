-- [[ plugin neotest config ]]
-- [[ github: https://github.com/nvim-neotest/neotest ]]
-- [[ doc: help neotest ]]
--
-- TODO: manage dynamically in justMyCode toggle
--

local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      args = { '-vv', '-s' },
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

local vimp = require('vimp')

local function getenvs()
  local path = '.testenvs'
  local file = io.open(path, 'rb')
  if not file then return nil end

  local lines = {}
  while true do
    local line = file:read()
    if not line then break end
    local key, value = line:match("([^=%s]+)%s*=%s*([^=%s]+)")
    lines[key] = value
  end

  return lines

end

function RunTest()
  local envs = getenvs()
  neotest.run.run({env = envs})
end

vimp.nnoremap( '<localleader>tr', RunTest)

-- mp.map('n', '<localleader>tr', ':lua require("neotest").run.run()<CR>', opts)
mp.map('n', '<localleader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
mp.map('n', '<localleader>td', ':lua require("neotest").run.run({strategy = "dap"})<CR>', opts)
mp.map('n', '<localleader>to', ':lua require("neotest").output.open()<CR>', opts)
mp.map('n', '<localleader>tw', ':lua require("neotest").summary.toggle()<CR>', opts)
