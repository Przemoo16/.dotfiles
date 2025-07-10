vim.g.mapleader = " " -- Set the space as a leader key

vim.opt.guicursor = "" -- Set the cursor style as a "fat" cursor

vim.opt.nu = true -- Print the line numbers
vim.opt.relativenumber = true -- Show the line numbers relatively

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>

vim.opt.smartindent = true -- Do smart autoindenting when starting a new line

vim.opt.wrap = false -- Turn off line wrap

vim.opt.swapfile = false -- Don't use a swapfile for the buffer
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files
vim.opt.undofile = true -- Save undo history

vim.opt.hlsearch = false -- Don't highlight search terms
vim.opt.incsearch = true -- Show where the search pattern matches as typing

vim.opt.termguicolors = true -- Enables 24-bit RGB color in the TUI

vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor

vim.opt.updatetime = 50 -- If this many milliseconds nothing is typed the vim triggers certain events

vim.opt.colorcolumn = "88" -- Highlight a column

vim.g.netrw_banner = 0 -- Remove the netrw banner
