return {
  "echasnovski/mini.icons",
  opts = {
    default = {
      directory = { glyph = '' },
    },
    extension = {
      dart = { glyph = '󱐋', hl = 'MiniIconsYellow'  }, -- 
    },
    directory = {
      lib = { glyph = '', hl = 'MiniIconsBlue' },
      build = { glyph = '', hl = 'MiniIconsBlue' },
      node_modules = { glyph = '', hl = 'MiniIconsBlue' },
      src = { glyph = '', hl = 'MiniIconsBlue' },
      tests = { glyph = '', hl = 'MiniIconsBlue' },
    },
  },
  lazy = true,
  specs = {
    { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
