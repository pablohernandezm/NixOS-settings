return {
	{
		"stevearc/conform.nvim",

		lazy = false,
		priority = 1000,

		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = function()
			require("conform").setup({
				formatters_by_ft = {
					typst = { "typstyle" },
					lua = { "stylua" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf, async=true, lsp_format="fallback" })
				end,
			})
		end,
	},
}
