return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    layout = {
      max_width = { 40, 0.3 },
      default_direction = 'prefer_left',
    },
  },
}
