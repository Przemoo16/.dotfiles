return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        local on_attach = function(client, _)
            if client.name == "ruff" then
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
            end
        end

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "html",
                "htmx",
                "lua_ls",
                "pyright",
                "ruff",
                "rust_analyzer",
                "tsserver",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach
                    }
                end,

                ["html"] = function()
                    require("lspconfig").html.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        filetypes = { "html", "htmldjango" },
                        settings = {
                            html = {
                                format = {
                                    indentInnerHtml = true,
                                    wrapAttributes = "preserve",
                                    wrapLineLength = 80,
                                },
                            },
                        },
                    }
                end,

                ["htmx"] = function()
                    require("lspconfig").htmx.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        filetypes = { "html", "htmldjango" },
                    }
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                }
                            }
                        }
                    }
                end,

                ["ruff"] = function()
                    require("lspconfig").ruff.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        init_options = {
                            settings = {
                                lint = {
                                    select = { "ALL" },
                                    ignore = {
                                        "D100", "D101", "D102", "D103", "D104", "D105", "D106", "D107", "D203", "D212"
                                    }
                                }
                            }
                        }
                    }
                end,
            }
        })

        vim.diagnostic.config({
            float = {
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
