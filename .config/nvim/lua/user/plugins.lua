local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Plugin Management
  use "wbthomason/packer.nvim"          -- Plugin manager
  use "nvim-lua/popup.nvim"             -- Popup API for Neovim
  use "nvim-lua/plenary.nvim"           -- Lua functions used by plugins

  -- Colorscheme
  use "morhetz/gruvbox"                 -- Best colorscheme

  -- Statusbar
  use "vim-airline/vim-airline"         -- Cool statusbar

  -- Developer icons
  use "ryanoasis/vim-devicons"          -- Cool developer icons

  -- Syntax Highliting
  use "nvim-treesitter/nvim-treesitter" -- Better syntax highliting

  -- Completion
  use "hrsh7th/nvim-cmp"                -- Main plugin
  use "hrsh7th/cmp-buffer"              -- Buffer completion
  use "hrsh7th/cmp-path"                -- Path completion
  use "hrsh7th/cmp-cmdline"             -- Commandline completion
  use "saadparwaiz1/cmp_luasnip"        -- Snippet completion
  use "hrsh7th/cmp-nvim-lsp"            -- Neovim LSP
  use "hrsh7th/cmp-nvim-lua"            -- Neovim Lua completion

  -- Snippets
  use "L3MON4D3/LuaSnip"                -- Snippet engine
  use "rafamadriz/friendly-snippets"    -- Lots of snippets

  -- Language Server
  use "neovim/nvim-lspconfig"           -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- Language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"   -- Find files, code, etc...

  -- Auto-pairs
  use "jiangmiao/auto-pairs"            -- Autopairs (), {}, [], etc...

  -- Comments
  use "tpope/vim-commentary"            -- Comment and uncomment things easily

  -- File tree
  use "preservim/nerdtree"              -- Cool nerdtree

  -- Terminal
  use "akinsho/toggleterm.nvim"         -- Toggleterm

	-- Live Server
	use "turbio/bracey.vim"								-- Live server

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
