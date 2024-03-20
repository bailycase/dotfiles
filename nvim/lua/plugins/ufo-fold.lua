return {
	"kevinhwang91/nvim-ufo",
	event = "BufEnter",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	opts = function()
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		--vim.keymap.set("n", "zc", require("ufo").applyFolds)

		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.o.foldcolumn = "0"
		vim.o.foldnestmax = 2
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}

		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
			})
		end

		return {
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
			},
		}
	end,
}
