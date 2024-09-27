local wk = require('which-key');

wk.register({
    -- FILE
    ['<leader>'] = {
        f = {
            name = "[F]ile",
            t = {"<Cmd>:NvimTreeToggle<CR>", "[F]ile [T]ree"}
        }
    }
})

