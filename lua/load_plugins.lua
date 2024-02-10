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
	{"folke/tokyonight.nvim"},
	{"nvim-treesitter/nvim-treesitter", build =  ":TSUpdate" },
	{"mattn/emmet-vim"},
	{"ellisonleao/gruvbox.nvim"},
	{'nvim-lualine/lualine.nvim', dependencies ={'nvim-tree/nvim-web-devicons'}},
	{'xiyaowong/transparent.nvim', config = function() require('transparent').setup({}) end},
	{'mbbill/undotree'},
	{"tpope/vim-fugitive"},
	{'nvim-tree/nvim-tree.lua', dependencies ={'nvim-tree/nvim-web-devicons'}, config = function() 
		require("nvim-tree").setup({})
	end},
	{'nvim-telescope/telescope.nvim',tag='0.1.5',dependencies={'nvim-lua/plenary.nvim' }},
	{"lewis6991/gitsigns.nvim", config = function() 
		require('gitsigns').setup()
	end},
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
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', config = function()
		local bufferline = require('bufferline')
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.no_italic,
				name_formatter = function(buf) return " " .. buf.name end
			}
		})
	end},
	{"folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {icons = false},}
}, options)
