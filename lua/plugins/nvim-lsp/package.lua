-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local noremap = { noremap = true, silent = true }

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  update_in_insert = true,
})


return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    { "folke/neodev.nvim", opts = {} }

  },
  lazy = true,
  event = 'VeryLazy',
  config = function()
    -- local global_icons = require('utils.global_icons')
    local lspconfig = require('lspconfig')
    local server = require('plugins.nvim-lsp.servers')
    -- local signs = {
    -- 	Error = global_icons.error,
    -- 	Warn = global_icons.warn,
    -- 	Info = global_icons.info,
    -- 	Hint = global_icons.hint,
    -- }
    -- for type, icon in pairs(signs) do
    -- 	local hl = 'DiagnosticSign' .. type
    -- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    -- end

    -- Servers Enabled -------------------------------------------------------
    lspconfig.eslint.setup(server.eslint)
    lspconfig.html.setup(server.html)
    lspconfig.dockerls.setup(server.dockerls)
    lspconfig.jsonls.setup(server.jsonls)
    lspconfig.cssls.setup(server.cssls)
    lspconfig.cssmodules_ls.setup(server.cssmodules_ls)
    lspconfig.tailwindcss.setup(server.tailwindcss)
    lspconfig.emmet_ls.setup(server.emmet_ls)
    lspconfig.lua_ls.setup(server.lua_ls)
    lspconfig.taplo.setup(server.taplo)
    -- Servers Disabled ------------------------------------------------------
    lspconfig.tsserver.setup(server.tsserver)
  end,
}
