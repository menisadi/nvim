return {
  'nvim-lualine/lualine.nvim',
  event = 'BufWinEnter',
  dependencies = {
    -- nvim-navic defined as a dependency of lualine.
    -- So it inherits lualine's 'event'.
    {
      'SmiteshP/nvim-navic',
      dependencies = { 'neovim/nvim-lspconfig' },
      opts = {
        lsp = {
          auto_attach = true,
        },
      },
    },
  },
  opts = {
    options = {
      icons_enabled = true,
      globalstatus = true,
    },
    tabline = {
      lualine_a = { { 'buffers', hide_filename_extension = true } },
    },
    winbar = {
      lualine_a = {
        {
          'navic',
          highlight = false,
          navic_opts = {
            separator = ' > ',
            depth_limit = 4,
          },
          draw_empty = true,
        },
      },
    },
  },
}
