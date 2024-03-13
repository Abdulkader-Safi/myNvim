-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    -- false will disable the whole extension
    enable = true,
    diable = {},
    -- additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },

  ensure_installed = {
    "json",
    "tsx",
    "javascript",
    "typescript",
    "markdown",
    "markdown_inline",
    "graphql",
    "bash",
    "vim",
    "dockerfile",
    "gitignore",
    "toml",
    "yaml",
    "css",
    "html",
    "lua"
  },
  autotag = {
    enable = true,
  },

  -- auto install above language parsers
  auto_install = true,
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
