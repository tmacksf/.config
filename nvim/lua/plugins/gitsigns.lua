return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map('n', '<leader>gs', gs.stage_hunk, "Git stage hunk")
      map('n', '<leader>gr', gs.reset_hunk, "Git reset hunk")
      map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "Git stage hunk")
      map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "Git reset hunk")
      map('n', '<leader>gS', gs.stage_buffer, "Git stage buffer")
      map('n', '<leader>gu', gs.undo_stage_hunk, "Git undo stage hunk")
      map('n', '<leader>gR', gs.reset_buffer, "Git reset buffer")
      map('n', '<leader>gP', gs.preview_hunk, "Git preview hunk")
      map('n', '<leader>gB', function() gs.blame_line { full = true } end, "Git blame line")
      map('n', '<leader>gtb', gs.toggle_current_line_blame, "Git toggle current line blame")
      map('n', '<leader>gd', gs.diffthis, "Git diff this")
      map('n', '<leader>gD', function() gs.diffthis('~') end, "Git diff this")
      map('n', '<leader>gtd', gs.toggle_deleted, "Git toggle deleted")
      map('n', '<leader>gn', gs.next_hunk, "Git toggle deleted")
      map('n', '<leader>gp', gs.prev_hunk, "Git toggle deleted")
    end,
  },
}
