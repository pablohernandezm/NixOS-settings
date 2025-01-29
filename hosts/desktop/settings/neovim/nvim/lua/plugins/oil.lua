return {
  'stevearc/oil.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('oil').setup({
      columns = { 'icon' },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['L'] = { 'actions.select' },
        ['q'] = { 'actions.close', mode = 'n' },
        ['g?'] = false,
        ['?'] = { 'actions.show_help', mode = 'n' },
        ['g.'] = false,
        ['<S-h>'] = { 'actions.toggle_hidden', mode = 'n' },
        ['<leader>tf'] = {
          function()
            require("telescope.builtin").find_files({
              cwd = require("oil").get_current_dir()
            })
          end,
          mode = 'n',
          nowait = true,
          desc = "Find files in the directory",
        },
      },
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<leader>E", require('oil').toggle_float, { desc = "Toggle floating explorer" })
    vim.keymap.set(
      'n', '<leader>e',
      function()
        vim.cmd((vim.bo.filetype == 'oil') and 'bd' or 'Oil')
      end,
      { desc = 'Toggle explorer' }
    )
  end
}
