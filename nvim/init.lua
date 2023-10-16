require("config.lazy")

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.g.mapleader = ","
vim.o.background = "dark"
vim.cmd("colorscheme carbonfox")
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
set title

noremap <silent> <leader>gg :LazyGit<CR>
]])

-- fold settings
--vim.wo.foldmethod = "expr"
--vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
--vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
--vim.wo.fillchars = "fold: "
--vim.wo.foldnestmax = 3
--vim.wo.foldminlines = 1
