local wk = require('which-key');

wk.register({
    ['<leader>'] = {
        -- GIT
        g = {
            name = "[G]it",
            g = {"<Cmd>LazyGit<CR>", "[L]azy [G]it"},
            i = {"<Cmd>Gitsigns preview_hunk_inline<CR>", "Preview Hunk in[L]ine"},
            p = {"<Cmd>Gitsigns preview_hunk<CR>", "[P]review Hunk"},
            b = {"<Cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle current line [B]lame"} }
    }
})
