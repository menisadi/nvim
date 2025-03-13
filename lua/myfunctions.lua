function ToggleHebrewMode()
  local heb_mode = vim.b.hebrew_mode_enabled

  if heb_mode == nil or heb_mode == false then
    -- Turn Hebrew mode ON
    vim.opt_local.keymap = 'hebrew' -- Use 'hebrew' keymap for insert-mode
    vim.opt_local.iminsert = 1 -- Make sure insert mode uses the 'keymap'
    vim.opt_local.imsearch = 1 -- Same for search
    vim.opt_local.rightleft = true -- Enable right-to-left mode for this window
    vim.b.hebrew_mode_enabled = true
    vim.notify('Hebrew mode: ON', vim.log.levels.INFO)
  else
    -- Turn Hebrew mode OFF
    vim.opt_local.keymap = '' -- Clear the insert-mode keymap
    vim.opt_local.iminsert = 0
    vim.opt_local.imsearch = 0
    vim.opt_local.rightleft = false
    vim.b.hebrew_mode_enabled = false
    vim.notify('Hebrew mode: OFF', vim.log.levels.INFO)
  end
end

vim.api.nvim_create_user_command('HebrewToggle', function()
  ToggleHebrewMode()
end, {})
