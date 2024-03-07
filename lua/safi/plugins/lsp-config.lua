local setup, lspconfig = pcall(require, 'lspconfig')
if not setup then
  print("lsp config not installed")
  return
end

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

lspconfig["gopls"].setup({})
