return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function(_, opts)
      require 'toggleterm'.setup({
        direction = 'float',
        float_opts = {
          border = 'curved'
        }
      })

      vim.keymap.set({ 'n', 't' }, '<C-\\>', '<CMD>ToggleTerm<CR>', { desc = 'Toggle terminal' })
    end
  }
}
