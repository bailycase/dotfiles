local cmp = require "cmp"

cmp.setup({
	mapping = {
 ["<Tab>"] = function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
       else
         fallback()
       end
     end,
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	sources = {
		{name = "nvim_lua"},
		{name = "nvim_lsp"}
	},
	experimental = {
		native_menu = false,
		ghost_text = true
	}
})
