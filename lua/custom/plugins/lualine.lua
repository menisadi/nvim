return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
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
          highlight = true,
          navic_opts = {
            separator = ' > ',
            depth_limit = 4,
          },
        },
      },
    },
  },
}
