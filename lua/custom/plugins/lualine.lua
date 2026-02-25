local function hebrew_mode_indicator()
  if vim.b.hebrew_mode_enabled then
    return 'א'
  end
  return ''
end

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
      -- theme = 'kanagawa',
      globalstatus = true,
    },
    tabline = {
      lualine_a = { { 'buffers', hide_filename_extension = true } },
      lualine_z = {
        {
          hebrew_mode_indicator,
        },
      },
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
          -- color = { bg = '#2A2A37', fg = '#FFA066' },
          draw_empty = true,
        },
      },
    },
  },
}
