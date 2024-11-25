vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Help nvim find python so it won't take it extra second to find it by it self
vim.g.python3_host_prog = '/Users/meni/.pyenv/versions/nvim/bin/python3'
