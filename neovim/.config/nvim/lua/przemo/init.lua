require("przemo.set")
require("przemo.remap")
require("przemo.lazy_init")

local przemo_group = vim.api.nvim_create_augroup('Przemo', {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = przemo_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
    desc = "Remove trailing whitespaces before writing"
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = przemo_group,
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end,
    desc = "Format file before writing"
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = przemo_group,
    callback = function(e)
        local opts = { buffer = e.buf }
        opts.desc = "Got to the definition"
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        opts.desc = "Display information about the symbol under the cursor"
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        opts.desc = "List all symbols in the current workspace"
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        opts.desc = "Show diagnostics"
        vim.keymap.set("n", "<leader>od", function() vim.diagnostic.open_float() end, opts)
        opts.desc = "See available code actions"
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        opts.desc = "List references"
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        opts.desc = "Rename all references"
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        opts.desc = "Display signature information"
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        opts.desc = "Move to the next diagnostic"
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        opts.desc = "Move to the previous diagnostic"
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
