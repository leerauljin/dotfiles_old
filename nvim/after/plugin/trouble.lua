local ok, trouble = pcall(require, "trouble")
if not ok then return end

trouble.setup {
    height = 5,
    auto_preview = false,
    use_diagnostic_sings = true,
}
