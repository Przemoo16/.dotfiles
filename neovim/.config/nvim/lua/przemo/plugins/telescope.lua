return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local actions = require("telescope.actions")

		table.unpack = table.unpack or unpack
		local vimgrep_arguments = { table.unpack(require("telescope.config").values.vimgrep_arguments) }

		-- Search in hidden directories except of the .git one
		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")
		require("telescope").setup({
			defaults = {
				-- `hidden = true` argument is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` argument will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") }, { desc = "Find string" })
		end)
	end,
}
