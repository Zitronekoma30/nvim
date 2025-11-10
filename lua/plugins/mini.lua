return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.files").setup()
      require("mini.pick").setup()
      require("mini.bracketed").setup()
      require("mini.statusline").setup()
      require("mini.icons").setup()

      -- Keymap for Pick files
      vim.keymap.set('n', '<leader>f', '<cmd>Pick files<cr>', { desc = "Find files" })
    end,
  },
}

