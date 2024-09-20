-- This file has all the plugins

return {
	-- Load Lazy	
	{
		"folke/lazy.nvim",
		version = "*",
	},

	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	-- Autocomplete Plugins
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets"
		},
	},

	-- Linting & Formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
	},

	-- File Explorer
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup {
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
			}
			vim.keymap.set( "n", "-", "<CMD>Oil<CR>", { desc = " Open aprent directory"})
		end,
	},

	-- Nvim to Tmux navigation	
	{
		"christoomey/vim-tmux-navigator",
		vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>"),
		vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>"),
		vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>"),
		vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>"),
	},

	-- Debugger
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"folke/which-key.nvim",
		},
		config = function()
			require("config.dap")
		end,
	},
	
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter").setup{
				ensure_installed = { "lua", "cpp"},
				highlight = { enable = true}
			}
		end,
	},

	-- Autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- Git Signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns")
		end,
	},

	-- fzf
	{
		"junegunn/fzf.vim",
		dependencies = {
			{ "junegunn/fzf", build = "./install --bin" },
		},
		config = function()
			require("config.fzf")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-lua/popup.nvim",
			"BurntSushi/ripgrep",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("config.telescope")
		end,
	},

	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"alfaix/neotest-gtest",
		},
		config = function()
			require("config.neotest")
		end,
	},
}
