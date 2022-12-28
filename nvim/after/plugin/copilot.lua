local ok, copilot = pcall(require, 'copilot')
if not ok then return end

local config = {
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = "<Tab>",
        },
    },
}

copilot.setup(config)
