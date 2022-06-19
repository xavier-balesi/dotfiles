
require('telescope').setup({
  defaults = {
    layout_config = {
      -- winblend = 15
    }
  }
})
require('telescope').load_extension('coc')


vimp = require('vimp')

vimp.nnoremap('gr', ': Telescope coc references winblend=15<CR>')
vimp.nnoremap('gef', ': Telescope coc definitions<CR>')
vimp.nnoremap('ged', ': Telescope coc declarations<CR>')
vimp.nnoremap('tc', ': Telescope coc commands winblend=15<CR>')
vimp.nnoremap('ta', ': Telescope coc code_actions theme=get_cursor<CR>')
vimp.nnoremap('tl', ': Telescope coc line_code_actions theme=get_cursor<CR>')
vimp.nnoremap('td', ': Telescope coc diagnostics winblend=15<CR>')
vimp.nnoremap('tw', ': Telescope coc workspace_diagnostics winblend=15<CR>')

require('telescope').load_extension('vimspector')

vimp.nnoremap('<leader>bf', ":Telescope buffers winblend=15<cr>")
vimp.nnoremap('<leader>f', ":Telescope find_files prompt_prefix=🔍 winblend=15<cr>")
vimp.nnoremap('<leader>gb', ":Telescope git_branches theme=get_ivy winblend=15<cr>")
vimp.nnoremap('<leader>gc', ":Telescope git_commits theme=get_ivy winblend=15<cr>")
vimp.nnoremap('<leader>gs', ":Telescope git_status theme=get_ivy winblend=15<cr>")
vimp.nnoremap('<leader>tr', ":Telescope registers theme=get_cursor winblend=15<cr>")
