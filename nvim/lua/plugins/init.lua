local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer. Restart Neovim for changes to take effect")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost init.lua source <afile> | PackerSync
	]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function()
	local config = function(name)
		return string.format("require('plugins.%s')", name)
	end

	use("wbthomason/packer.nvim")
	use("morhetz/gruvbox")
	use("nvim-telescope/telescope-ui-select.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
		config = config("telescope"),
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = config("treesitter"),
	})

	use({
		"neovim/nvim-lspconfig",
		config = config("lsp"),
	})

	use({
		"p00f/clangd_extensions.nvim",
		config = config("clangd"),
	})

	use({
		"hrsh7th/cmp-nvim-lsp",
		config = config("cmp"),
	})
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/vim-vsnip")
	use("SirVer/ultisnips")
	use("quangnguyen30192/cmp-nvim-ultisnips")

	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = config("null-ls"),
	})

	use({
		"feline-nvim/feline.nvim",
		config = config("feline"),
	})

	use("EdenEast/nightfox.nvim")

	use("kyazdani42/nvim-web-devicons")

	use({
		"lewis6991/gitsigns.nvim",
		config = config("gitsigns"),
	})

	use("onsails/lspkind-nvim")
end)
