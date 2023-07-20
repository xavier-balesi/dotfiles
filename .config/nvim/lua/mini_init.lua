
require('utils.install_packer')

require('packer').startup({function()
  use { 'wbthomason/packer.nvim' }

  -- nvim-tree
  use { 'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      as = 'nvim-tree',
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
 }

  use {
    'nvim-lualine/lualine.nvim',
    commit = 'd2a727da9fe391f7839a81d39a6361d90146da1e',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  end
})

