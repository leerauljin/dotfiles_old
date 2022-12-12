local config = {
    profile = {
        enable = true,
        threshold = 0
    },
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    },
}

vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

local function plugins(use)
    -- core
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/impatient.nvim'

    -- dashboard
    use 'goolord/alpha-nvim'

    -- keymap manager
    use 'folke/which-key.nvim'

    -- search engine
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'folke/tokyonight.nvim'

    -- git
    use {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("neogit").setup {}
        end,
    }
    use { "github/copilot.vim", event = "BufRead" }
    use { "olimorris/persisted.nvim",
        -- module = "persisted", -- For lazy loading
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted")
        end,
    }

    -- lsp
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'williamboman/mason.nvim'
    use { 'williamboman/mason-lspconfig.nvim',
        after = "mason.nvim" }
    use { 'neovim/nvim-lspconfig',
        after = "nvim-treesitter" }

    use 'jose-elias-alvarez/null-ls.nvim'
    use { 'jayp0521/mason-null-ls.nvim',
        after = "nvim-treesitter" }

    use { 'glepnir/lspsaga.nvim',
        requires = 'neovim/nvim-lspconfig'
    }

    use {
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        config = function()
            require("fidget").setup {}
        end,
    }

    -- completion
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-path' -- nvim-cmp source for buffer words
    use 'saadparwaiz1/cmp_luasnip' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for neovim's built-in LSP

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'


    -- languages
    use 'ray-x/go.nvim'
    use 'olexsmir/gopher.nvim'

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use "dhruvasagar/vim-table-mode"
    -- Editor
    use { "tpope/vim-surround", event = "BufRead" }
    use "windwp/nvim-autopairs"

    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    }
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

    use { 'folke/trouble.nvim',
        event = "VimEnter",
        cmd = { "TroubleToggle", "Trouble" },
    }

    use { 'folke/todo-comments.nvim',
        cmd = { "TodoTrouble", "TodoTelescope" },
        config = function()
            require('todo-comments').setup()
        end,
    }

    -- ui
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'christoomey/vim-tmux-navigator'
    use 'szw/vim-maximizer'
    use 'onsails/lspkind-nvim'

    use { 'folke/zen-mode.nvim',
        cmd = "ZenMode", }

    use { 'folke/twilight.nvim',
        cmd = "Twilight",
        config = function()
            require('twilight').setup()
        end
    }

    use { 'lewis6991/gitsigns.nvim',
        event = "BufReadPre",
        wants = "plenary.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require('gitsigns').setup()
        end,
    }

    -- themes
    use 'lunarvim/horizon.nvim'
    use 'sainnhe/everforest'
    use "EdenEast/nightfox.nvim"

    if packer_bootstrap then
        require('packer').sync()
    end
end

local packer = require "packer"

packer.init(config)
packer.startup(plugins)
