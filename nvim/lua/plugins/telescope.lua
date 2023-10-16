return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "kdheepak/lazygit.nvim" },
  },
  opts = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    return {
      defaults = {
        file_ignore_patterns = { "node_modules" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        file_browser = {
          theme = "ivy",
          grouped = true,
          initial_browser = "tree",
          auto_depth = true,
          depth = 1,
          path = "%:p:h",
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
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>ft", telescope.extensions.file_browser.file_browser, {})
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

    telescope.setup(opts)
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
