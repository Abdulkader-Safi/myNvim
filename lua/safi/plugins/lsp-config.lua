local setup, lspconfig = pcall(require, 'lspconfig')
if not setup then
  print("lsp config not installed")
  return
end

local protocol = require('vim.lsp.protocol')

lspconfig["dartls"].setup({
  on_attach = on_attach,
	settings = {
		dart = {
			analysisExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/flutter/"),
			},
			updateImportsOnRename = true,
			completeFunctionCalls = true,
			showTodos = true,
		},
	},
})

lspconfig["gopls"].setup({
  on_attach = on_attach,
})

lspconfig["htmx"].setup({
  on_attach = on_attach,
})

lspconfig["html"].setup({
  on_attach = on_attach,
})

lspconfig["tsserver"].setup({
  on_attach = on_attach,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { 
    "typescript-language-server", 
    "--stdio"
  }, 
})

lspconfig['tailwindcss'].setup({})
