local status, lualine = pcall(require, "lualine")

if not status then return end

lualine.setup({
	options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {"NvimTree", "Trouble", "toggleterm", "undotree", "diff"}
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { function() return "INACTIVE" end,'branch', 'diff', 'diagnostics', 'filename'},
		lualine_c = {},
		lualine_x = {'encoding', 'fileformat', 'filetype', 'location'},
		lualine_y = {},
		lualine_z = {}
	},
})
