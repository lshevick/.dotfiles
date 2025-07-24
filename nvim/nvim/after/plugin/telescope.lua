local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
