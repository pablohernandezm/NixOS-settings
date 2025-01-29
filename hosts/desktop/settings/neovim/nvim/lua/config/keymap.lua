vim.keymap.set({ 'n', 'v' }, '<leader>q', '<CMD>q<CR>)', { desc = 'Close' })
vim.keymap.set({ 'n', 'v' }, '<leader>w', '<CMD>w<CR>)', { desc = 'Write' })
vim.keymap.set({ 'n', 'v' }, '<leader>%', '<CMD>so ~/.config/nvim/init.lua<CR>)', { desc = 'Reload settings' })
vim.keymap.set('n', '<leader>bc', '<CMD>bd<CR>', { desc = 'Close buffer' })
