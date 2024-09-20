local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-gtest").setup({
		build_dir = "build",
		args = {},
		}),
	},
	quickfix = {
		enabled = false,
	},
	summary = {
		enabled = true,
		expanded_errors = true,
	},
	output = {
		enabled = true,
		open_on_rum = "short",
	},
	icons = {
		passed = "✅",
		failed = "❌",
		running = "⏲",
		skipped = "🢱",
		unknown = "❓",
	},
})
