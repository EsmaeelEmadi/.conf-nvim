return {
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
  }
  