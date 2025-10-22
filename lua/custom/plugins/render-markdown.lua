return {
  'MeanderingProgrammer/render-markdown.nvim',
  cmd = 'RenderMarkdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    { '<leader>rm', '<cmd>RenderMarkdown<cr>', desc = 'Render Markdown' },
    { '<leader>rd', '<cmd>RenderMarkdown disable<cr>', desc = 'Disable Render Markdown' },
  },
}
