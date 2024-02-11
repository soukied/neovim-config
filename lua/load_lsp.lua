-- Set up nvim-cmp.
local cmp = require 'cmp'

local gdscript_port = "6005"

local options = {
	clangd = {
		single_file_support = true
	},
	pyright = {
		single_file_support = true
	},
	tsserver = {
		single_file_support = true
	},
	lua_ls = {
		single_file_support = true
	},
	html = {
		single_file_support = true
	},
	cssls = {
		single_file_support = true
	},
	gdscript = {
		cmd = { "ncat", "localhost", gdscript_port },
	}
}

local lspkind = require('lspkind')

cmp.setup({
	formatting = {
		expandable_indicator = true,
		fields = { "kind", "abbr", "menu"},
		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = 20,
			ellipsis_char = '...',
			show_labelDetails = true,
			before = function(_, vim_item)
				return vim_item
			end
		})
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping(function(_)
			if not cmp.visible() then
				cmp.complete()
			else
				cmp.close()
			end
		end, { 'i', 's' }),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
	}, {
		{ name = 'buffer' },
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = require('lspconfig')

for langserver, opts in pairs(options) do
	opts.capabilities = capabilities
	opts.on_attach = function(_, bufnr)
		require('lsp_signature').on_attach({ hint_prefix = "󰡱 ", handler_opts = { border = "none" } }, bufnr)
	end
	lsp_config[langserver].setup(opts)
end
