
local nterm = require('nterm.main')

local Terminal = require('toggleterm.terminal').Terminal

-- nterm.term_send('sleep 3', 'meteoterm', {popup=5000, popup_pos="SE", autoclose=10000})
-- nterm.term_toggle()

local meteo = Terminal:new({
    cmd = 'meteo',
    direction = 'float',
    close_on_exit = false,
})

meteo:toggle()
