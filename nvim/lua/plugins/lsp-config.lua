require("nvim-lsp-installer").setup {
 automatic_installation = false
}
require'lspconfig'.svelte.setup{}
require'lspconfig'.sumneko_lua.setup{
	settings = {
		Lua = {
		diagnostics = {
			globals = { "vim", "use" }
		}
	}
	}
}

