local status, term = pcall(require, "nvterm")
if (not status) then return end

term.setup()
