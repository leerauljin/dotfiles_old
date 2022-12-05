local status, zen = pcall(require, 'zen-mode')
if (not status) then return end

zen.setup {
    plugins = {
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        todo_comments = { enabled = false },
        tmux = { enabled = false },
    }
}
