local setup, mason = pcall(require, "mason")
if not setup then
  print("Mason not installed")
  return
end
local setup, masonlsp = pcall(require, "mason-lspconfig")
if not setup then
  print("Mason-lspconfig not installed")
  return
end
local setup, masontools = pcall(require, "mason-tool-installer")
if not setup then
  print("Mason-tool not installed")
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

masonlsp.setup({
  ensure_installed = {
    "tsserver",
    "lua_ls",
    "html",
    "cssls",
  },
  automatic_installation = true,
})

masontools.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
    "prettierd",
  },
})
