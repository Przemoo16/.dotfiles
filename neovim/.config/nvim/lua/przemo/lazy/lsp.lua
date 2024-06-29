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
            if client.name == 'ruff_lsp' then
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
                "ruff_lsp",
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
                        settings = {
                            html = {
                                format = {
                                    templating = true,
                                    wrapLineLength = 80,
                                    wrapAttributes = "auto",
                                },
                            },
                        },
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

                ["ruff_lsp"] = function()
                    require("lspconfig").ruff_lsp.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        init_options = {
                            settings = {
                                args = {
                                    "--select=ALL",
                                    "--ignore=D100,D101,D102,D103,D104,D105,D106,D107,D203,D212",
                                    "--per-file-ignores=__init__.py:F401",
                                    "--per-file-ignores=**/tests/**/*.py:E501",
                                    "--per-file-ignores=**/tests/**/*.py:PLR2004",
                                },
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
