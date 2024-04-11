local setup, btw = pcall(require, "btw")
if not setup then
  return
end


btw.setup({
  text = "I use Neovim (BTW)"
})
