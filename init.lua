-- bootstrap lazy.nvim, LazyVim and your plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load all plugins
require("lazy").setup("plugins")

-- load basic configs
require("config.keymaps")
require("config.options")
require("config.autocmds")

-- load plugin configurations
require("config.lsp")
require("config.cmp")
require("config.autopairs")
require("config.dap")

vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.api.nvim_set_option("clipboard", "unnamedplus")
