require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
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

  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = {'php', 'blade'},
  },
  indent = {
      enable = false
  }
}
require('nvim-ts-autotag').setup({
    aliases = {
        ["blade"] = "html"
    }
})
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
    },
    filetype = "blade"
}

-- Filetypes --
vim.filetype.add({
    pattern = {
        ['.*%.blade%.php'] = 'blade',
    },
})

local bladeGrp vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"} , {
	pattern = "*.blade.php",
	group = bladeGrp,
	callback = function()
		vim.opt.filetype = "blade"
	end,
})

