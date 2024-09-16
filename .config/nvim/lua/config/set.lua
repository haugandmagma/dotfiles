vim.opt.compatible = false
vim.opt.filetype = "on"
vim.opt.syntax = "enable"

vim.opt.autoread = true
vim.opt.updatecount = 0
vim.opt.hidden = true
vim.opt.diffopt = { "filler", "vertical" }
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = { "longest", "list", "full" }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.ttyfast = true
vim.opt.mouse = "a"

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("quiet")
vim.api.nvim_set_hl(0, "Keyword", { bold = true })
vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#666666" })
vim.api.nvim_set_hl(0, "Constant", { fg = "#999999" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#333333" })
