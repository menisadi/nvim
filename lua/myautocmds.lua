vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function()
    if vim.o.background == 'dark' then
      vim.cmd.colorscheme 'kanagawa'
    else
      vim.cmd.colorscheme 'default'
    end
  end,
})
