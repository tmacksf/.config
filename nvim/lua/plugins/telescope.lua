local keymap = vim.keymap

local config = function()
  local telescope = require('telescope')
  telescope.setup = ({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        }
      }
    }
  })
end

-- For selector
require("themes/theme_selector")

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
  keys = {
    keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = 'Telescope find keymaps' }),
    keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = 'Telescope find help tags' }),
    keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = 'Telescope find files' }),
    keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = 'Telescope live grep' }),
    keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = 'Telescope find buffer' }),
    keymap.set("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>",
      { desc = 'Telescope find in current buffer' }),
    keymap.set("n", "<leader>ft", ":lua Themes(require(\"telescope.themes\").get_dropdown{})<CR>",
      { desc = 'Telescope change theme' }),
    keymap.set("n", "<leader>fs", ":Telescope ", { desc = 'Telescope find custom' })
  },
}
