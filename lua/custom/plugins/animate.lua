return {
  'echasnovski/mini.animate',
  version = '*',
  -- this plugin seems to cause problems with some commands
  -- so for now it is disabled
  cond = false,
  -- cond = function()
  --   return not vim.g.neovide
  -- end,
  opts = {},
}
