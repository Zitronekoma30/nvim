-- Create a group for autocmds
local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", {})

-- listen for any LSP attaching
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(args)
        local bufnr = args.buf

        -- Keymaps local to this buffer
        vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, { buffer = bufnr, desc = "Open Diagnostic Float" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
    end
})

-- List of servers
local servers = { "pyright", "lua_ls", "rust_analyzer" }

for _, server in ipairs(servers) do
    vim.lsp.config(server, {})  -- minimal config
end

vim.lsp.enable(servers)  -- activate all servers

