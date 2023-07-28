return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            -- this is just a helper function to make descriptive keymaps
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            -- mappings for diagnostics
            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

            nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
            nmap("gt", vim.lsp.buf.type_definition, "Type [D]efinition")

            nmap("K", vim.lsp.buf.hover, "Hover Documentation")

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                vim.lsp.buf.format()
            end, { desc = "Format current buffer with LSP" })
        end
    
        mason.setup({
            ensure_instaled = {
                "clangd",
                "rustfmt",
                "clang-format",
                "stylua",
                "selene",
            }
        })

        local servers = {
            lua_ls = {},
            rust_analyzer = {},
            emmet_ls = {},
            html = {},
            cssls = {},
            tsserver = {},
            tailwindcss = {},
        }

        mason_lspconfig.setup({
            ensure_instaled = vim.tbl_keys(servers),
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
        })
    end,
}
