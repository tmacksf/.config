local keymap = vim.keymap

local opts = { noremap = true, silent = true }
-- Pane Navigation
keymap.set("n", "<c-h>", "<C-w>h", opts)
keymap.set("n", "<c-l>", "<C-w>l", opts)
keymap.set("n", "<c-k>", "<C-w>k", opts)
keymap.set("n", "<c-j>", "<C-w>j", opts)

-- Window Creation
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

keymap.set("n", "<C-S-k>", "ddkP", opts) -- moves up one line
keymap.set("n", "<C-S-j>", "ddp", opts)  -- moves down one line
