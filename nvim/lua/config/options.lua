local opt = vim.opt

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = true

-- Remove newline comment
opt.formatoptions:remove({ "c", "m", "k" })

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
--opt.completeopt = "menuone,noinsert,noselect"
-- TODO: custom cursor
-- opt.guicursor =

-- Behaviour
opt.splitright = true -- new panes go right
opt.splitbelow = true -- new panes go below
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
