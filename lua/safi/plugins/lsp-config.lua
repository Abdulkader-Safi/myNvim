local setup, lspconfig = pcall(require, 'lspconfig')
if not setup then
  print("lsp config not installed")
  return
end

local setup, cmpNvimLsp = pcall(require, 'cmp_nvim_lsp') 
if not setup then
  print("cmp-nvim-lsp config not installed")
  return
end

local on_attach = function(client, bufnr)
 vim.keymap.set(
    "n",
    "K",
    vim.lsp.buf.hover,
    { buffer = bufnr, desc = "Show documentation for what is under cursor" }
  )
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" })
  vim.kemap.set(
    { "n", "v" },
    "gf",
    vim.lsp.buf.code_action,
    { buffer = bufnr, desc = "See available code actions" }
  )
  vim.keymap.set(
    "n",
    "<leader>d",
    vim.diagnostic.open_float,
    { buffer = bufnr, desc = "Show diagnostics for line" }
  )
  -- vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {buffer = bufnr, desc = 'Show definition, references'})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
end

local capabilities = cmpNvimLsp.default_capabilities()
local signs = { Error = "✖", Warn = "", Hint = "󰠠", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure typescript server with plugin
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
