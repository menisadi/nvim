return {
  'zenbones-theme/zenbones.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.bones_compat = 1
    vim.g.zenbones_darken_comments = 45
    -- vim.cmd.colorscheme 'zenwritten'
  end,
}
