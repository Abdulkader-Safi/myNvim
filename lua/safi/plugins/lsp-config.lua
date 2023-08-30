local setup, lspconfig = pcall(require, 'lspconfig')
if not setup then
  print("lsp config not installed")
  return
end

