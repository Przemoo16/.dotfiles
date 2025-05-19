return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
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
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"hadolint",
				"markdownlint",
				"prettier",
				"shellcheck",
				"stylua",
			},
		})
	end,
}
