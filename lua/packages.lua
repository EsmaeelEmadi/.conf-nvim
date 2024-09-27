local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- theme
  require('themes.gruvbox'),
  -- lsp
  require("plugins.mason.package"),
  require('plugins.mason-lsp.package'),
  require("plugins.cmp.package"),
  require('plugins.tree-sitter.package'),
  require('plugins.conform.package'),
  require('plugins.nvim-lint.package'),
  require('plugins.typescript-tools.package'),
  require('plugins.nvim-lsp.package'),
  require('plugins.autocompletion.package'),
  require('lsp.rust.rust-tools.package'),
  require('plugins.lspsaga.package'),
  -- better movement
  require('plugins.harpoon.package'),
  require("plugins.flash.package"),
  -- telescope
  require("plugins.telescope.package"),
  -- manage
  require('plugins.which.package'),
  -- ui
  require('plugins.nvim-tree.package'),
  require("plugins.tabby.package"),
  require("plugins.lualine.package"),
  require("plugins.indent-blankline.package"),
  -- git
  require('plugins.git-signs.package'),
  require('plugins.lazy-git.package'),
  -- terminal
  require('plugins.floaterm.package'),
  -- other
  require("plugins.autopairs.package"),
  require("plugins.vim-tmux-navigator.package"),
  -- todo
  require("plugins.todo-comments.package")
})
