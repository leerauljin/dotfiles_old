local ok, trouble = pcall(require, "trouble")
if not ok then return end

trouble.setup {
    height = 5,
    auto_preview = false,
    signs = {
        error = "✘ ",
        warning = "▲ ",
        hint = "⚑ ",
        information = " ",
    },
    use_diagnostic_sings = false,
}
