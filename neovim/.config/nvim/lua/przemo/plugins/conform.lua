return {
	"stevearc/conform.nvim",

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				markdown = { "markdownlint" },
				lua = { "stylua" },
				typescript = { "prettier" },
				["_"] = { "trim_whitespace", "trim_newlines" },
			},
			format_on_save = {
				lsp_format = "fallback",
			},
		})
	end,
}
