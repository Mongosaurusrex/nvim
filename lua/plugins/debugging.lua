local function setup_node_debugger()
	local dap = require("dap")

	require("dap").adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = { "/Users/mongosaurus/js-debug/src/dapDebugServer.js", "${port}" },
		},
	}

	for _, ext in ipairs({
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	}) do
		dap.configurations[ext] = {
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach Program (pwa-node, select pid)",
				cwd = "${worspaceFolder}",
				restart = true,
				processId = require("dap.utils").pick_process,
				autoAttachChildProcesses = true,
				sourceMaps = true,
				runtimeExecutable = "node",
				skipFiles = {
					"<node_internals>/**",
					"node_modules/**",
				},
			},
		}
	end
end

return {
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
		version = "1.*",
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup({})
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set("n", "<F5>", dap.continue)
			vim.keymap.set("n", "<F10>", dap.step_over)
			vim.keymap.set("n", "<F11>", dap.step_into)
			vim.keymap.set("n", "<F12>", dap.step_out)
			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint)

			setup_node_debugger()
		end,
	},
}
