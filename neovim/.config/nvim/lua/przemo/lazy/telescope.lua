return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local telescopeConfig = require("telescope.config")
        table.unpack = table.unpack or unpack
        local vimgrep_arguments = { table.unpack(telescopeConfig.values.vimgrep_arguments) }

        -- Search in hidden directories except of the .git one
        table.insert(vimgrep_arguments, "--hidden")
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")
        require('telescope').setup({
            defaults = {
                -- `hidden = true` argument is not supported in text grep commands.
                vimgrep_arguments = vimgrep_arguments,
            },
            pickers = {
                find_files = {
                    -- `hidden = true` argument will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files in a project" })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Find string in a project" })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Search for help commands" })
    end
}
