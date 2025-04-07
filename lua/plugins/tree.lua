require("nvim-tree").setup({
  filters = {
    dotfiles = true,
    custom = { "node_modules", "\\.cache", ".git" },
  },
})
