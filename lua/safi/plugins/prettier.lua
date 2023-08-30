local setup, prettier = pcall(require, 'prettier')
if not setup then
  print("prettier not installed")
  return
end

prettier.setup({})
