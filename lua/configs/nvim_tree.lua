require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 40,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.keymap.set('n', '<leader>f', ':NvimTreeToggle <CR>')

local wk = require("which-key")

wk.register({
  ["<leader>f"] = {"File Tree"},
})
