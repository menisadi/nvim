if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  'zenbones-theme/zenbones.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.zenbones_compat = 1
    vim.g.zenbones_darken_comments = 45
  end,
}
