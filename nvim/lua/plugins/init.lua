return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  { 'numToStr/Comment.nvim',       lazy = false, },
  { "folke/neoconf.nvim",          cmd = "Neoconf" },
  { "nvim-tree/nvim-web-devicons", lazy = false },
  { "folke/todo-comments.nvim",    dependencies = { "nvim-lua/plenary.nvim", }, lazy = false },
  { "folke/todo-comments.nvim",    dependencies = { "nvim-lua/plenary.nvim" },  lazy = false }
}
