vim.g.mapleader = ' '

require('plugins')

vim.opt.updatetime = 100

vim.opt.list = true

vim.opt.mouse = 'n'
vim.opt.autoread = true
vim.opt.splitbelow = false
vim.opt.splitright = true
vim.opt.langmenu = 'en'

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 7

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

--vim.cmd [[colorscheme catppuccin-macchiato]]

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"

vim.opt.showmode = false

vim.keymap.set("i", "jk", "<ESC>")

-- Navigation
vim.keymap.set("", "<C-j>", "<C-W>j")
vim.keymap.set("", "<C-k>", "<C-W>k")
vim.keymap.set("", "<C-h>", "<C-W>h")
vim.keymap.set("", "<C-l>", "<C-W>l")

vim.keymap.set("n", "<leader><Leader>", "<C-^>") -- Alternate between files

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("x", "<leader>p", [["_dP]]) -- Don't overwrite register on paste


vim.g.wiki_root = '~/wiki'
vim.g.wiki_select_method = {
  pages = require('wiki.telescope').pages,
  tags = require('wiki.telescope').tags,
  toc = require('wiki.telescope').toc,
  links = require('wiki.telescope').links,
}
