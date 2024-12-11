---@param config {type?:string, args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {} --[[@as string[] | string ]]
	local args_str = type(args) == "table" and table.concat(args, " ") or args --[[@as string]]

	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str)) --[[@as string]]
		if config.type and config.type == "java" then
			---@diagnostic disable-next-line: return-type-mismatch
			return new_args
		end
		return require("dap.utils").splitstr(new_args)
	end
	return config
end

return {

	{
		"mfussenegger/nvim-dap",
		recommended = true,

		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williomboman/mason.nvim",
		},

		keys = {
			{ "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
			-- {
			-- 	"<leader>dB",
			-- 	function()
			-- 		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			-- 	end,
			-- 	desc = "Breakpoint Condition",
			-- },
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Run/Continue",
			},
			-- {
			-- 	"<leader>da",
			-- 	function()
			-- 		require("dap").continue({ before = get_args })
			-- 	end,
			-- 	desc = "Run with Args",
			-- },
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},
			-- {
			-- 	"<leader>dg",
			-- 	function()
			-- 		require("dap").goto_()
			-- 	end,
			-- 	desc = "Go to Line (No Execute)",
			-- },
			-- {
			-- 	"<leader>di",
			-- 	function()
			-- 		require("dap").step_into()
			-- 	end,
			-- 	desc = "Step Into",
			-- },
			-- {
			-- 	"<leader>dj",
			-- 	function()
			-- 		require("dap").down()
			-- 	end,
			-- 	desc = "Down",
			-- },
			-- {
			-- 	"<leader>dk",
			-- 	function()
			-- 		require("dap").up()
			-- 	end,
			-- 	desc = "Up",
			-- },
			-- {
			-- 	"<leader>dl",
			-- 	function()
			-- 		require("dap").run_last()
			-- 	end,
			-- 	desc = "Run Last",
			-- },
			-- {
			-- 	"<leader>do",
			-- 	function()
			-- 		require("dap").step_out()
			-- 	end,
			-- 	desc = "Step Out",
			-- },
			-- {
			-- 	"<leader>dO",
			-- 	function()
			-- 		require("dap").step_over()
			-- 	end,
			-- 	desc = "Step Over",
			-- },
			-- {
			-- 	"<leader>dp",
			-- 	function()
			-- 		require("dap").pause()
			-- 	end,
			-- 	desc = "Pause",
			-- },
			-- {
			-- 	"<leader>dr",
			-- 	function()
			-- 		require("dap").repl.toggle()
			-- 	end,
			-- 	desc = "Toggle REPL",
			-- },
			-- {
			-- 	"<leader>ds",
			-- 	function()
			-- 		require("dap").session()
			-- 	end,
			-- 	desc = "Session",
			-- },
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			-- {
			-- 	"<leader>dw",
			-- 	function()
			-- 		require("dap.ui.widgets").hover()
			-- 	end,
			-- 	desc = "Widgets",
			-- },
		},

		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

			require("nvim-dap-virtual-text").setup({
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
