-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>silent :Lexplore!<CR>")
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>c", "<cmd>silent :set hlsearch!<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>silent :Git blame<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>silent :sp | term<CR>")
vim.keymap.set("n", "<leader>~", "<cmd>silent :source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]])
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>1", '1gt')
vim.keymap.set("n", "<leader>2", '2gt')
vim.keymap.set("n", "<leader>3", '3gt')
vim.keymap.set("n", "<leader>4", '4gt')
vim.keymap.set("n", "<leader>5", '5gt')
vim.keymap.set("n", "<leader>6", '6gt')
vim.keymap.set("n", "<leader>7", '7gt')
vim.keymap.set("n", "<leader>8", '8gt')
vim.keymap.set("n", "<leader>9", '9gt')
vim.keymap.set("n", "<leader>0", ':tablast<cr>')

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>k", "<cmd>silent :copen<CR>ctrl-w j")
vim.keymap.set("n", "<leader>h", "<cmd>silent :cclose<CR>")
vim.keymap.set("n", "<leader>[", "<cmd>silent :cprev<CR>")
vim.keymap.set("n", "<leader>]", "<cmd>silent :cnext<CR>")

vim.keymap.set("n", "<leader>y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<F2>", "<cmd>silent :set syntax=on<CR>")
vim.keymap.set("n", "<F3>", "<cmd>silent :set syntax=off<CR>")

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.signcolumn = 'yes'

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
-- vim.opt.scrolloff = 8

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
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
		'nvim-telescope/telescope.nvim',
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
        branch = 'main',
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
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
		'hrsh7th/cmp-cmdline'
	},
	{
		'hrsh7th/cmp-buffer'
	},
	{
		'kevinhwang91/nvim-bqf'
	},
	{
		"mason-org/mason.nvim",
	},
    {
        "mason-org/mason-lspconfig.nvim",
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
        keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
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
    {
        "rcarriga/nvim-notify",
        lazy = false,
        opts = {}
    },

  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 20

local function escape_pattern(text)
    return text:gsub("([^%w])", "%%%1")
end

function SaveStage()
    local local_file = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%")
    local local_dir = vim.fn.getcwd()
    local remote = "lshevick@192.168.109.21"
    local admin_remote_base_dir = "/var/www/stage/IncentRev-Admin"
    local web_remote_base_dir = "/var/www/stage/IncentRev-Web"
    local hoh_remote_base_dir = "/var/www/halfoffhelp"
    local remote_file = ''
    local_dir = escape_pattern(local_dir)

    if string.find(local_dir, "Admin") then
        remote_file = string.gsub(local_file, local_dir, admin_remote_base_dir)
    elseif string.find(local_dir, "Web") then
        remote_file = string.gsub(local_file, local_dir, web_remote_base_dir)
    elseif string.find(local_dir, "halfoffhelp") then
        remote_file = string.gsub(local_file, local_dir, hoh_remote_base_dir)
    else
        vim.notify('Not in correct directory.')
        return
    end
--    Construct the SCP command
    local scp_command = string.format("scp %s %s:%s", vim.fn.shellescape(local_file), remote, remote_file)

    -- Execute the SCP command

        os.execute(scp_command)
        vim.notify('File Uploaded')
end

function SaveLocal()
    local local_file = vim.fn.expand("%:p")
    local local_dir = vim.fn.getcwd()
    local remote = "lshevick@192.168.1.15"
    local admin_remote_base_dir = "/var/www/IncentRev-Admin-01"
    local web_remote_base_dir = "/var/www/IncentRev-Web"
    local remote_file = ''
    local_dir = escape_pattern(local_dir)

    if string.find(local_dir, "Admin") then
        remote_file = string.gsub(local_file, local_dir, admin_remote_base_dir)
    elseif string.find(local_dir, "Web") then
        remote_file = string.gsub(local_file, local_dir, web_remote_base_dir)
    else
        vim.notify('Not in correct directory.')
        return
    end

    -- Construct the SCP command
    local scp_command = string.format("scp %s %s:%s", vim.fn.shellescape(local_file), remote, remote_file)

    -- Execute the SCP command
    os.execute(scp_command)
    vim.notify('File Uploaded')
end

vim.keymap.set("n", "<leader>g", "<cmd>silent :w | lua SaveStage()<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>silent :w | lua SaveLocal()<CR>")
vim.keymap.set("n", "S", ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>")
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.api.nvim_create_autocmd({"TermOpen", "WinEnter"}, {
    pattern = "term://*",
    command = "startinsert",
})

-- Autoclose Setup
require("autoclose").setup()

-- LSP Setup
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_vscode').load({paths = {'~/.config/nvim/snippets'}})
require('luasnip').filetype_extend("blade", {'html', 'css', 'javascript'})
require('luasnip').filetype_extend("php", {'html', 'css', 'javascript'})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'eslint', 'html', 'phpactor', 'tailwindcss'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
          capabilities = capabilities
      })
    end,

  },
})

    vim.diagnostic.config({
        virtual_text = true,
        float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        signs = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
        },
    })

vim.keymap.set("n", "gl", function ()
    vim.diagnostic.open_float({scope = 'cursor'})
end
)



     -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

cmp.setup({
    sources = cmp.config.sources({
        {name = 'luasnip'},
        {name = 'nvim_lsp'},
        {name = 'buffer'}
    }
    ),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
      },
   ['<CR>'] = cmp.mapping(function(fallback)
       local luasnip = require('luasnip')
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
         local luasnip = require('luasnip')
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item({behavior = 'select'})
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
       local luasnip = require('luasnip')
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  }),
  window = {
    documentation = cmp.config.window.bordered(),
  },
})

local isLspDiagnosticsVisible = true
vim.keymap.set("n", "glx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    }) end)

-- Notify Setup
local notify = require("notify")
vim.notify = notify
print = function(...)
    local print_safe_args = {}
    local _ = { ... }
    for i = 1, #_ do
        table.insert(print_safe_args, tostring(_[i]))
    end
    notify(table.concat(print_safe_args, ' '), "info")
end
notify.setup()

-- telescope setup
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

-- Treesitter setup
require('nvim-treesitter').setup {}
local parsers = {
    "bash",
    "c",
    "diff",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "printf",
    "query",
    "regex",
    "toml",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
    "php",
    "php_only",
    "blade",
    "css",
}
require('nvim-treesitter').install(parsers)

require('nvim-ts-autotag').setup({
    aliases = {
        ["blade"] = "html"
    }
})

vim.api.nvim_create_autocmd('FileType', {
        pattern = parsers,
        callback = function()
          vim.treesitter.start()
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

