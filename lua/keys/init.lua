local wk = require 'which-key'

-- Basic keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Tmux navigation
vim.keymap.set('n', '<C-h>', '<Cmd>TmuxNavigateLeft<CR>', { desc = 'Navigate left (tmux)' })
vim.keymap.set('n', '<C-j>', '<Cmd>TmuxNavigateDown<CR>', { desc = 'Navigate down (tmux)' })
vim.keymap.set('n', '<C-k>', '<Cmd>TmuxNavigateUp<CR>', { desc = 'Navigate up (tmux)' })
vim.keymap.set('n', '<C-l>', '<Cmd>TmuxNavigateRight<CR>', { desc = 'Navigate right (tmux)' })
vim.keymap.set('n', '<C-\\>', '<Cmd>TmuxNavigateLastActive<CR>', { desc = 'Navigate last active (tmux)' })
vim.keymap.set('n', '<C-space>', '<Cmd>TmuxNavigateNext<CR>', { desc = 'Navigate next (tmux)' })

-- Tag navigation
vim.keymap.set('n', '<C-\\>', function()
  vim.cmd('tab stj ' .. vim.fn.expand '<cword>')
end, { desc = 'Open tag in new tab' })

-- Which-key groups and mappings
wk.add {
  -- Top-level groups
  { '<leader>b', group = 'Buffer' },
  { '<leader>c', group = 'Code' },
  { '<leader>f', group = 'Find' },
  { '<leader>g', group = 'Git' },
  { '<leader>h', group = 'Harpoon' },
  { '<leader>s', group = 'Search' },
  { '<leader>t', group = 'Toggle' },
  { '<leader>u', group = 'UI' },
  { '<leader>x', group = 'Diagnostics' },

  -- Oil
  { '<leader>o', '<CMD>Oil<CR>', desc = 'Open Oil File Browser' },
  {
    '<leader>e',
    function()
      Snacks.explorer()
    end,
    desc = 'File Explorer',
  },

  -- Code actions
  { 'ca', vim.lsp.buf.code_action, desc = 'Code Action' },
  {
    'ff',
    function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end,
    desc = 'Format buffer',
  },

  -- Buffer
  -- {
  --   '<leader><leader>',
  --   function()
  --     Snacks.picker.smart()
  --   end,
  --   desc = 'Smart Find Files',
  -- },
  -- {
  --   '<leader>,',
  --   function()
  --     Snacks.picker.buffers()
  --   end,
  --   desc = 'Buffers',
  -- },
  --
  -- -- Code
  -- { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
  -- { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions/References (Trouble)' },
  -- {
  --   '<leader>cR',
  --   function()
  --     Snacks.rename.rename_file()
  --   end,
  --   desc = 'Rename File',
  -- },
  --
  -- -- Find
  -- {
  --   '<leader>fb',
  --   function()
  --     Snacks.picker.buffers()
  --   end,
  --   desc = 'Buffers',
  -- },
  -- {
  --   '<leader>fc',
  --   function()
  --     Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
  --   end,
  --   desc = 'Find Config File',
  -- },
  -- {
  --   '<leader>ff',
  --   function()
  --     Snacks.picker.files()
  --   end,
  --   desc = 'Find Files',
  -- },
  -- {
  --   '<leader>fg',
  --   function()
  --     Snacks.picker.git_files()
  --   end,
  --   desc = 'Find Git Files',
  -- },
  -- {
  --   '<leader>fp',
  --   function()
  --     Snacks.picker.projects()
  --   end,
  --   desc = 'Projects',
  -- },
  -- {
  --   '<leader>fr',
  --   function()
  --     Snacks.picker.recent()
  --   end,
  --   desc = 'Recent',
  -- },
  --
  -- -- Git
  -- {
  --   '<leader>gb',
  --   function()
  --     Snacks.picker.git_branches()
  --   end,
  --   desc = 'Git Branches',
  -- },
  -- {
  --   '<leader>gB',
  --   function()
  --     Snacks.gitbrowse()
  --   end,
  --   desc = 'Git Browse',
  --   mode = { 'n', 'v' },
  -- },
  -- {
  --   '<leader>gd',
  --   function()
  --     Snacks.picker.git_diff()
  --   end,
  --   desc = 'Git Diff (Hunks)',
  -- },
  -- {
  --   '<leader>gf',
  --   function()
  --     Snacks.picker.git_log_file()
  --   end,
  --   desc = 'Git Log File',
  -- },
  -- {
  --   '<leader>gg',
  --   function()
  --     Snacks.lazygit()
  --   end,
  --   desc = 'Lazygit',
  -- },
  -- {
  --   '<leader>gi',
  --   function()
  --     Snacks.picker.gh_issue()
  --   end,
  --   desc = 'GitHub Issues (open)',
  -- },
  -- {
  --   '<leader>gI',
  --   function()
  --     Snacks.picker.gh_issue { state = 'all' }
  --   end,
  --   desc = 'GitHub Issues (all)',
  -- },
  -- {
  --   '<leader>gl',
  --   function()
  --     Snacks.picker.git_log()
  --   end,
  --   desc = 'Git Log',
  -- },
  -- {
  --   '<leader>gL',
  --   function()
  --     Snacks.picker.git_log_line()
  --   end,
  --   desc = 'Git Log Line',
  -- },
  -- {
  --   '<leader>gp',
  --   function()
  --     Snacks.picker.gh_pr()
  --   end,
  --   desc = 'GitHub Pull Requests (open)',
  -- },
  -- {
  --   '<leader>gP',
  --   function()
  --     Snacks.picker.gh_pr { state = 'all' }
  --   end,
  --   desc = 'GitHub Pull Requests (all)',
  -- },
  -- {
  --   '<leader>gs',
  --   function()
  --     Snacks.picker.git_status()
  --   end,
  --   desc = 'Git Status',
  -- },
  -- {
  --   '<leader>gS',
  --   function()
  --     Snacks.picker.git_stash()
  --   end,
  --   desc = 'Git Stash',
  -- },
  --
  -- -- Harpoon
  -- {
  --   '<leader>ha',
  --   function()
  --     require('harpoon'):list():add()
  --   end,
  --   desc = 'Add file to harpoon',
  -- },
  -- {
  --   '<leader>ho',
  --   function()
  --     require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
  --   end,
  --   desc = 'Open harpoon',
  -- },
  { '<leader>h0', "<Cmd>:lua require('harpoon.ui').nav_file(0)<CR>", desc = 'Go to file 0' },
  { '<leader>h1', "<Cmd>:lua require('harpoon.ui').nav_file(1)<CR>", desc = 'Go to file 1' },
  { '<leader>h2', "<Cmd>:lua require('harpoon.ui').nav_file(2)<CR>", desc = 'Go to file 2' },
  { '<leader>h3', "<Cmd>:lua require('harpoon.ui').nav_file(3)<CR>", desc = 'Go to file 3' },
  { '<leader>h4', "<Cmd>:lua require('harpoon.ui').nav_file(4)<CR>", desc = 'Go to file 4' },
  { '<leader>h5', "<Cmd>:lua require('harpoon.ui').nav_file(5)<CR>", desc = 'Go to file 5' },
  { '<leader>h6', "<Cmd>:lua require('harpoon.ui').nav_file(6)<CR>", desc = 'Go to file 6' },
  { '<leader>h7', "<Cmd>:lua require('harpoon.ui').nav_file(7)<CR>", desc = 'Go to file 7' },
  { '<leader>h8', "<Cmd>:lua require('harpoon.ui').nav_file(8)<CR>", desc = 'Go to file 8' },
  { '<leader>h9', "<Cmd>:lua require('harpoon.ui').nav_file(9)<CR>", desc = 'Go to file 9' },

  -- Search (Telescope & Snacks)
  -- {
  --   '<leader>/',
  --   function()
  --     Snacks.picker.grep()
  --   end,
  --   desc = 'Grep',
  -- },
  -- {
  --   '<leader>:',
  --   function()
  --     Snacks.picker.command_history()
  --   end,
  --   desc = 'Command History',
  -- },
  -- {
  --   '<leader>s"',
  --   function()
  --     Snacks.picker.registers()
  --   end,
  --   desc = 'Registers',
  -- },
  -- {
  --   '<leader>s/',
  --   function()
  --     Snacks.picker.search_history()
  --   end,
  --   desc = 'Search History',
  -- },
  -- {
  --   '<leader>sa',
  --   function()
  --     Snacks.picker.autocmds()
  --   end,
  --   desc = 'Autocmds',
  -- },
  -- {
  --   '<leader>sb',
  --   function()
  --     Snacks.picker.lines()
  --   end,
  --   desc = 'Buffer Lines',
  -- },
  -- {
  --   '<leader>sB',
  --   function()
  --     Snacks.picker.grep_buffers()
  --   end,
  --   desc = 'Grep Open Buffers',
  -- },
  -- {
  --   '<leader>sc',
  --   function()
  --     Snacks.picker.command_history()
  --   end,
  --   desc = 'Command History',
  -- },
  -- {
  --   '<leader>sC',
  --   function()
  --     Snacks.picker.commands()
  --   end,
  --   desc = 'Commands',
  -- },
  -- {
  --   '<leader>sd',
  --   function()
  --     Snacks.picker.diagnostics()
  --   end,
  --   desc = 'Diagnostics',
  -- },
  -- {
  --   '<leader>sD',
  --   function()
  --     Snacks.picker.diagnostics_buffer()
  --   end,
  --   desc = 'Buffer Diagnostics',
  -- },
  {
    '<leader>sf',
    function()
      require('telescope.builtin').find_files()
    end,
    desc = 'Search Files',
  },
  -- {
  --   '<leader>sg',
  --   function()
  --     Snacks.picker.grep()
  --   end,
  --   desc = 'Grep',
  -- },
  -- {
  --   '<leader>sh',
  --   function()
  --     Snacks.picker.help()
  --   end,
  --   desc = 'Help Pages',
  -- },
  -- {
  --   '<leader>sH',
  --   function()
  --     Snacks.picker.highlights()
  --   end,
  --   desc = 'Highlights',
  -- },
  -- {
  --   '<leader>si',
  --   function()
  --     Snacks.picker.icons()
  --   end,
  --   desc = 'Icons',
  -- },
  -- {
  --   '<leader>sj',
  --   function()
  --     Snacks.picker.jumps()
  --   end,
  --   desc = 'Jumps',
  -- },
  -- {
  --   '<leader>sk',
  --   function()
  --     Snacks.picker.keymaps()
  --   end,
  --   desc = 'Keymaps',
  -- },
  -- {
  --   '<leader>sl',
  --   function()
  --     Snacks.picker.loclist()
  --   end,
  --   desc = 'Location List',
  -- },
  -- {
  --   '<leader>sm',
  --   function()
  --     Snacks.picker.marks()
  --   end,
  --   desc = 'Marks',
  -- },
  -- {
  --   '<leader>sM',
  --   function()
  --     Snacks.picker.man()
  --   end,
  --   desc = 'Man Pages',
  -- },
  {
    '<leader>sn',
    function()
      require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
    end,
    desc = 'Search Neovim files',
  },
  -- {
  --   '<leader>sp',
  --   function()
  --     Snacks.picker.lazy()
  --   end,
  --   desc = 'Search for Plugin Spec',
  -- },
  -- {
  --   '<leader>sq',
  --   function()
  --     Snacks.picker.qflist()
  --   end,
  --   desc = 'Quickfix List',
  -- },
  {
    '<leader>sr',
    function()
      require('telescope.builtin').resume()
    end,
    desc = 'Search Resume',
  },
  -- {
  --   '<leader>sR',
  --   function()
  --     Snacks.picker.resume()
  --   end,
  --   desc = 'Resume',
  -- },
  -- {
  --   '<leader>ss',
  --   function()
  --     Snacks.picker.lsp_symbols()
  --   end,
  --   desc = 'LSP Symbols',
  -- },
  -- {
  --   '<leader>sS',
  --   function()
  --     Snacks.picker.lsp_workspace_symbols()
  --   end,
  --   desc = 'LSP Workspace Symbols',
  -- },
  -- {
  --   '<leader>su',
  --   function()
  --     Snacks.picker.undo()
  --   end,
  --   desc = 'Undo History',
  -- },
  -- {
  --   '<leader>sw',
  --   function()
  --     Snacks.picker.grep_word()
  --   end,
  --   desc = 'Visual selection or word',
  --   mode = { 'n', 'x' },
  -- },
  {
    '<leader>s.',
    function()
      require('telescope.builtin').oldfiles()
    end,
    desc = 'Search Recent Files',
  },

  -- UI
  { '<leader>ub', desc = 'Toggle Dark Background' },
  { '<leader>uc', desc = 'Toggle Conceallevel' },
  -- {
  --   '<leader>uC',
  --   function()
  --     Snacks.picker.colorschemes()
  --   end,
  --   desc = 'Colorschemes',
  -- },
  -- { '<leader>ud', desc = 'Toggle Diagnostics' },
  -- { '<leader>uD', desc = 'Toggle Dim' },
  -- { '<leader>ug', desc = 'Toggle Indent' },
  -- { '<leader>uh', desc = 'Toggle Inlay Hints' },
  -- { '<leader>ul', desc = 'Toggle Line Number' },
  -- { '<leader>uL', desc = 'Toggle Relative Number' },
  -- {
  --   '<leader>un',
  --   function()
  --     Snacks.notifier.hide()
  --   end,
  --   desc = 'Dismiss All Notifications',
  -- },
  { '<leader>us', desc = 'Toggle Spelling' },
  { '<leader>uT', desc = 'Toggle Treesitter' },
  { '<leader>uw', desc = 'Toggle Wrap' },

  -- Diagnostics (Trouble)
  -- { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
  -- { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
  -- { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
  -- { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },

  -- Other
  -- {
  --   '<leader>.',
  --   function()
  --     Snacks.scratch()
  --   end,
  --   desc = 'Toggle Scratch Buffer',
  -- },
  -- {
  --   '<leader>n',
  --   function()
  --     Snacks.notifier.show_history()
  --   end,
  --   desc = 'Notification History',
  -- },
  -- {
  --   '<leader>p',
  --   function()
  --     Snacks.picker.yanky()
  --   end,
  --   desc = 'Open Yank History',
  --   mode = { 'n', 'x' },
  -- },
  -- {
  --   '<leader>S',
  --   function()
  --     Snacks.scratch.select()
  --   end,
  --   desc = 'Select Scratch Buffer',
  -- },

  -- LSP (Snacks)
  -- {
  --   'gd',
  --   function()
  --     Snacks.picker.lsp_definitions()
  --   end,
  --   desc = 'Goto Definition',
  -- },
  -- {
  --   'gD',
  --   function()
  --     Snacks.picker.lsp_declarations()
  --   end,
  --   desc = 'Goto Declaration',
  -- },
  -- {
  --   'gr',
  --   function()
  --     Snacks.picker.lsp_references()
  --   end,
  --   desc = 'References',
  --   nowait = true,
  -- },
  -- {
  --   'gI',
  --   function()
  --     Snacks.picker.lsp_implementations()
  --   end,
  --   desc = 'Goto Implementation',
  -- },
  -- {
  --   'gy',
  --   function()
  --     Snacks.picker.lsp_type_definitions()
  --   end,
  --   desc = 'Goto Type Definition',
  -- },
  -- { 'gO', desc = 'Open Document Symbols' },
  -- { 'gW', desc = 'Open Workspace Symbols' },
  -- {
  --   'gai',
  --   function()
  --     Snacks.picker.lsp_incoming_calls()
  --   end,
  --   desc = 'Calls Incoming',
  -- },
  -- {
  --   'gao',
  --   function()
  --     Snacks.picker.lsp_outgoing_calls()
  --   end,
  --   desc = 'Calls Outgoing',
  -- },
  { 'grn', desc = 'Rename' },
  { 'grr', desc = 'Goto References' },
  { 'gri', desc = 'Goto Implementation' },
  { 'grd', desc = 'Goto Definition' },
  { 'grD', desc = 'Goto Declaration' },
  { 'grt', desc = 'Goto Type Definition' },

  -- Flash
  {
    ';',
    function()
      require('flash').jump()
    end,
    desc = 'Flash',
    mode = { 'n', 'x', 'o' },
  },
  {
    ';;',
    function()
      require('flash').treesitter()
    end,
    desc = 'Flash Treesitter',
    mode = { 'n', 'o', 'x' },
  },

  -- Yanky
  -- { 'y', '<Plug>(YankyYank)', desc = 'Yank text', mode = { 'n', 'x' } },
  -- { 'p', '<Plug>(YankyPutAfter)', desc = 'Put yanked text after cursor', mode = { 'n', 'x' } },
  -- { 'P', '<Plug>(YankyPutBefore)', desc = 'Put yanked text before cursor', mode = { 'n', 'x' } },

  -- Terminal
  { '<F1>', desc = 'Toggle Terminal' },
  -- {
  --   '<c-/>',
  --   function()
  --     Snacks.terminal()
  --   end,
  --   desc = 'Toggle Terminal',
  -- },
  -- {
  --   '<c-_>',
  --   function()
  --     Snacks.terminal()
  --   end,
  --   desc = 'which_key_ignore',
  -- },
  --
  -- -- Words navigation
  -- {
  --   ']]',
  --   function()
  --     Snacks.words.jump(vim.v.count1)
  --   end,
  --   desc = 'Next Reference',
  --   mode = { 'n', 't' },
  -- },
  -- {
  --   '[[',
  --   function()
  --     Snacks.words.jump(-vim.v.count1)
  --   end,
  --   desc = 'Prev Reference',
  --   mode = { 'n', 't' },
  -- },
}
