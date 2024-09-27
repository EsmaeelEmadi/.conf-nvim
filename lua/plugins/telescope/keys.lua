local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local wk = require('which-key');

wk.register({
    ['<leader>'] = {
        f = {
            name = "Telescope",
            f = {builtin.find_files, "find [F]iles"},
            g = {builtin.live_grep , "live [G]rep"},
            b = {builtin.buffers, "[B]uffers"},
            h = {builtin.help_tags, "[H]elp tags"},
        }
    }
})
