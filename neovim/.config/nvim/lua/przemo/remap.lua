vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Close the file" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected block up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Append the line bellow and keep cursor in the same position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep the cursor in the middle when searching for the next term" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep the cursor in the middle when searching for the previous term" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste the text without lossing the current buffer" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete the text and put it to the void buffer" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection to the system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to the system clipboard" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace the word under the cursor" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make the current file executable", silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>",
    { desc = "Execute 'make_it_rain' animation" })

vim.keymap.set("n", "<C-f>", "<cmd>!tmux new-window tmux-sessionizer<CR>",
    { desc = "Run tmux-sessionizer", silent = true })
