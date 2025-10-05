return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'kanagawa',
      component_separators = '|',
      section_separators = '',
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
          color = { bg = '#2A2A37', fg = '#FFA066' },
          draw_empty = true,
        },
      },
    },
  },
}
