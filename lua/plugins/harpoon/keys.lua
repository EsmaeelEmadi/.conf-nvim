local wk = require('which-key');

wk.register({
    -- FILE
    ['<leader>'] = {
        -- Harpoon
        h = {
            name = "[H]arpoon",
            describe = "also you can quickly go to the file with h0 to h9",
            o = {"<Cmd>:lua require('harpoon.ui').toggle_quick_menu()<CR>", "[O]pen harpoon menu"},
            a = {"<Cmd>:lua require('harpoon.mark').add_file()<CR>", "[A]dd new file"},
            n = {"<Cmd>:lua require('harpoon.ui').nav_next()<CR>", "[N]ext file"},
            p = {"<Cmd>:lua require('harpoon.ui').nav_prev()<CR>", "[P]revoius file"}
        }
    }
})

-- Other Harpoon navigation
vim.keymap.set('n', '<leader>h0', ':lua require("harpoon.ui").nav_file(0)<CR>', {
    desc = "h[0]"
});
vim.keymap.set('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', {
    desc = "h[1]"
});
vim.keymap.set('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>', {
    desc = "h[2]"
});
vim.keymap.set('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>', {
    desc = "h[3]"
});
vim.keymap.set('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>', {
    desc = "h[4]"
});
vim.keymap.set('n', '<leader>h5', ':lua require("harpoon.ui").nav_file(5)<CR>', {
    desc = "h[5]"
});
vim.keymap.set('n', '<leader>h6', ':lua require("harpoon.ui").nav_file(6)<CR>', {
    desc = "h[6]"
});
vim.keymap.set('n', '<leader>h7', ':lua require("harpoon.ui").nav_file(7)<CR>', {
    desc = "h[7]"
});
vim.keymap.set('n', '<leader>h8', ':lua require("harpoon.ui").nav_file(8)<CR>', {
    desc = "h[8]"
});
vim.keymap.set('n', '<leader>h9', ':lua require("harpoon.ui").nav_file(9)<CR>', {
    desc = "h[9]"
});