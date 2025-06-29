return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'add a file to harpoon' })
    vim.keymap.set('n', '<leader>ho', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'open harpoon' })
    vim.keymap.set('n', '<leader>h0', "<Cmd>:lua require('harpoon.ui').nav_file(0)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h1', "<Cmd>:lua require('harpoon.ui').nav_file(1)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h2', "<Cmd>:lua require('harpoon.ui').nav_file(2)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h3', "<Cmd>:lua require('harpoon.ui').nav_file(3)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h4', "<Cmd>:lua require('harpoon.ui').nav_file(4)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h5', "<Cmd>:lua require('harpoon.ui').nav_file(5)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h6', "<Cmd>:lua require('harpoon.ui').nav_file(6)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h7', "<Cmd>:lua require('harpoon.ui').nav_file(7)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h8', "<Cmd>:lua require('harpoon.ui').nav_file(8)<CR>", { desc = 'go to nth file' })
    vim.keymap.set('n', '<leader>h9', "<Cmd>:lua require('harpoon.ui').nav_file(9)<CR>", { desc = 'go to nth file' })
  end,
}
