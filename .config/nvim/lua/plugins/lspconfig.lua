return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        -- Snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, {
                    buffer = bufnr,
                    desc = desc,
                })
            end

            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

            nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

            nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

            nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

            nmap("gt", vim.lsp.buf.type_definition, "Type [D]efinition")

            nmap("K", vim.lsp.buf.hover, "Hover Documentation")

            nmap("<leader>fm", "<cmd>Format<cr>", "Format current file")

            -- Create a command `:Format` local to the LSP buffer

            vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                vim.lsp.buf.format()
            end, { desc = "Format current buffer with LSP" })
        end

        -- capabillities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local lspconfig = require("lspconfig")

        -- server configurations
        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            -- added to surpress `undefined global 'vim'` warning
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        lspconfig.zls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.tsserver.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.bashls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
}
