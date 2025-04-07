return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
    vim.g.gruvbox_material_disable_terminal_colors = true
    vim.g.gruvbox_material_ui_contrast = "high"
    vim.g.gruvbox_material_background = 'medium'
    vim.g.gruvbox_material_foreground = "original"
    vim.cmd.colorscheme('gruvbox-material')
  end
}
