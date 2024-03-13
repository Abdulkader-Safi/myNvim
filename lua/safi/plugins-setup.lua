local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)

  use("wbthomason/packer.nvim") -- packer can manage itself

  -- Theme
  use("bluz71/vim-nightfly-guicolors")
  use("projekt0n/github-nvim-theme")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")

  -- maximizes and restores current window
  use("szw/vim-maximizer")

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)

  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- comment with gc
  use("numToStr/Comment.nvim")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin

  use("hrsh7th/cmp-buffer") -- source for text in buffer

  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine

  use("saadparwaiz1/cmp_luasnip") -- for autocompletion

  use("rafamadriz/friendly-snippets") -- useful snippets

  -- treesitter
  use('nvim-treesitter/nvim-treesitter',{ run = ':TSUpdate' })

  use('nvim-treesitter/playground')

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
    }
  }

  use('glepnir/lspsaga.nvim')

  use('MunifTanjim/prettier.nvim')

  use('jose-elias-alvarez/null-ls.nvim')

  use('norcalli/nvim-colorizer.lua')

  use('chama-chomo/grail')

  if packer_bootstrap then
    require("packer").sync()
  end
end)
