return {
	{
		'sainnhe/sonokai',
		lazy = true,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.sonokai_style = "espresso"
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_better_performance = 1
			-- vim.cmd.colorscheme('sonokai')
		end
	},
    {
		'https://gitlab.com/__tpb/monokai-pro.nvim',
		lazy = true,
		config = function()
            vim.g.monokaipro_filter = "ristretto"
            vim.g.monokaipro_italic_functions = true
            vim.g.monokaipro_flat_term = true
        end

    },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
        config = function ()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_foreground = 'original'
            vim.g.gruvbox_material_foreground = 'medium'
            vim.cmd.colorscheme('gruvbox-material')
        end
	},
	{
		"kepano/flexoki-neovim",
		lazy = true,
        name = 'flexoki'
	},
    {
        "rebelot/kanagawa.nvim",
        lazy = true
    },
    {
        "ribru17/bamboo.nvim",
        lazy = true,
    },
    {
        "savq/melange-nvim",
        lazy = true
    },
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"mbbill/undotree",
		lazy = false,
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"tpope/vim-commentary",
		lazy = false,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			icons_enabled = true,
			theme = 'auto',
		}
	},
	{
		"EmranMR/tree-sitter-blade",
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
	},
	{
		'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'
	},
	{
		'neovim/nvim-lspconfig',
	},
    {
        'j-hui/fidget.nvim',
        opts = {}
    },
	{
		'hrsh7th/cmp-nvim-lsp'
	},
	{
		'hrsh7th/nvim-cmp'
	},
	{
		'hrsh7th/cmp-buffer'
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	-- {
	-- 	"theprimeagen/harpoon",
	-- 	lazy = false,
        -- opts = {}
	-- },
	{
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
        opts = {}
	},
    -- {
    --    "mattn/emmet-vim",
    --    lazy = false,
    -- },
    {
       "m4xshen/autoclose.nvim",
       lazy = false,
       opts = {}
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        opts = {}
    },
    {
        "folke/trouble.nvim",
        lazy = false,
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
    },
        {
            "L3MON4D3/LuaSnip",
            lazy = false,
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            dependencies = { "rafamadriz/friendly-snippets" },
            build = "make install_jsregexp",
    },
    {
        "saadparwaiz1/cmp_luasnip",
        lazy = false,
    },
}
