return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup {
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            }
          }
        }
      }

      vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
      vim.keymap.set("n", "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", { desc = "Close others" })
      vim.keymap.set("n", "<leader>bl", "<CMD>BufferLineCloseRight<CR>", { desc = "Close right" })
      vim.keymap.set("n", "<leader>bh", "<CMD>BufferLineCloseLeft<CR>", { desc = "Close left" })
      vim.keymap.set("n", "<leader>ba",
        function()
          for _, e in ipairs(require("bufferline").get_elements().elements) do
            vim.schedule(function()
              vim.cmd("bd " .. e.id)
            end)
          end
        end,
        { desc = "Close all buffers" })
    end
  },
}
