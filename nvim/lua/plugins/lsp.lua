local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.templ then
  configs.templ = {
    default_config = {
      cmd = { "templ", "lsp" },
      filetypes = { "templ" },
      root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
      settings = {},
    },
  }
end

lspconfig.ols.setup({})
lspconfig.zls.setup({
  root_dir = lspconfig.util.root_pattern("zls.json", ".git"),
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  cmd = {
    "/opt/homebrew/opt/llvm/bin/clangd",
    "--background-index",
    "--pch-storage=memory",
    "--all-scopes-completion",
    "--pretty",
    "--header-insertion=never",
    "-j=4",
    "--inlay-hints",
    "--header-insertion-decorators",
    "--function-arg-placeholders",
    "--completion-style=detailed",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require("lspconfig").util.root_pattern("src"),
  init_option = { fallbackFlags = { "-std=c++2a" } },
  capabilities = capabilities,
})

lspconfig.gopls.setup({})

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.yaml"] = "/*",
      },
    },
  },
})

lspconfig.tsserver.setup({
  --capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

lspconfig.templ.setup({
  on_attach = on_attach,
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { buffer = opts.buffer })
    vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, { buffer = opts.buffer })
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
})
