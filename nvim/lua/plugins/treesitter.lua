local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = { "lua", "c", "cpp", "typescript" },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
})
