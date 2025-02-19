return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(e)
				local opts = { buffer = e.buf }
				opts.desc = "Got to the definition"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				opts.desc = "Display information about the symbol under the cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				opts.desc = "List all symbols in the current workspace"
				vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)
				opts.desc = "Show diagnostics"
				vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, opts)
				opts.desc = "See available code actions"
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "List references"
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
				opts.desc = "Rename all references"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		})

		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"html",
				"htmx",
				"lua_ls",
				"pyright",
				"ruff",
				"rust_analyzer",
				"ts_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["html"] = function()
					require("lspconfig").html.setup({
						capabilities = capabilities,
						filetypes = { "html", "htmldjango" },
						settings = {
							html = {
								format = {
									indentInnerHtml = true,
									-- Disable formatting for script tags as it incorrectly alligns the tags
									unformatted = "script",
									wrapAttributes = "preserve",
									wrapLineLength = 80,
									templating = true,
								},
							},
						},
					})
				end,

				["htmx"] = function()
					require("lspconfig").htmx.setup({
						capabilities = capabilities,
						filetypes = { "html", "htmldjango" },
					})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,

				["pyright"] = function()
					require("lspconfig").pyright.setup({
						capabilities = capabilities,
						settings = {
							pyright = {
								-- Using Ruff's import organizer
								disableOrganizeImports = true,
							},
							python = {
								analysis = {
									-- Ignore all files for analysis to exclusively use Ruff for linting
									ignore = { "*" },
								},
							},
						},
					})
				end,

				["ruff"] = function()
					require("lspconfig").ruff.setup({
						capabilities = capabilities,
						init_options = {
							settings = {
								lint = {
									select = { "ALL" },
									ignore = {
										"D100",
										"D101",
										"D102",
										"D103",
										"D104",
										"D105",
										"D106",
										"D107",
										"D203",
										"D212",
									},
								},
							},
						},
					})
				end,
			},
		})

		vim.diagnostic.config({
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
