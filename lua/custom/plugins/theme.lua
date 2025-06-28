return {
  {
    'catppuccin/nvim',
    name = 'catppuccin', -- Required for lazy.nvim to recognize the plugin
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato', -- Options: "latte", "frappe", "macchiato", "mocha"
        background = { -- Optional: Set background for light/dark mode
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false, -- Enable/disable transparency
        styles = { -- Customize styles (optional)
          comments = { 'italic' },
          keywords = { 'bold' },
        },
        integrations = { -- Enable integrations for plugins (optional)
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          -- Add other plugins you use
        },
      }
      -- Apply the colorscheme
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
}
