return {
  'olimorris/codecompanion.nvim',
  version = '^18.0.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    interactions = {
      chat = { adapter = 'copilot' },
    },

    adapters = {
      acp = {
        codex = function()
          return require('codecompanion.adapters').extend('codex', {
            defaults = {
              auth_method = 'chatgpt',
            },
            commands = {
              default = { '/Users/meni/.local/bin/codex-acp' },
            },
          })
        end,
      },
    },
  },
}
