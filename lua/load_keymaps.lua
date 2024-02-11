local default_opts = {remap = false}

vim.g.mapleader = " "
-- Toggle NvimTree
vim.keymap.set('n', '<F2>', ":NvimTreeToggle<CR>", default_opts)

-- Toggle Comment
vim.keymap.set({'v','n'}, '<Leader>cc', 'gcc<Esc>', {remap = true})

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
