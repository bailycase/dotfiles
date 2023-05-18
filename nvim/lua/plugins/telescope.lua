if not pcall(require, "telescope") then
  return
end

local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ft', telescope.extensions.file_browser.file_browser, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
