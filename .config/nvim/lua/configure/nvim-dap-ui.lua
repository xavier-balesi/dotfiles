-- [[ plugin nvim-dap-ui config ]]
-- [[ github: https://github.com/rcarriga/nvim-dap-ui ]]
-- [[ doc: help nvim-dap-ui ]]


local dap, dapui = require("dap"), require("dapui")
local nvimtree = require('nvim-tree.view')
dapui.setup({
  layout = {
    {
      elements = {
        { id = 'scopes', size = 0.5 },
        { id = 'watches', size = 0.3 },
        { id = 'scopes', size = 0.2 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    }
  },
  floating = { border = "rounded" },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  nvimtree.close()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vimp = require('vimp')

vimp.nnoremap('<F6>', ":lua require'dapui'.toggle()<CR>")
vimp.nnoremap('<localleader>fs', ":lua require'dapui'.float_element('scopes')<CR>")
vimp.nnoremap('<localleader>fi', ":lua require'dap.ui.widgets'.hover()<CR>")
