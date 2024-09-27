local wk = require('which-key');

wk.register({
    -- FILE
    ['<leader>'] = {
        t = {
            name = "[T]erminal",
            o = {":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR>", "[O]pen"},
            t = {":FloatermToggle myfloat<CR>", "[T]oggle"}
        }
    }
})

vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:FloatermToggle myfloat<CR>")
