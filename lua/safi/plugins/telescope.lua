-- import telescope plugin safely
local setup, telescope = pcall(require, "telescope.builtin")
if not setup then
  print("import telescope failed")
  return
end

