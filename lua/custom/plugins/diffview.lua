return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' }, -- Lazy-load on commands
  keys = {
    {
      '<leader>gd',
      function()
        if next(require('diffview.lib').views) == nil then
          vim.cmd 'DiffviewOpen'
        else
          vim.cmd 'DiffviewClose'
        end
      end,
      desc = 'Toggle Diffview',
    },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[Git] File history view' },
  },
  opts = {
    enhancbd_diff_hl = true, -- Use enhanced diff highlighting
    file_panel = {
      win_config = {
        position = 'left',
        width = 35,
      },
    },
    keymaps = {
      disable_defaults = false, -- Keep default keymaps
      view = {
        -- Add custom keymaps for diffview buffers if needed
      },
      file_panel = {
        -- Add custom keymaps for the file panel if needed
      },
    },
  },
}
