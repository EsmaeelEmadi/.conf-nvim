-- Install lazylazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true


require('lazy').setup({


  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  { 'echasnovski/mini.nvim',               version = false },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {"LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile"},
    dependencies = {"nvim-lua/plenary.nvim"}
  },

  -- {
  --   "NeogitOrg/neogit",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",         -- required
  --     "sindrets/diffview.nvim",        -- optional - Diff integration
  --     "nvim-telescope/telescope.nvim", -- optional
  --   },
  --   config = true
  -- },
  -- 'onsails/lspkind.nvim',
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  "preservim/vim-pencil",
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- 'folke/zen-mode.nvim',
  'tpope/vim-obsession',
  'ThePrimeagen/git-worktree.nvim',
  -- "tpope/vim-furround",

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    config = function()
      require("flash").setup({ modes = { char = { enabled = false } } })
    end,
    keys = {
      { "s",         mode = { "n", "x", "o" }, false },
      { "S",         mode = { "n", "o", "x" }, false },
      { "r",         mode = "o",               false },
      { "R",         mode = { "o", "x" },      false },
      { "<Tab>",         mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "<leader>t", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "<leader>s", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      -- { "<leader>t", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },

  'ray-x/go.nvim',
  'ray-x/guihua.lua',
  -- { "catppuccin/nvim", as = "catppuccin" },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  },
  'theHamsta/nvim-dap-virtual-text',
  'leoluz/nvim-dap-go',

  -- Git related plugins
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',

  'nvim-lualine/lualine.nvim', -- Fancier statusline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",   opts = {} },
  'tpope/vim-sleuth',          -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-telescope/telescope-symbols.nvim',

  require("plugins.mods.toggleterm"),
  require("plugins.mods.snack"),
  require("plugins.mods.gruvbox-material"),
  require("plugins.mods.nvim-tree"),
  -- require("plugins.mods.goto-preview"),
  require("plugins.mods.noice"),
  require("plugins.mods.nvim-cmp"),
  require("plugins.mods.render-markdown"),
  require("plugins.mods.treesitter"),
  require("plugins.mods.telescope"),
  require("plugins.mods.which-key")
})

-- {
--   'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
--   event = { "BufRead", "BufNewFile" },
--   config = true
-- },
-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
-- {
--   "folke/twilight.nvim",
--   ft = "markdown",
--   opts = {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--   }
-- },
--
-- {
--   'Exafunction/codeium.vim',
--   event = "InsertEnter",
--   config = function ()
--     -- Change '<C-g>' here to any keycode you like.
--     vim.keymap.set('i', '<C-e>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
--     vim.keymap.set('i', '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
--     vim.keymap.set('i', '<c-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
--     vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
--   end
-- },
--
-- {
--   "mistricky/codesnap.nvim",
--   build = "make",
-- },
