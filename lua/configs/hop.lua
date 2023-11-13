-- place this in one of your configuration file(s)
local hop = require('hop')
hop.setup()
local directions = require('hop.hint').HintDirection


vim.keymap.set('n', '<leader>hf', function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true, desc = "[H]op [F]orward" })

vim.keymap.set('n', '<leader>hb', function()
  hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true, desc = "[H]op [B]ackward" })

local wk = require("which-key")

wk.register({
  ["<leader>h"] = { name = "Hop" },
  ["<leader>hf"] = { "[H]op [F]orward" },
  ["<leader>hb"] = { "[H]op [B]ackward" }
})
