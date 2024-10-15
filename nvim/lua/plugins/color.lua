function DefaultTheme()
  vim.opt.background = "dark"
  vim.cmd.colorscheme("kanagawa")
end

return {
  { "rebelot/kanagawa.nvim",       name = "kanagawa",     priority = 1000, lazy = false },
  { "savq/melange-nvim",           name = "melange",      lazy = false },
  { "tmacksf/gruber-darker.nvim",  name = "gruberdarker", lazy = false },
  { "ellisonleao/gruvbox.nvim",    name = "gruvbox",      lazy = false },
  { "marko-cerovac/material.nvim", name = "material",     lazy = false },
}
