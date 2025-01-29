return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    opts = {},
    config = function(_, opts)
      require 'telescope'.setup(opts)
      vim.keymap.set('n', '<leader>tf', '<CMD>Telescope find_files<CR>', { desc = 'Find files' })
      vim.keymap.set('n', '<leader>tg', '<CMD>Telescope live_grep<CR>', { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>tb', '<CMD>Telescope buffers<CR>', { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>th', '<CMD>Telescope help_tags<CR>', { desc = 'Help tags' })
      vim.keymap.set('n', '<leader>tr', '<CMD>Telescope lsp_references<CR>', { desc = 'Lsp references' })
      vim.keymap.set('n', '<leader>ti', '<CMD>Telescope lsp_implementations<CR>', { desc = 'Lsp implementations' })
      vim.keymap.set('n', '<leader>tw', '<CMD>Telescope lsp_definitions<CR>', { desc = 'Lsp word definitions' })
      vim.keymap.set('n', '<leader>tt', '<CMD>Telescope lsp_type_definitions<CR>', { desc = 'Lsp type definitions' })
    end,
  }
}
