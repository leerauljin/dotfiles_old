local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
local status3, null_ls = pcall(require, "mason-null-ls")
if (not status3) then return end

mason.setup()

lspconfig.setup {
    automatic_installation = true
}

null_ls.setup {
    automatic_installation = true
}
