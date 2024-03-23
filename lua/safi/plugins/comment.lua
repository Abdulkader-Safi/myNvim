-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
  print("import comment failed")
  return
end

-- enable comment
comment.setup({
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>c',
    ---Block-comment toggle keymap
    block = '<leader>b',
  },
})
