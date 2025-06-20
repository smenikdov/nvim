return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 15,
			direction = "float",
			hide_numbers = false, -- hide the number column in toggleterm buffers
			close_on_exit = true,
			auto_scroll = false, -- automatically scroll to the bottom on terminal output
			start_in_insert = true,
			float_opts = {
				border = "curved",
			},
			on_open = function()
				vim.cmd("setlocal nonumber norelativenumber")
			end,
		},
	},
}
