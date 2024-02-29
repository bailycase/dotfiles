return {
  "nvim-telescope/telescope.nvim",
  --event = "VimEnter",
  cmd = "Telescope",
  version = false,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  opts = function()
    local themes = require("telescope.themes")

    --[[
    return {
      defaults = {
        file_ignore_patterns = { "node_modules" },
        path_display = { "smart" },
      },
      pickers = {
        find_files = {
          hidden = true,
          theme = "dropdown",
        },
        live_grep = {
          theme = "dropdown",
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
        file_browser = {
          --theme = "ivy",
          -- grouped = true,
          --initial_browser = "tree",
          --auto_depth = true,
          path = "%:p:h",
          hijack_netrw = true,
        },
        find_hidden = {
          hidden_files = true,
        },
        ["ui-select"] = {
          themes.get_dropdown({}),
        },
      },
    }
    --]]
    return {}
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
    vim.keymap.set("n", "<leader>fc", vim.lsp.buf.code_action, {})

    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})

    telescope.setup(opts)
    telescope.load_extension("file_browser")
    --telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
