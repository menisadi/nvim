return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  dependencies = {
    {
      'copilotlsp-nvim/copilot-lsp',
      init = function()
        vim.g.copilot_nes_debounce = 500
      end,
    },
  },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
    },
    nes = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept_and_goto = '<M-a>',
        dismiss = '<M-d>',
      },
    },
  },
}
