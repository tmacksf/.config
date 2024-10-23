local on_attach = function()
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { noremap = true, desc = "Go to reference" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, desc = "Go to implementation" })

  vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover" })
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Signature help" })
  vim.keymap.set("n", "<space>cd", vim.lsp.buf.type_definition,
    { noremap = true, silent = true, desc = "Go to type definition" })
  vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
  vim.keymap.set("n", "<space>ce", vim.diagnostic.goto_next,
    { noremap = true, silent = true, desc = "Go to next diagnostic" })
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action,
    { noremap = true, silent = true, desc = "Code Action" })
  -- vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next()
  --   { noremap = true, silent = true, desc = "Next diagnostic" })
  -- vim.keymap.set("n", "<leader>cp", vim.lsp.diagnostic.goto_prev,
  --   { noremap = true, silent = true, desc = "Previous diagnostic" })
  vim.keymap.set("n", "<space>cf", function()
      vim.lsp.buf.format({ async = true })
    end,
    { noremap = true, silent = true, desc = "Format file" })
end

-- Lua
local lua_setup = {
  --capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      -- workspace = {
      --   library = {
      --     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --     [vim.fn.stdpath("config") .. "/lua"] = true,
      --   },
      -- },
    },
  },
}

-- Go
local config = function()
  require("neoconf").setup({})
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local lspconfig = require("lspconfig")

  -- Setting up lsps
  lspconfig.lua_ls.setup(lua_setup)
  lspconfig.hls.setup({
    on_attach = on_attach,
  })
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  lspconfig.gopls.setup(
    {
      on_attach = on_attach,
      cmd = { "/home/thomas/go/bin/gopls" },
      capabilities = capabilities,
    }

  )
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  lspconfig.markdown_oxide.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = config,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    keys = { { "<leader>M", "<Cmd>Mason<CR>", desc = "Mason" } },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
      automatic_installation = true,
    },
    lazy = false,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
  }
}
