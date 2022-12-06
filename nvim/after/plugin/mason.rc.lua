local ok1, mason = pcall(require, "mason")
if not ok1 then return end

mason.setup()

local ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok2 then return end

mason_lspconfig.setup {
    automatic_installation = true
}
