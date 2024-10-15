local M = {
  themes = {
    kanagawa = {
      styles = { "wave", "dragon", "lotus" },
      transparent = false,
      activate = function(style, transparent)
        require("kanagawa").setup({
          transparent = transparent,
        })

        vim.cmd.colorscheme("kanagawa-" .. style)
      end,
    },
    melange = {
      styles = { "dark", "light" },
      transparent = false,
      activate = function(style, _)
        if style == "light" then
          vim.opt.background = "light"
        else
          vim.opt.background = "dark"
        end

        vim.cmd.colorscheme("melange")
      end,
    },
    gruberdarker = {
      styles = { "dark" },
      transparent = false,
      activate = function(_, _)
        vim.cmd.colorscheme("gruberdarker")
      end,
    },
    gruvbox = {
      styles = { "dark", "light" },
      transparent = false,
      activate = function(style, transparent)
        if style == "light" then
          vim.opt.background = "light"
        else
          vim.opt.background = "dark"
        end
        require("gruvbox").setup({
          transparent_mode = transparent,
        })
        vim.cmd.colorscheme("gruvbox")
      end,
    },
    material = {
      styles = { "darker", "lighter", "oceanic", "palenight", "deep ocean" },
      transparent = false,
      activate = function(style, transparent)
        vim.g.material_style = style
        require("material").setup({
          disable = {
            background = transparent,
          },
        })

        vim.cmd.colorscheme("material")
      end,
    }
  }
}

function M.activate_theme(theme, style, transparent)
  local entry = M.themes[theme]

  entry.activate(style, transparent)
  if transparent then
    vim.opt.cursorline = true
  else
    vim.opt.cursorline = false
  end
end

return M
