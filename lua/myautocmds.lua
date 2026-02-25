vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function()
    if vim.o.background == 'dark' then
      vim.cmd.colorscheme 'kanagawa'
    else
      vim.cmd.colorscheme 'default'
    end
    -- lualine and ibl's cached highlights need an explicit refresh
    vim.schedule(function()
      local ok, lualine = pcall(require, 'lualine')
      if ok then
        lualine.refresh { scope = 'all', place = { 'statusline', 'tabline', 'winbar' } }
      end
      local ok2, ibl = pcall(require, 'ibl')
      if ok2 then
        ibl.update()
      end
    end)
  end,
})
