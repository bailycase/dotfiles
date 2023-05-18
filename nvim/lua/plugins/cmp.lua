-- Setup nvim-cmp.
local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end

lspkind.init({
	symbol_map = {
		Copilot = "",
	},
})
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

local cmp = require("cmp")

require("cmp_nvim_ultisnips").setup({})
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "copilot" },
		{ name = "ultisnips" }, -- For ultisnips users.
	}, {
		{ name = "buffer", keyword_length = 5 },
	}),
	sorting = {
		priority_weight = 2,
		cmp.config.compare.offset,
		cmp.config.compare.exact,
		cmp.config.compare.score,
		function(entry1, entry2)
			local _, entry1_under = entry1.completion_item.label:find("^_+")
			local _, entry2_under = entry2.completion_item.label:find("^_+")
			entry1_under = entry1_under or 0
			entry2_under = entry2_under or 0
			if entry1_under > entry2_under then
				return false
			elseif entry1_under < entry2_under then
				return true
			end
		end,

		cmp.config.compare.kind,
		cmp.config.compare.sort_text,
		cmp.config.compare.length,
		cmp.config.compare.order,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
				tn = "[TabNine]",
				eruby = "[erb]",
			},
		}),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }
