-- Disable NetRW and its plugin, useful if you plan to use a plugin like nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tabulation and indentation settings
vim.opt.expandtab = true   -- Convert tabs into spaces
vim.opt.smartindent = true -- Smart indenting when starting a new line
vim.opt.tabstop = 2        -- Set a tab to be equivalent to 2 spaces
vim.opt.shiftwidth = 2     -- Size of the indentation when using << or >>

vim.opt.wrap = false       -- Disable line wrapping, allowing lines to continue horizontally

-- Line numbering settings
vim.opt.number = true         -- Show line numbers in the left margin
vim.opt.relativenumber = true -- Show relative line numbers to facilitate movements

-- Terminal colors
vim.opt.termguicolors = true -- Enable 24-bit colors for a better visual experience
