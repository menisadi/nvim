return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = true,
  opts = {
    adapters = {
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          env = {
            api_key = vim.env.ANTHROPIC_API_KEY,
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
      },
      inline = {
        adapter = 'anthropic',
      },
    },
  },
}
