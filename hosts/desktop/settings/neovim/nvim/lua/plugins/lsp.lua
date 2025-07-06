return {
	"leafOfTree/vim-svelte-plugin",
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "*",
		build = "nix run .#build-plugin",
		lazy = false,

		opts = {
			keymap = {
				preset = "default",
			},
			sources = {
				default = { "lazydev", "lsp", "dadbod", "buffer", "snippets", "path" },

				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						score_offset = 90,
					},
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = {
				use_frecency = true,
				use_proximity = true,
				sorts = { "score", "label" },

				prebuilt_binaries = {
					download = true,
					force_version = nil,
					force_system_triple = nil,
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- "williamboman/mason.nvim",
			-- "williamboman/mason-lspconfig.nvim",
		},
		opts = {
			servers = {
				postgres_lsp = {},
				tinymist = {
					settings = {
						formatterMode = "typstyle",
						exportPdf = "onType",
						semanticTokens = "disable",
					},
				},
				ts_ls = {},
				tailwindcss = {},
				svelte = {},
				nil_ls = {},
				rust_analyzer = {},
				hyprls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
				eslint = {},
				jsonls = {},
				html = {},
				taplo = {},
				cssls = {
					settings = {
						css = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						scss = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						less = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			-- local mason = require("mason")
			-- local masonlsp = require("mason-lspconfig")
			--
			-- mason.setup()

			-- local servers = vim.tbl_keys(opts.servers)

			-- masonlsp.setup {
			--   ensure_installed = servers,
			-- }

			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			})

			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			-- Format on save
			-- vim.api.nvim_create_autocmd("LspAttach", {
			--   group = vim.api.nvim_create_augroup("lsp", { clear = true }),
			--   callback = function(args)
			--     vim.api.nvim_create_autocmd("BufWritePre", {
			--       buffer = args.buf,
			--       callback = function()
			--         vim.lsp.buf.format { async = false, id = args.data.client_id }
			--       end,
			--     })
			--   end
			-- })

			-- Typst settings
			vim.api.nvim_create_user_command("OpenPdf", function()
				local filepath = vim.api.nvim_buf_get_name(0)

				if filepath:match("%.typ$") then
					local pdf_path = filepath:gsub("%.typ$", ".pdf")

					local open_command
					if vim.fn.has("mac") == 1 then
						open_command = { "open", pdf_path }
					elseif vim.fn.has("unix") == 1 then -- Linux and other Unix-like systems
						-- Common PDF viewers on Linux: xdg-open, evince, zathura, okular
						-- xdg-open is generally the most reliable as it respects default applications
						open_command = { "xdg-open", pdf_path }
					elseif vim.fn.has("win32") == 1 then -- Windows
						-- On Windows, 'start' is the equivalent of 'open' or 'xdg-open'
						-- You might need 'cmd.exe /c start "" "path/to/file.pdf"' for more complex paths
						open_command = { "cmd.exe", "/c", "start", "", pdf_path }
					else
						-- Fallback or error for unknown OS
						vim.notify("Unsupported operating system for OpenPdf command.", vim.log.levels.WARN)
						return
					end

					vim.system(open_command)
				end
			end, {})

			lspconfig["tinymist"].setup({
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>ltp", function()
						client:exec_cmd({

							title = "pin",

							command = "tinymist.pinMain",

							arguments = { vim.api.nvim_buf_get_name(0) },
						}, { bufnr = bufnr })
					end, { desc = "[T]inymist [P]in", noremap = true })

					vim.keymap.set("n", "<leader>ltu", function()
						client:exec_cmd({

							title = "unpin",

							command = "tinymist.pinMain",

							arguments = { vim.v.null },
						}, { bufnr = bufnr })
					end, { desc = "[T]inymist [U]npin", noremap = true })
				end,
			})
		end,
	},
}
