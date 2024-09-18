-- place this in one of your configuration file(s)
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "fw", "<Cmd>HopWord<cr>", {})
