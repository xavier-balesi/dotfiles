
-- install_packer.lua
-- Install packer in NeoVim
--
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print("packer not installed, start git clone in " .. install_path)
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


local packer_group = vim.api.nvim_create_augroup('Packer', { clear= true })
vim.api.nvim_create_autocmd('BufWritePost',
                            { command = 'source <afile> | PackerCompile', 
                              group = packer_group, 
                              pattern = 'init.lua' })


