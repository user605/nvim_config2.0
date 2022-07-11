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
  print "Installing packer.. close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local packer = require "packer"

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

return packer.startup(function(use)
  use 'lewis6991/impatient.nvim'
  use("wbthomason/packer.nvim")

  -- Comments
  use { 'numToStr/Comment.nvim' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- pairs and tags
  use "windwp/nvim-autopairs"
  use("tpope/vim-surround")

  -- icons
  use({ "kyazdani42/nvim-web-devicons"})

  -- git
  use 'TimUntersberger/neogit'
  use 'lewis6991/gitsigns.nvim'

  use 'nvim-lua/plenary.nvim'
  use "MunifTanjim/nui.nvim"
  use "folke/zen-mode.nvim"
  use("breuckelen/vim-resize")
  use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" }
  use("lukas-reineke/indent-blankline.nvim")
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- lsp
  use({ "neovim/nvim-lspconfig"})
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- autocomplete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp" --lsp completions
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- autosave
  use "Pocco81/AutoSave.nvim"

  -- bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- colors
  use({
    "norcalli/nvim-colorizer.lua",
    opt = true,
    ft = {
      "html",
      "css",
      "vim",
      "lua",
      "scss",
      "less",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  })
  use "p00f/nvim-ts-rainbow"

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  use({
    "phaazon/hop.nvim",
    -- as = "hop",
    -- opt = true,
    -- keys = {
    --   { "n", "<leader><leader>w" },
    --   { "n", "<leader><leader>j" },
    --   { "n", "<leader><leader>f" },
    --   { "n", "<leader><leader>t" },
    -- },
    -- config = [[require('hop-config')]],
  })

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- colorscheme
  use("sainnhe/gruvbox-material")
  use { "overcache/NeoSolarized" }

  -- fuzzy finding
  use 'nvim-lua/popup.nvim' -- required for telescope-media-files
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope.nvim'
  -- use({
  --   "junegunn/fzf.vim",
  --   requires = { "junegunn/fzf" },
  --   config = [[require('fzf-config')]],
  --   opt = true,
  --   keys = {
  --     { "n", "<leader>ff" },
  --     { "n", "<leader>fa" },
  --     { "n", "<leader>fb" },
  --     { "n", "<leader>h" },
  --     { "n", "<leader>gc" },
  --     { "n", "<leader>gs" },
  --   },
  --   cmd = {
  --     "Colors",
  --     "Maps",
  --     "Commands",
  --     "GFiles",
  --   },
  -- })
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
