local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
  print("import nvim-ts-autotag failed")
  return 
end

autotag.setup({})
