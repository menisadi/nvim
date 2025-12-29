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
      enabled = false,
      auto_trigger = false,
      keymap = {
        accept_and_goto = false,
        dismiss = false,
      },
    },
  },
}
