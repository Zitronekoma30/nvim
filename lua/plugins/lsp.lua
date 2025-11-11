return {
	-- Mason: manages external tools
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-LSPConfig: bridges Mason and nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				print("LSP attached:", client.name)
				-- You should move on_attach keymaps/setup into an LspAttach autocommand
				-- for the best practice, but for a direct migration, keep the logic here.
			end

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
				-- mason-lspconfig now automatically enables installed LSPs by default
				-- (using vim.lsp.enable()), so no setup_handlers is needed.
				-- If you want to configure which servers are auto-enabled, you can use
				-- `automatic_enable = { ... }` here.
			})

			--- Common configuration for ALL LSPs ---
			vim.lsp.config('*', {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			--- Specific configuration for 'pyright' ---
			vim.lsp.config('pyright', {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})

			-- NOTE: For servers that mason-lspconfig installs, you might not
			-- need the vim.lsp.config('server') call if it only contains
			-- `capabilities` and `on_attach` (as those are handled by `*`).
			-- You only need the specific call for custom settings, like for pyright.


			-- Source - https://stackoverflow.com/a
			-- Posted by Brotify Force, modified by community. See post 'Timeline' for change history
			-- Retrieved 2025-11-11, License - CC BY-SA 4.0

			vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
				{ noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
				{ noremap = true, silent = true })
		end,
	},

	-- Core LSP support
	{ "neovim/nvim-lspconfig" },

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
	},
}
