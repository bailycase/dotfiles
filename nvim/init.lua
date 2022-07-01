require('plugins/init')

vim.cmd([[
set number relativenumber

autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
]])

local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map('n', shortcut, command)
end

vim.g.mapleader = ","

nmap("<Leader>p", "<cmd>Telescope<cr>")
nmap("<Leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<Leader>fb", "<cmd>Telescope file_browser<cr>")
