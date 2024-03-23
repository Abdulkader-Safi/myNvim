local status_config,treesitter = pcall(require, "nvim-treesitter.configs")
if not status_config then
  print("nvim-treesitter.configs")
  return
end

local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
  print("ts-autotag not installed")
  return
end

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

autotag.setup()
