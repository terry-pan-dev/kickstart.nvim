return {
  {
    'akinsho/toggleterm.nvim',
    version = '*', -- Use latest version
    config = function()
      require('toggleterm').setup {
        size = 100, -- Height for horizontal split, adjust as needed
        open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl-\
        hide_numbers = true, -- Hide line numbers in terminal
        shade_terminals = true, -- Slight shading for better visibility
        shading_factor = 2, -- Adjust shading intensity
        start_in_insert = true, -- Start in insert (terminal) mode
        insert_mappings = true, -- Apply mappings in insert mode
        terminal_mappings = true, -- Apply mappings in terminal mode
        persist_size = true, -- Remember split size
        direction = 'float', -- Options: "horizontal", "vertical", "float"
        close_on_exit = true, -- Close terminal when process exits
        shell = vim.o.shell, -- Use default shell (e.g., bash, zsh)
        float_opts = {
          border = 'curved', -- Border style for floating window
          winblend = 0, -- Transparency (0 = opaque)
          highlights = {
            border = 'Normal',
            background = 'Normal',
          },
        },
      }

      -- Custom keymaps for terminal mode navigation
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = 'term://*',
        callback = function()
          local opts = { buffer = 0, noremap = true, silent = true }
          -- Exit terminal mode to normal mode
          vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
          -- Navigate between windows (terminal and others)
          vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts) -- Move left
          vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts) -- Move down
          vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts) -- Move up
          vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts) -- Move right
        end,
      })
    end,
  },
}
