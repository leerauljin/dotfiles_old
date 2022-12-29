local ok, lsp = pcall(require, 'lsp-zero')
if not ok then return end

local kind_symbols = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local function get_symbol(kind)
    local symbol = kind_symbols[kind]
    return symbol or ""
end

local lua_config = {
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
}

local py_config = {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    }
}

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-e>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil,
})

local nvim_cmp_conf = {
    documentation = {
        border = "solid",
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    },
    mapping = cmp_mappings,
    -- VS Code style (icon first)
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", get_symbol(vim_item.kind), vim_item.kind)
            return vim_item
        end,
    },
}

local lsp_pref = {
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
}

lsp.preset('recommended')
lsp.ensure_installed {
    'sumneko_lua',
    'pyright'
}

lsp.configure('sumneko_lua', lua_config)
lsp.configure('pyright', py_config)

lsp.set_preferences(lsp_pref)
lsp.setup_nvim_cmp(nvim_cmp_conf)

lsp.setup()

vim.diagnostic.config {
    virtual_text = {
        prefix = '▪',
        severity = { min = vim.diagnostic.severity.WARN }
    },
    update_in_insert = true,
    float = {
        source = "if_many",
    },
}
