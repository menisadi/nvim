vim.keymap.set('n', ']b', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>co', '<cmd>AerialToggle<CR>')

-- vim.keymap.set('i', '<Tab>', function()
--   return vim.fn.pumvisible() == 1 and '<C-y>' or '<Tab>'
-- end, { expr = true })
-- vim.keymap.set('i', '<Tab>', '<C-y>', { expr = true, noremap = true, silent = true })
