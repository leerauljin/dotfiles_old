local ok, alpha = pcall(require, "alpha")
if not ok then return end

alpha.setup(require('alpha.themes.startify').config)
