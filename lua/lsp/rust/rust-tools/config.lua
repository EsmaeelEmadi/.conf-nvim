local rt = require("rust-tools")
-- local wk = require('which-key');
--
-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       wk.register({
--         ['<leader>'] = {
--           c = {
--             name = "[C]ode Action",
--             h = { rt.hover_actions.hover_actions, { buffer = bufnr }, "code [H]over" },
--             a = { rt.code_action_group.code_action_group, { buffer = bufnr }, "code [A]ction" },
--           }
--         }
--       })
--     end
--   }
-- })


rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "H", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
