local setup_tel, telescope = pcall(require, "telescope")
if not setup_tel then
  print("import telescope failed")
  return
end

telescope.setup({
  defaults = {
    layout_config = {
      vertical = { width = 0,1 }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})
