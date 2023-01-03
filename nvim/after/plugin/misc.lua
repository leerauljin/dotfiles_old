-- ui (core)
local ok, indent = pcall(require, 'indent_blankline')
if ok then indent.setup {
        show_current_context = true,
        show_current_context_start = false,
    }
end


-- editor (core)
local ok, autopairs = pcall(require, "nvim-autopairs")
if ok then autopairs.setup({
      disable_filetype = { "TelescopePrompt" , "vim" },
    })

    local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if not ok then return end

    local ok, cmp = pcall(require, "cmp")
    if not ok then return end

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end


local ok, comment = pcall(require, 'Comment')
if ok then comment.setup() end


-- editor (additional)
local ok, colorizer = pcall(require, 'colorizer')
if ok then colorizer.setup() end

local ok, fidget = pcall(require, 'fidget')
if ok then fidget.setup {
        text = {
            spinner = 'dots_snake',
            done = ''
        }
    }
end

local ok, todo = pcall(require, 'todo-comments')
if ok then todo.setup() end


-- ui (additional)
local ok, zen = pcall(require, 'true-zen')
if ok then zen.setup {
        integrations = {
            tmux = false,
            kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
                enabled = false,
                font = "+3"
            },
            lualine = true -- hide nvim-lualine (ataraxis)
        },
    }
end

local ok, saga = pcall(require, "lspsaga")
if ok then
    local config = {
        code_action_icon = "",
        code_action_lightbulb = {
            virtual_text = false
        }
    }
    saga.init_lsp_saga(config)
end

local ok, trouble = pcall(require, "trouble")
if ok then trouble.setup {
        height = 5,
        auto_preview = false,
        use_diagnostic_sings = true,
    }
end

--lang
local ok, _ = pcall(require, 'knap')
if ok then
   local knapconf = {
        delay = 100,
    }
    vim.g.knap_settings = knapconf
end

--git
local ok, gitsigns = pcall(require, 'gitsigns')
if ok then gitsigns.setup() end

local ok, neogit = pcall(require, 'neogit')
if ok then neogit.setup() end

