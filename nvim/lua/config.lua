local tab = 4

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = tab
vim.opt.softtabstop = tab
vim.opt.shiftwidth = tab
vim.opt.colorcolumn = "80"
vim.opt.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"
vim.opt.autochdir = true
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.cmd.colorscheme("moonfly")

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.updatetime = 250
