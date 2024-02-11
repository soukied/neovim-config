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
	-- Colorscheme
	{"folke/tokyonight.nvim"},
	{"ellisonleao/gruvbox.nvim"},
	{"dracula/vim", name = "dracula"},
	{'tanvirtin/monokai.nvim'},
	{"tomasiser/vim-code-dark"},
	{"catppuccin/nvim", name = "catppuccin", opts = {}},
	-- Treesitter
	{"nvim-treesitter/nvim-treesitter", build =  ":TSUpdate" },
	{"folke/neodev.nvim", opts = {}},
	{"mattn/emmet-vim"},
	{'xiyaowong/transparent.nvim', opts={}},
	{'mbbill/undotree'},
	{"tpope/vim-fugitive"},
	{'nvim-tree/nvim-tree.lua', dependencies ={'nvim-tree/nvim-web-devicons'}, opts={
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "",
              staged = "󰄬",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
	}},
	{'nvim-telescope/telescope.nvim',tag='0.1.5',dependencies={'nvim-lua/plenary.nvim' }},
	{"lewis6991/gitsigns.nvim", opts={numhl = true}},
	{"voldikss/vim-floaterm"},
	-- LSP Plugins
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-vsnip'},
	{'hrsh7th/vim-vsnip'},
	{"onsails/lspkind.nvim"},
	{"folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {icons = false},},
	{'akinsho/toggleterm.nvim', version = "*", opts = {}},
	{ "ray-x/lsp_signature.nvim"},
	-- Buffer and status line
	{'nvim-lualine/lualine.nvim', dependencies ={'nvim-tree/nvim-web-devicons'}},
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', config = function()
		local bufferline = require('bufferline')
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.no_italic,
				name_formatter = function(buf) return " " .. buf.name end,
				always_show_bufferline = false
			}
		})
	end},
	{ 'numToStr/Comment.nvim', opts = {}, lazy = false },
}, options)
