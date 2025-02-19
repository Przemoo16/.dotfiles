return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				typescript = { "prettier" },
			},
			format_on_save = {
				lsp_format = "fallback",
			},
		})
	end,
}
