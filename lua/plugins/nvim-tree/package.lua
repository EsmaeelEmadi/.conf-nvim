return {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
          -- icons = {
          --   glyphs = nonicons_extention.glyphs,
          -- },
        },
        filters = {
          dotfiles = false,
        },
      })
    end
  }
  