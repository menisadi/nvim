-- vim.opt.statuscolumn = '%=%C%{v:relnum?v:relnum:v:lnum}%s'
vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Help nvim find python so it won't take it extra second to find it by it self
vim.g.python3_host_prog = '/Users/meni/.pyenv/versions/nvim/bin/python3'

-- Spell check
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Enable folding
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.foldminlines = 1
vim.opt.foldlevel = 99

vim.opt.splitbelow = true
