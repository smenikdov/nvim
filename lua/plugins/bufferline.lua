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
      separator_style = "slant",
      color_icons = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "VDELO.DEV",
          text_align = "right",
          separator = true,
        },
      },
		},
	},
}
