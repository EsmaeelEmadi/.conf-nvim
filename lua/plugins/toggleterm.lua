return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<F1>]],
      size = 20,
      hide_number = true,
      start_in_insert = true,
      shade_terminals = true,
      shading_factor = 2,
      shading_ratio = -3,
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 3,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
  end,
}
