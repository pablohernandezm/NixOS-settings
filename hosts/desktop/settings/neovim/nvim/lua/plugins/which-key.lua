return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'echasnovski/mini.icons', version = false },
    },
    opts = {},
    config = function(_, opts)
      local wk = require 'which-key'
      wk.setup(opts)

      wk.add({
        -- Buffer group
        { "<leader>b", group = "buffers", icon = '󰓩' },

        -- Dadbod group
        { "<leader>D", group = "dadbod", icon = '' },

        -- Telescope group
        { "<leader>t", group = "telescope" },

        -- Trouble group
        { "<leader>x", group = "trouble", icon = '󱪘' }
      })
    end
  },
}
