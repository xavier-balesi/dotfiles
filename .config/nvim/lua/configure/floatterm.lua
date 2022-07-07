-- [[ plugin floatterm config ]]
-- [[ github: https://github.com/voldikss/vim-floaterm ]]
-- [[ doc: help floaterm.txt ]]

print('before command Htop')
vim.cmd ('command! Htop FloatermNew --width=0.46 --height=0.67 --name=htop --title=htop htop')
vim.cmd ("command! Meteo FloatermNew --width=128 --height=46 --autoclose=0 --name=meteo --title=☀️___Meteo__🌦️  meteo")
