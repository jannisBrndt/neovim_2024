-- Adapter configurations for gdb
local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/jannis/.vscode/extensions/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

-- add more configurations
dap.configurations.cpp = {
	{
		name = "Launch File",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "Enable GDB pretty printing",
				ignoreFailures = false,
			},
		},
	},
}

local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup()

vim.fn.sign_define("DapBreakpoint", {text = "🛑", texthl = "", linehl = "", numhl = ""})

-- Virtual Dap setup
require("nvim-dap-virtual-text").setup({
	enable = true,
	enable_commands = false,
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = true,
	commented = false,
	only_first_definition = true,
	all_references = false,
	filter_references_pattern = "<module>",
	virt_text_pos = "eol",
	virt_lines = false,
	virt_text_win_col = nil
})

table.insert(dap.configurations.cpp, {
	name = "Debug Test",
	type = "cppdbg",
	request = "launch",
	program = function()
		return vim.fn.getcwd() .. "/build/bin/runTests"
	end,
	cwd = "${workspaceFolder}",
	stopAtEntry = false,
	args = {},
	env = function()
		return {}
	end,
	setupCommands = {
		{
			description = "Enable pretty-printing for gdb",
			text = "-enable-pretty-printing",
			ignoreFailures = false,
		},
	},
})
