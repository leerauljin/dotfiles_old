local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed {
    'sumneko_lua',
    'pyright'
}

lsp.configure('sumneko_lua', {
    settings = {
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
    }
})

lsp.configure('pyright', {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
})

local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- ["<C-;>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local function cmp_border(hl_name)
    return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
    }
end

lsp.setup_nvim_cmp({
    documentation = {
        border = cmp_border "CmpDocBorder",
    },
    mapping = cmp_mappings,
    -- VS Code style (icon first)
    formatting = {
        format = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 }),
    },
})

lsp.setup()


local signs = { Error = "✘ ", Warn = "▲ ", Hint = "⚑ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


vim.diagnostic.config {
    underline = true,
    virtual_text = {
        prefix = '▪',
        severity = { min = vim.diagnostic.severity.WARN }
    },
    update_in_insert = true,
    float = {
        source = "if_many", -- Or "if_many"
    },
}
