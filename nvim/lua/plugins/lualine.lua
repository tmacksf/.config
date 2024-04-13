local config = function()
  require('lualine').setup {
    options = {
      globalstatus = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    }
  }
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
