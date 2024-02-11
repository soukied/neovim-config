local opt = vim.opt

opt.mouse = "a"
opt.cursorline = true

opt.swapfile = false
opt.backup = false
opt.undodir = { os.getenv("HOME") .. "/.vim/undodir" }
opt.undofile = true

opt.laststatus = 2

opt.number = true
opt.relativenumber = true

opt.showmode = false

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 8

opt.termguicolors = true

opt.hlsearch = true
opt.incsearch = true

opt.updatetime = 50

vim.api.nvim_create_augroup("EmmetEnable", { clear = false })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "EmmetEnable",
	pattern = { "html" },
	command = "EmmetInstall",
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "● ",
	},
	severity_sort = true,
	float = {
		source = "always",
	},
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	group = vim.api.nvim_create_augroup("NvimTreeAutoclose", { clear = false }),
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
			pcall(vim.cmd, "quit")
		end
	end,
})
