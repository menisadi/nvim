return {
  'stevearc/oil.nvim',
  opts = {
    lsp_file_methods = {
      autosave_changes = true,
    },
  },
  keys = {
    { '<leader>O', '<cmd>Oil<cr>', desc = 'Open oil' },
    { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
