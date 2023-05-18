require("plugins/init")

vim.g.mapleader = ","
vim.o.background = "dark"
vim.cmd("colorscheme nightfox")
vim.cmd([[
autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
set number relativenumber
set splitright
set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamedplus
set noshowmode

noremap <silent> <leader>gg :LazyGit<CR>
]])
