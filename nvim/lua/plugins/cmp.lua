local cmp_enabled = false
vim.api.nvim_create_user_command("ToggleAutoComplete", function()
  if cmp_enabled then
    cmp_enabled = false
    require("cmp").setup.buffer({ enabled = cmp_enabled })
    vim.api.nvim_command('echo "Cmp disabled"')
  else
    cmp_enabled = true
    require("cmp").setup.buffer({ enabled = cmp_enabled })
    vim.api.nvim_command('echo "Cmp enabled"')
  end
end, {})

vim.keymap.set("n", "<Leader>ct", "<cmd>ToggleAutoComplete<cr>", { noremap = true, desc = "Toggle cmp" })

return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      -- local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        -- TODO: Figure out better mappings
        mapping = cmp.mapping.preset.insert({
          -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
        enabled = cmp_enabled,
      })
    end,
  },
}
