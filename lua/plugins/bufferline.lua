return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp", -- Интеграция с LSP для отображения ошибок
			show_buffer_close_icons = false,
			show_close_icon = false,
			close_command = "CloseBuffer",
		},
	},
}
