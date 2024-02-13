local status, treesitter = pcall(require, 'nvim-treesitter.configs')

if not status then return end

treesitter.setup {
	ensure_installed = { "c", "lua", "vim", "typescript", "javascript", "cpp", "query", "html", "css", "rust", "json", "python" },
	modules = {},
	ignore_install = {},
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
