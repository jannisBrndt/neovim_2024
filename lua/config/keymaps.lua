-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--Oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- Code Action
vim.api.nvim_set_keymap( "n", "<Space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap( "v", "<Space>ca", "<cmd>lus vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })

-- Debugger
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap( "n", "<F5>", "<Cmd>lua require\"dap\".continue()<CR>", opts)
vim.api.nvim_set_keymap( "n", "<F10>", "<Cmd>lua require\"dap\".step_over()<CR>", opts)
vim.api.nvim_set_keymap( "n", "<F11>", "<Cmd>lua require\"dap\".step_into()<CR>", opts)
vim.api.nvim_set_keymap( "n", "<F12>", "<Cmd>lua require\"dap\".step_out()<CR>", opts)
vim.api.nvim_set_keymap( "n", "<space>b", "<Cmd>lua require\"dap\".toggle_breakpoint()<CR>", opts)

-- Telescope
vim.api.nvim_set_keymap( "n", "<Space>ff", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>fg", "<cmd>Telescope live_grep<CR>", opts)
--vim.api.nvim_set_keymap( "n", "<Space>fb", "<cmd>Telescope buffer<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>fh", "<cmd>Telescope help_tags<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>fm", "<cmd>Telescope keymaps<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>gf", "<cmd>Telescope git_files<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>gc", "<cmd>Telescope git_commits<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>gb", "<cmd>Telescope git_branches<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>fr", "<cmd>Telescope resume<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>fd", "<cmd>Telescope diagnostics<CR>", opts)
vim.api.nvim_set_keymap( "n", "<Space>fb", "<cmd>Telescope file_browser<CR>", opts)
-- Telescope + dap
vim.api.nvim_set_keymap( "n", "<Space>dc", "<cmd>Telescope dap commands<CR>", opts )
vim.api.nvim_set_keymap( "n", "<Space>dl", "<cmd>Telescope dap list_breakpoints<CR>", opts )
vim.api.nvim_set_keymap( "n", "<Space>dv", "<cmd>Telescope dap variables<CR>", opts )
vim.api.nvim_set_keymap( "n", "<Space>df", "<cmd>Telescope dap frames<CR>", opts )

-- GTest
vim.api.nvim_set_keymap( "n", "<Space>tn", ":lua require('neotest').run.run()<CR>", opts )
vim.api.nvim_set_keymap( "n", "<Space>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts )
vim.api.nvim_set_keymap( "n", "<Space>ta", ":lua require('neotest').run.run_all()<CR>", opts )
vim.api.nvim_set_keymap( "n", "<Space>tq", ":lua require('neotest').run.stop()<CR>", opts )
vim.api.nvim_set_keymap( "n", "<Space>ts", ":lua require('neotest').summary.toggle()<CR>", opts )
vim.api.nvim_set_keymap( "n", "]t", ":lua require('neotest').jump.next({ status = 'failed' })<CR>", opts )
vim.api.nvim_set_keymap( "n", "[t", ":lua require('neotest').jump.prev({ status = 'failed' })<CR>", opts )

