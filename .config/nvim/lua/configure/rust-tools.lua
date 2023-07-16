-- [[ plugin rust-tools config ]]
-- [[ github : https://github.com/simrat39/rust-tools.nvim ]]
-- [[ doc : ?? ]]

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "ga", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
