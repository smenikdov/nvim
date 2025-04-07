return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  opts = {
    indent = {
      -- char = "│",
      -- tab_char = "│",
      char = "▏",
      tab_char = "▏",
      
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
    },
    exclude = { filetypes = { 'dashboard', 'spectre_panel' }}
  }
}
