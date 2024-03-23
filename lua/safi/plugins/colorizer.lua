local status, colorizer = pcall(require, "colorizer")
if not status then
  print("import colorizer failed")
  return
end

colorizer.setup({
  '*';
}, { mode = 'foreground' })

