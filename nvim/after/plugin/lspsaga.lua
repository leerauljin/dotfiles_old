local ok, saga = pcall(require, "lspsaga")
if not ok then return end

local config = {
    code_action_icon = "",
    code_action_lightbulb = {
        virtual_text = false
    }
}
saga.init_lsp_saga(config)
