return {
	{ "echasnovski/mini.icons", version = false },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},

		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({
				-- Buffer group
				{ "<leader>b", group = "buffers", icon = "󰓩" },

				-- Dadbod group
				{ "<leader>D", group = "dadbod", icon = "" },

				-- Telescope group
				{ "<leader>t", group = "telescope" },

				-- Trouble group
				{ "<leader>x", group = "trouble", icon = "󱪘" },

				-- File key maps
				{ "<leader>w", "<cmd>w<cr>", desc = "Save file", mode = "n", icon = "" },
				{ "<leader>W", "<cmd>w!<cr>", desc = "Save file forced", mode = "n", icon = "" },
				{ "<leader>q", "<cmd>q<cr>", desc = "Quit", mode = "n" },
				{ "<leader>Q", "<cmd>q!<cr>", desc = "Force quit", mode = "n" },

				-- Buffer key maps
				{ "<leader>bc", "<cmd>bd<cr>", desc = "Close buffer", mode = "n" },

				-- Environment key maps
				{ "<leader>r", "<cmd>so ~/.config/nvim/init.lua<cr>", desc = "Reload settings", mode = "n", icon = "󰑓" },
			})
		end,
	},
}
