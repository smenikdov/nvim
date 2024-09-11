return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false, show_start = false, show_end = false },
        exclude = { filetypes = { 'dashboard' } },
	},
}
