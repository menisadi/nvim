-- steady block for Normal/Elsewhere
-- steady bar for LTR insert
-- steady underline for RTL insert
local guicursor_ltr = table.concat({
  'n-v-c:block', -- normal/visual/cmdline: block
  'i-ci-ve:ver25', -- insert/insert-cmd/visual-exclude: vertical bar (steady)
  'r-cr:hor20', -- replace modes: underline
  'o:hor50', -- operator-pending
}, ',')

local guicursor_rtl = table.concat({
  'n-v-c:block', -- normal/visual/cmdline: block
  'i-ci-ve:hor20', -- insert becomes underline (steady) for RTL
  'r-cr:hor20',
  'o:hor50',
}, ',')

-- Default to LTR cursor shapes
vim.o.guicursor = guicursor_ltr

local function enable_hebrew_spell()
  vim.opt_local.spelllang = { 'he', 'en_us' }
  vim.opt_local.spellcapcheck = ''
  vim.opt_local.spellsuggest = 'best,9'
end

local function enable_english_spell()
  vim.opt_local.spelllang = { 'en_us' }
  vim.opt_local.spellcapcheck = vim.api.nvim_get_option_value('spellcapcheck', { scope = 'global' })
  vim.opt_local.spellsuggest = 'best,9'
end

local function ToggleHebrewMode()
  local heb_mode = vim.b.hebrew_mode_enabled

  if not heb_mode then
    -- --- Turn Hebrew mode ON (RTL) ---
    vim.opt_local.keymap = 'hebrew'
    vim.opt_local.iminsert = 1
    vim.opt_local.imsearch = 1
    vim.opt_local.rightleft = true
    vim.b.hebrew_mode_enabled = true

    -- Switch insert cursor to steady underline
    vim.o.guicursor = guicursor_rtl

    enable_hebrew_spell()

    vim.notify('Hebrew mode: ON', vim.log.levels.INFO)
  else
    -- --- Turn Hebrew mode OFF (LTR) ---
    vim.opt_local.keymap = ''
    vim.opt_local.iminsert = 0
    vim.opt_local.imsearch = 0
    vim.opt_local.rightleft = false
    vim.b.hebrew_mode_enabled = false

    -- Switch insert cursor back to steady bar
    vim.o.guicursor = guicursor_ltr

    enable_english_spell()

    vim.notify('Hebrew mode: OFF', vim.log.levels.INFO)
  end
end

-- Expose as a user command
vim.api.nvim_create_user_command('HebrewToggle', function()
  ToggleHebrewMode()
end, {})

-- Keymap: <leader>h to toggle
vim.keymap.set('n', '<leader>hb', function()
  vim.cmd.HebrewToggle()
end, { silent = true, desc = 'Toggle Hebrew mode (RTL/LTR)' })
