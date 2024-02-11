local default_opts = { remap = false, silent = true }

vim.g.mapleader = " "
-- Toggle NvimTree
vim.keymap.set('n', '<F2>', ":NvimTreeToggle<CR>", default_opts)

-- Toggle Comment
vim.keymap.set({ 'v', 'n' }, '<Leader>cc', 'gcc<Esc>', { silent = true, remap = true })

-- Telescope
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', default_opts)

-- Buffer move
vim.keymap.set('n', '<leader>n', ':bn<cr>', default_opts)
vim.keymap.set('n', '<leader>p', ':bp<cr>', default_opts)

-- Toggle Undotree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', default_opts)

-- Toggle Trouble
vim.keymap.set('n', '<leader>q', ':TroubleToggle<CR>', default_opts)

-- Movement with leader key
vim.keymap.set('n', '<leader>wh', '<C-w>h', default_opts)
vim.keymap.set('n', '<leader>wj', '<C-w>j', default_opts)
vim.keymap.set('n', '<leader>wk', '<C-w>k', default_opts)
vim.keymap.set('n', '<leader>wl', '<C-w>l', default_opts)

-- Clear hightlight
vim.keymap.set('n', '<Leader>hc', ':noh<CR>', default_opts)

vim.keymap.set('v', "<Tab>", ">gv", default_opts)
vim.keymap.set('v', "<S-Tab>", "<gv", default_opts)
vim.keymap.set('v', ">", ">gv", default_opts)
vim.keymap.set('v', "<", "<gv", default_opts)

-- Clipboard
vim.keymap.set({ 'n', 'v' }, '<C-c>', '"+', default_opts)

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("HelpMapping", { clear = false }),
	pattern = { "help" },
	command = "nnoremap <buffer><silent><nowait> q :q<CR>"
})

vim.keymap.set('n', 'x', '\"_x', default_opts)

-- LSP Keymap
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
