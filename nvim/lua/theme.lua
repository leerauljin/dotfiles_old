local ok, _ = pcall(require, 'nightfox')
if not ok then return end

vim.cmd("colorscheme carbonfox")
