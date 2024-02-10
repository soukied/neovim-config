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
	end}
}, options)
