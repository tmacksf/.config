function ColorGruberDarker()
  vim.opt.background = "dark"
  vim.opt.termguicolors = true
  vim.cmd.colorscheme("gruber-darker")
end

function ColorMelange()
  vim.opt.background = "dark"
  vim.opt.termguicolors = true
  vim.cmd.colorscheme("melange")
end

function ColorKanagawa()
  vim.opt.background = "dark"
  vim.opt.termguicolors = true
  vim.cmd.colorscheme("kanagawa")
end

return {
  { "savq/melange-nvim",             name = "melange",       lazy = false },
  { "blazkowolf/gruber-darker.nvim", name = "gruber-darker", lazy = false },
  { "rebelot/kanagawa.nvim",         name = "kanagawa",      priority = 1000, lazy = false },
}
