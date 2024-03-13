local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

-- configure autopairs
autopairs.setup({
  disable_filetype = {
    "TelescopePrompt",
    "vim",
  },
})

