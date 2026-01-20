return {
  'TheNoeTrevino/haunt.nvim',

  init = function()
    local haunt = require 'haunt.api'
    local haunt_picker = require 'haunt.picker'
    local map = vim.keymap.set
    local prefix = '<leader>h'

    -- annotations
    map('n', prefix .. 'a', function()
      haunt.annotate()
    end, { desc = 'Annotate' })

    map('n', prefix .. 't', function()
      haunt.toggle_annotation()
    end, { desc = 'Toggle annotation' })

    map('n', prefix .. 'T', function()
      haunt.toggle_all_lines()
    end, { desc = 'Toggle all annotations' })

    map('n', prefix .. 'd', function()
      haunt.delete()
    end, { desc = 'Delete bookmark' })

    map('n', prefix .. 'C', function()
      haunt.clear_all()
    end, { desc = 'Delete all bookmarks' })

    -- move
    map('n', prefix .. 'p', function()
      haunt.prev()
    end, { desc = 'Previous bookmark' })

    map('n', prefix .. 'n', function()
      haunt.next()
    end, { desc = 'Next bookmark' })

    -- picker
    map('n', prefix .. 'l', function()
      haunt_picker.show()
    end, { desc = 'Show Picker' })
  end,

  config = function()
    vim.api.nvim_create_user_command('HauntQuickfix', function(opts)
      local haunt_sk = require 'haunt.sidekick'
      local loc_text = haunt_sk.get_locations { current_buffer = opts.bang } or ''
      local cwd = vim.fn.getcwd()

      local items = {}
      for line in loc_text:gmatch '[^\n]+' do
        -- Expected format: - @/{path} :L{line} - "{note}"
        local path, lnum, note = line:match '@/(.-)%s+:L(%d+)%s+%-%s+"(.*)"'
        if path and lnum then
          local filename = path
          if not filename:match '^/' then
            filename = cwd .. '/' .. filename
          end
          table.insert(items, {
            filename = filename,
            lnum = tonumber(lnum),
            col = 1,
            text = note or 'Haunt annotation',
          })
        end
      end

      vim.fn.setqflist({}, ' ', {
        title = opts.bang and 'Haunt (buffer)' or 'Haunt',
        items = items,
      })
      vim.cmd 'copen'
    end, {
      desc = 'Populate quickfix with haunt.nvim annotations (! = current buffer only)',
      bang = true,
    })

    -- optional: keymaps
    vim.keymap.set('n', '<leader>hq', '<cmd>HauntQuickfix<cr>', { desc = 'Haunt -> Quickfix' })
    vim.keymap.set('n', '<leader>hQ', '<cmd>HauntQuickfix!<cr>', { desc = 'Haunt -> Quickfix (buffer)' })
  end,
}
