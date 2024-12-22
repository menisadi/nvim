return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      '   (\\(\\',
      '   ( -.-)',
      '   o_(")(")',
      'Well hello again',
    }
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('SPC O', '  Open file explorer'),
      dashboard.button('SPC s f', '󰐱  Fuzzy find file'),
      dashboard.button('SPC s .', '󰋚  Recently opened files'),
      dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
    }
    dashboard.config.opts.noautocmd = true
    -- vim.cmd [[autocmd User AlphaReady echo 'ready']]

    alpha.setup(dashboard.config)
  end,
}
