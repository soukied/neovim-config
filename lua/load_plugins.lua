local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local options = {}

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Firenvim
	{
		"glacambre/firenvim",
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},
	-- Colorscheme
	{ 'rose-pine/neovim',                name = 'rosepine',        opts = {} },
	{ 'shaunsingh/nord.nvim' },
	{ 'navarasu/onedark.nvim',           opts = { style = "deep" } },
	{ "folke/tokyonight.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "tanvirtin/monokai.nvim" },
	{ "Mofiqul/vscode.nvim",             opts = {} },
	{ "catppuccin/nvim",                 name = "catppuccin",      opts = {} },
	{ 'Mofiqul/dracula.nvim' },
	-- Treesitter
	{ "sheerun/vim-polyglot" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- Zen Mode
	{ 'folke/zen-mode.nvim',             opts = {} },
	{ "folke/neodev.nvim",               opts = {} },
	{ "mattn/emmet-vim" },
	{ "xiyaowong/transparent.nvim",      opts = {} },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			renderer = {
				icons = {
					glyphs = {
						git = {
							unstaged = "",
							staged = "󰄬",
							unmerged = "",
							renamed = "",
							untracked = "★",
							deleted = "",
							ignored = "",
						},
					},
				},
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "lewis6991/gitsigns.nvim",          opts = { numhl = true } },
	{ "voldikss/vim-floaterm" },
	-- Discord Rich Presence
	{ "andweeb/presence.nvim",            opts = { client_id = os.getenv("DISCORD_CLIENT_ID") or "" } },
	-- Mason
	{ 'williamboman/mason.nvim' },
	-- Debugger
	{ "mfussenegger/nvim-dap" },
	{ 'jay-babu/mason-nvim-dap.nvim' },
	{ 'rcarriga/nvim-dap-ui' },
	-- LSP Plugins
	{ "neovim/nvim-lspconfig" },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "onsails/lspkind.nvim" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { icons = false },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<C-\>]],
			size = 7,
			highlights = {
				Normal = {
					link = "Normal",
				},
			},
		},
	},
	{ "ray-x/lsp_signature.nvim" },
	-- none-ls
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
	-- Autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { disable_filetype = { "", "TelescopePrompt" } },
	},
	-- Buffer and status line
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					style_preset = bufferline.style_preset.no_italic,
					-- @param buf number
					name_formatter = function(buf)
						return " " .. buf.name
					end,
					always_show_bufferline = false,
				},
			})
		end,
	},
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
}, options)
