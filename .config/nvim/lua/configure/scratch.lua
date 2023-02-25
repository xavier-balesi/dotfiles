-- [[ plugin scratch config ]]
-- [[ github: https://github.com/LintaoAmons/scratch.nvim ]]
-- [[ doc: help  ]]

require("scratch").setup {
	scratch_file_dir = "/home/xbalesi/doc/notes",  -- Where the scratch files will be saved
	filetypes = { "json", "xml",  "lua",  "py", "sh", "md" },   -- filetypes to select from
}
vim.keymap.set("n", "<C-Q>m", function() require("scratch").scratchWithName() end)
vim.keymap.set("n", "<C-Q>o", function() require("scratch").openScratch() end)
