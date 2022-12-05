local M = {}

function M.setup()

    local packer_bootstrap = false

    local status, packer = pcall(require, "packer")
    if not status then
        print("Packer is not installed")
        return
    end

    local config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    }
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
            vim.cmd [[packadd packer.nvim]]
        end
    end

    local function plugins(use)
        -- Core
        use 'wbthomason/packer.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'lewis6991/impatient.nvim'

        -- LSP
        use 'neovim/nvim-lspconfig' -- LSP
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'

        use 'hrsh7th/nvim-cmp' -- Completion
        use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
        use 'hrsh7th/cmp-path' -- nvim-cmp source for buffer words
        use 'saadparwaiz1/cmp_luasnip' -- nvim-cmp source for buffer words
        use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
        use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for neovim's built-in LSP

        use 'L3MON4D3/LuaSnip'
        use 'rafamadriz/friendly-snippets'

        use 'jose-elias-alvarez/null-ls.nvim'
        use 'jayp0521/mason-null-ls.nvim'

        use 'glepnir/lspsaga.nvim' -- LSP UIs
        -- use 'vonheikemen/lsp-zero.nvim'

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        }
        -- Language specific
        use 'ray-x/go.nvim'
        use 'olexsmir/gopher.nvim'

        -- Editor
        use { 'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end,
        }
        use 'tpope/vim-surround'
        use 'windwp/nvim-autopairs'
        use 'lukas-reineke/indent-blankline.nvim'
        use { 'ggandor/leap.nvim',
            config = function()
                require('leap').add_default_mappings()
            end,
        }
        use { 'norcalli/nvim-colorizer.lua',
            config = function()
                require('colorizer').setup()
            end,
        }
        use 'github/copilot.vim'

        use { 'folke/trouble.nvim',
            config = function()
                require('trouble').setup()
            end,
        }

        use { 'folke/todo-comments.nvim',
            config = function()
                require('todo-comments').setup()
            end,
        }

        -- UI
        use { 'lewis6991/gitsigns.nvim',
            event = "BufReadPre",
            wants = "plenary.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require('gitsigns').setup()
            end,
        }
        use 'dinhhuy258/git.nvim'
        use 'nvim-lualine/lualine.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use { 'goolord/alpha-nvim',
            config = function()
                require('alpha').setup(require('alpha.themes.startify').config)
            end,
        }
        use 'nvim-tree/nvim-tree.lua'
        use 'christoomey/vim-tmux-navigator' -- tmux & split window navigation
        use 'szw/vim-maximizer' -- maximizes and restores current window
        use 'onsails/lspkind-nvim' -- vscode-like pictograms

        use 'folke/zen-mode.nvim'
        use { 'folke/twilight.nvim',
            config = function()
                require('twilight').setup { plugins = { twilight = { enabled = true } } }
            end
        }

        -- use 'romgrk/barbar.nvim'

        use 'folke/which-key.nvim'

        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'
        use 'nvim-telescope/telescope-ui-select.nvim'

        use 'lunarvim/horizon.nvim'

        if packer_bootstrap then
            require('packer').sync()
        end
    end

    packer_init()

    local packer = require "packer"
    packer.init(config)
    packer.startup(plugins)
end

return M
