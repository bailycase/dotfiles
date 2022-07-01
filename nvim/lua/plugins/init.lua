-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use({ "wbthomason/packer.nvim", opt = true })

	local config = function(name)
		return string.format("require('plugins.%s')", name)
	end

	local use_with_config = function(path, name)
		use({ path, config = config(name) })
	end

	use("itchyny/lightline.vim")

	-- Iceberg Color Scheme
	use("cocopon/iceberg.vim")

	-- Syntax Highlighting
	use("othree/html5.vim")
	use("pangloss/vim-javascript")
	use("evanleck/vim-svelte")
	use("leafgarland/typescript-vim")

	-- LSP
	use_with_config("neovim/nvim-lspconfig", "lsp-config")
	use "williamboman/nvim-lsp-installer"
	--"neovim/nvim-lspconfig",
	--}

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Extra Stuff
	use("nvim-lua/plenary.nvim")

	-- Completion
	use("L3MON4D3/LuaSnip")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
		},
		config = config("cmp"),
	})

	-- File Tree
	use({
		"nvim-telescope/telescope-file-browser.nvim",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = config("telescope"),
	})

	use("BurntSushi/ripgrep")

	-- Formatting
	use("ckipp01/stylua-nvim")

	-- Discord Presence
	use_with_config('andweeb/presence.nvim', 'discord')

	-- Toggle Term
	use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
		require("toggleterm").setup()
	end }
end)
