-- Setup Mason
require("mason").setup()

-- 
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", }, -- add more LSP here
	automatic_installation = true,
})

-- Setup LSP handlers
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
-- 
local capabilities = require("cmp_nvim_lsp").default_capabilities()

--
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

-- Setup specific Servers

-- Lua 
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim"}
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- C++
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = util.root_pattern("compile_commands.json", ".git"),
})
