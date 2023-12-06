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

require("lazy").setup({
  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Svlete
  'othree/html5.vim',
  'pangloss/vim-javascript',
  'evanleck/vim-svelte',
  -- LSP
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim",       opts = {} }

    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',
    -- Adds extra functionality over rust analyzer
    "simrat39/rust-tools.nvim",
    -- Optional
    "nvim-lua/popup.nvim",
    "hrsh7th/cmp-nvim-lsp",
    'L3MON4D3/LuaSnip',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      -- cmp Snippet completion
      "hrsh7th/cmp-vsnip",
      -- cmp Path completion
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Key Binding Helper

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      -- on_attach = function(bufnr)
      --   vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
      --     { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
      --   vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
      --   vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
      --     { buffer = bufnr, desc = '[G]o To [P]review Hunk' })
      -- end,
    },
  },

  -- Theme and UI
  {
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'gruvbox'
      end,
    },
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Telescope
  {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Easy Motion
  'phaazon/hop.nvim',
  'jiangmiao/auto-pairs',
  'mbbill/undotree',
  'ThePrimeagen/harpoon',
  'christoomey/vim-tmux-navigator',
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim'
  },

  -- {
  --   'prettier/vim-prettier',
  --   run = 'yarn install --frozen-lockfile --production',
  --   ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'},
  --   -- config = function ()
  --   --   vim.g["prettier#autoformat"] = 1
  --   --   vim.g["prettier#autoformat_require_pragma"] = 0
  --   -- end
  -- },
  -- require('autoformat')
})

-- local null_ls = require("null-ls")

-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"

-- null_ls.setup({
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       -- vim.keymap.set("n", "<Leader>f", function()
--       --   vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--       -- end, { buffer = bufnr, desc = "[lsp] format" })

--       -- format on save
--       vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
--       vim.api.nvim_create_autocmd(event, {
--         buffer = bufnr,
--         group = group,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = bufnr, async = async })
--         end,
--         desc = "[lsp] format on save",
--       })
--     end

--     if client.supports_method("textDocument/rangeFormatting") then
--       vim.keymap.set("x", "<Leader>f", function()
--         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--       end, { buffer = bufnr, desc = "[lsp] format" })
--     end
--   end,
-- })

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

-- vim.api.nvim_exec([[
-- augroup PrettierAutocommands
--   autocmd!
--   autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier
-- augroup END
-- ]], true)

-- vim.api.nvim_exec([[
--   autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx Prettier
-- ]], false)

vim.api.nvim_exec([[
  augroup PrettierAutocommands
    autocmd!
    autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.yaml,*.md Prettier
  augroup END
]], true)