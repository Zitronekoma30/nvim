return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.files").setup()
      require("mini.pick").setup()
      require("mini.bracketed").setup()
      require("mini.statusline").setup()
      require("mini.icons").setup()
      require('mini.hues').setup({ background = '#1a1e21', foreground = '#c1ccc0', n_hues = 6 })

      -- Keymaps
      vim.keymap.set('n', '<leader>f', '<cmd>Pick files<cr>', { desc = "Find files" })
      vim.keymap.set('n', '<leader>F', '<cmd>Pick buffers<cr>', { desc = "Find files" })
      vim.keymap.set('n', '<leader>g', '<cmd>Pick grep_live<cr>', { desc = "Find files" })
      vim.keymap.set('n', '<leader>h', '<cmd>Pick help<cr>', { desc = "Find files" })
    end,
  },
}

