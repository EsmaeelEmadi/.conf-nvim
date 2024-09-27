local wk = require('which-key');

wk.register({
    ['<leader>'] = {
        -- GIT
        g = {
            name = "[G]it",
            l = {"<Cmd>LazyGit<CR>", "[L]azy [G]it"},
            i = {"<Cmd>GitSigns preview_hunk_inline<CR>", "Preview Hunk in[L]ine"},
            p = {"<Cmd>GitSigns preview_hunk<CR>", "[P]review Hunk"},
            b = {"<Cmd>GitSigns toggle_current_line_blame<CR>", "Toggle current line [B]lame"}
        }
    }
})
