require("mason-nvim-dap").setup({
	ensure_installed = {"python","node2", "codelldb"},
	automatic_installation = true
})

local dap = require('dap')

dap.configurations.javascript = {
	{
		name = 'Launch',
   		type = 'node2',
   		request = 'launch',
   		program = '${file}',
   		cwd = vim.fn.getcwd(),
   		sourceMaps = true,
   		protocol = 'inspector',
   		console = 'integratedTerminal',
	},
	{
		name = 'Attach to process',
		type = 'node2',
		request = 'attach',
		processId = require'dap.utils'.pick_process,
	},
}
