return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { 'numToStr/Comment.nvim', lazy = false, },
  { "folke/neoconf.nvim",    cmd = "Neoconf" },
}

-- return {
--   { "nvim-tree/nvim-web-devicons", lazy = false, },
--   {
--     "folke/todo-comments.nvim",
--     dependencies = { "nvim-lua/plenary.nvim", },
--     lazy = false,
--   },
--   --[[
--   -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", lazy = false, },
--   { "folke/which-key.nvim",                lazy = true },
--   --]]
--   { "folke/neoconf.nvim",          cmd = "Neoconf", },
-- }
