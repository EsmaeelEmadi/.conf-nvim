local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.oil',
  require 'plugins.harpoon',
  require 'plugins.flash',
  require 'plugins.lazydev',
  require 'plugins.lspconfig',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.gruvbox',
  require 'plugins.toggleterm',
  require 'plugins.conform',
  require 'plugins.gitsigns',
  require 'plugins.mini',
  require 'plugins.whichkey',
  require 'plugins.blink',
  require 'plugins.trouble',
  -- require 'plugins.bars',
  { 'nvim-tree/nvim-web-devicons', opts = {} },
  {
    'alvarosevilla95/luatab.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('luatab').setup {}
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      scope = { enabled = true },
    },
    config = function()
      require('ibl').setup()
    end,
  },
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  { 'christoomey/vim-tmux-navigator' },
}
