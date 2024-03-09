local setup, grail = pcall(require, "grail")
if not setup then
  print("Grail not installed")
  return
end

grail.setup({})
