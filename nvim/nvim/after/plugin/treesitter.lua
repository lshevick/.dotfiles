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
