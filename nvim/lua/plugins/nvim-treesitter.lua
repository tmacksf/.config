local config = function()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
      -- TODO: Not sure if this is necessary
      additional_vim_regex_highlighting = true,
    },
    auto_install = false,
    autotag = {
      enable = true,
    },
    ensure_installed = {
      'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc',
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config,
}
