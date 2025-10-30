vim.keymap.set('n', ']b', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', ':bprev<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>xq', vim.diagnostic.setqflist, { noremap = true, silent = true, desc = 'open Location List' })
vim.keymap.set('n', '<leader>xf', vim.diagnostic.open_float, { noremap = true, silent = true, desc = 'Open diagnostic floating window' })
