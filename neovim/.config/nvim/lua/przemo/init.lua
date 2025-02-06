require("przemo.set")
require("przemo.remap")
require("przemo.lazy_init")

local przemo_group = vim.api.nvim_create_augroup("Przemo", {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = przemo_group,
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end,
    desc = "Format file before writing"
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = przemo_group,
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
    end
})
