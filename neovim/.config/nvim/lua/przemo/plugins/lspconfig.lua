return {
	"neovim/nvim-lspconfig",
	dependencies = {
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

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("html", {
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

		vim.lsp.config("htmx", {
			capabilities = capabilities,
			filetypes = { "html", "htmldjango" },
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.config("pyright", {
			capabilities = capabilities,
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
			},
		})

		vim.lsp.config("ruff", {
			capabilities = capabilities,
			init_options = {
				settings = {
					lint = {
						select = { "ALL" },
						ignore = {
							"COM812",
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
							"S101",
						},
					},
				},
			},
		})

		vim.diagnostic.config({
			virtual_text = {
				prefix = "",
			},
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
