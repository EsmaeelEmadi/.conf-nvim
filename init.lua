vim.g.mapleader = " "
vim.g.maplocalleader = " "
require('keymaps')
require('plugins.lazy')
require('plugins.misc')
require('plugins.lualine')
require('options')
require('misc')
require('plugins.dap')
require('plugins.gitsigns')
require('plugins.tele')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.trouble')
require('plugins.obsidian')
-- require('plugins.zenmode')
-- require('plugins.neogit')
-- require('plugins.codesnap')
require('plugins.harpoon')
require('plugins.mini')
require('plugins.tree')
require('plugins.mods.oil')
require("plugins.mods.lazy-git")

-- vim: ts=8 sts=2 sw=2 et

vim.opt.tabstop = 2       -- A literal tab appears as 2 spaces
vim.opt.shiftwidth = 2    -- Autoindent uses 2 spaces per level
vim.opt.softtabstop = 2   -- Pressing Tab inserts 2 spaces
vim.opt.expandtab = true  -- Use spaces instead of tab characters
