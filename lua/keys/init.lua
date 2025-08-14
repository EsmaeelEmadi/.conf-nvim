local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
  return
end

wk.add {
  {
    -- oil
    '<leader>o',
    '<CMD>Oil<CR>',
    desc = 'Open Oil File Browser',
    mode = 'n',
  },
  {
    -- code action
    'ca',
    vim.lsp.buf.code_action,
    desc = '[C]ode [A]ction',
    mode = 'n',
  },
}

vim.keymap.set('n', '<C-\\>', function()
  vim.cmd('tab stj ' .. vim.fn.expand '<cword>')
end, { noremap = true, silent = true, desc = 'Open tag in new tab' })
