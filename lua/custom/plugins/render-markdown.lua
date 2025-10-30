return {
  'MeanderingProgrammer/render-markdown.nvim',
  cmd = 'RenderMarkdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    {
      '<leader>rt',
      function()
        require('render-markdown').buf_toggle()
      end,
      desc = '[R]ender MD: [T]oggle (buffer)',
    },
    {
      '<leader>rd',
      function()
        require('render-markdown').buf_enable()
      end,
      desc = '[R]en[d]er MD: Enable (buffer)',
    },
    {
      '<leader>rD',
      function()
        require('render-markdown').buf_disable()
      end,
      desc = '[R]ender MD: [D]isable (buffer)',
    },
    {
      '<leader>rp',
      function()
        require('render-markdown').preview()
      end,
      desc = '[R]ender MD: [P]review split',
    },
  },
}
