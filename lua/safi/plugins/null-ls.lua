local setup, null_ls = pcall(require, 'null-ls')
if not setup then
  print('null-ls not installed')
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish
  }
})
