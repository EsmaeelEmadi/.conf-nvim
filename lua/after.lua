-- plugins
require("plugins.harpoon.keys")
require("plugins.nvim-tree.keys")
require("plugins.lazy-git.keys")

require("plugins.cmp.config")
require("plugins.tree-sitter.config")

require("plugins.floaterm.keys")
require("plugins.indent-blankline.config")
require("plugins.telescope.keys")
require("plugins.lspsaga.config")

-- configs
require("configs.keys.moveBetweenTabs")

-- lsp

require("lsp.rust.init")
