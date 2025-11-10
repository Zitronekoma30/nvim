-- =========================
-- Neovim core settings
-- =========================
vim.g.mapleader = " "          -- Leader key
vim.opt.number = true           -- Absolute line number for current line
vim.opt.relativenumber = true   -- Relative line numbers for other lines
vim.opt.signcolumn = "yes"      -- Always show sign column
vim.opt.cursorline = true       -- Highlight current line
vim.opt.termguicolors = true    -- Enable true color support
vim.opt.splitright = true       -- Vertical splits to the right
vim.opt.splitbelow = true       -- Horizontal splits below
vim.opt.ignorecase = true       -- Ignore case in search
vim.opt.smartcase = true        -- Unless uppercase used
vim.opt.lazyredraw = true       -- Faster redraw while typing
vim.opt.mouse = "a"             -- Enable mouse support
vim.opt.undofile = true         -- Persistent undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

require("config.lazy")

-- =========================
-- Keymaps
-- =========================
local keymap = vim.keymap.set

-- 1️⃣ :norm mappings
keymap('n', '<leader>n', [[:norm ]], { desc = "Start :norm command" })
keymap('v', '<leader>n', [[:'<,'>norm ]], { desc = "Start :norm on selection" })

-- 2️⃣ Reload config
keymap('n', '<leader>r', function()
  vim.cmd('source $MYVIMRC')
  print("Config reloaded!")
end, { desc = "Reload Neovim config" })

-- Optional: Reload Lua modules (for modular configs)
keymap('n', '<leader>R', function()
  for name,_ in pairs(package.loaded) do
    if name:match('^config') then
      package.loaded[name] = nil
    end
  end
  require("config.lazy")  -- adjust to your main Lua config
  print("Lua config reloaded!")
end, { desc = "Reload Lua config modules" })

-- 4️⃣ Quick save & quit
keymap('n', '<leader>w', ':w<CR>', { desc = "Save file" })
keymap('n', '<leader>q', ':q<CR>', { desc = "Quit" })
