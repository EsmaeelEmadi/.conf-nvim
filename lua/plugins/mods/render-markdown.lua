return {
  'MeanderingProgrammer/render-markdown.nvim',
  main = "render-markdown",
  opts = {},
  name = 'render-markdown',                                                              -- Only needed if you have another plugin named markdown.nvim
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },   -- if you use the mini.nvim suite
  config = function()
    require('render-markdown').setup({})
  end
}
