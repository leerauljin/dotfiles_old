local ok1, lspconfig = pcall(require, "lspconfig")
if not ok1 then return end
local ok2, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok2 then return end

local capabilities = cmp_nvim_lsp.default_capabilities()

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

local on_attach = function(client, bufnr)
    enable_format_on_save(client, bufnr)
end


lspconfig["sumneko_lua"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}

lspconfig["pyright"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}

lspconfig["gopls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig["r_language_server"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
    underline = true,
    virtual_text = false,
    -- virtual_text = {
    --     prefix = '▪'
    -- },
    update_in_insert = true,
    float = {
        source = "if_many", -- Or "if_many"
    },
}

-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
