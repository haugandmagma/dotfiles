vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "ss", ":split ")
vim.keymap.set("n", "sv", ":vsplit ")

vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")

vim.keymap.set("n", "te", ":tabedit ")
vim.keymap.set("n", "<tab>", ":tabnext<cr>")
vim.keymap.set("n", "<s-tab>", ":tabprev<cr>")

vim.api.nvim_create_user_command("T", function(args)
    vim.cmd("below split")
    vim.cmd("resize 10")
    vim.cmd("terminal " .. args.args)
end, { nargs = "*" })
vim.keymap.set("n", "T", ":T<cr>i")
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<cr>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
