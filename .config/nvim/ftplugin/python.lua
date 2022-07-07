
vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'

vim.g.python_highlight_all = 1


local au_id = vim.api.nvim_create_augroup('python-reformat', { clear = true })
-- auto sort imports
vim.api.nvim_create_autocmd(
  { 'BufWritePre' }, {
    pattern = { '*.py' },
    command = [[ call CocAction('runCommand', 'python.sortImports') ]],
    group = au_id,
  }
)
-- auto reformat
vim.api.nvim_create_autocmd(
  { 'BufWritePre' }, {
    pattern = { '*.py' },
    command = [[ call CocAction('runCommand', 'editor.action.formatDocument') ]],
    group = au_id,
  }
)

-- set debugger DAP
local dap = require('dap')

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = "${file}",
    justMyCode = false,
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      local search_paths = {
        -- string.format("%s/bin/python", os.getenv('VIRTUAL_ENV')),
        '/venv/bin/python',
        '/env/bin/python',
        '/.venv/bin/python',
        '/.env/bin/python',
        '/.tox/venv/bin/python',
      }
      for i, search_path in ipairs(search_paths) do
        local absolute_path = cwd .. search_path
        if not vim.fn.empty(vim.fn.glob(absolute_path)) and vim.fn.executable(absolute_path) then
          return absolute_path
        end
      end
      return '/usr/bin/python3'
    end
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Debug pytest',
    module = "pytest",
    justMyCode = false,
    args = { '${file}'},
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      local search_paths = {
        -- string.format("%s/bin/python", os.getenv('VIRTUAL_ENV')),
        '/venv/bin/python',
        '/env/bin/python',
        '/.venv/bin/python',
        '/.env/bin/python',
        '/.tox/venv/bin/python',
      }
      for i, search_path in ipairs(search_paths) do
        local absolute_path = cwd .. search_path
        local isempty =  vim.fn.empty(vim.fn.glob(absolute_path))
        if isempty == 0 and vim.fn.executable(absolute_path) then
          return absolute_path
        end
      end
      return '/usr/bin/python3'
    end
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Debug pytest --disable-recording',
    module = "pytest",
    justMyCode = false,
    args = { '${file}', '--disable-recording'},
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      local search_paths = {
        -- string.format("%s/bin/python", os.getenv('VIRTUAL_ENV')),
        '/venv/bin/python',
        '/env/bin/python',
        '/.venv/bin/python',
        '/.env/bin/python',
        '/.tox/venv/bin/python',
      }
      for i, search_path in ipairs(search_paths) do
        local absolute_path = cwd .. search_path
        local isempty =  vim.fn.empty(vim.fn.glob(absolute_path))
        if isempty == 0 and vim.fn.executable(absolute_path) then
          return absolute_path
        end
      end
      return '/usr/bin/python3'
    end
  },
}
