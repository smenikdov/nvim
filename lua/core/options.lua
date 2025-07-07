-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

g.mapleader = " "
g.maplocalleader = "\\"
g.autoformat = false
g.omni_sql_no_default_maps = 1
g.codeium_filetypes = {
    typr = false
}

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-- g.netrw_banner = 0
-- g.netrw_browse_split = 4
-- g.netrw_winsize = 25
-- g.netrw_altv = 1
-- g.netrw_alto = 1

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
opt.wrap = false
opt.spelloptions = "camel"

-- CODEIUM (windsurf)
g.codeium_enabled = true
g.codeium_disable_bindings = 1

-- LAZYGIT
-- vim.api.nvim_create_autocmd({ "BufLeave" }, {
--     pattern = { "*lazygit*" },
--     group = vim.api.nvim_create_augroup("git_refresh_neotree", {clear = true}),
--     callback = function()
--         require("neo-tree.sources.filesystem.commands").refresh(
--             require("neo-tree.sources.manager").get_state("filesystem")
--         )
--     end,
-- })

vim.api.nvim_create_user_command("Sorti", function()
    local start_pos = vim.fn.getpos("'<")[2]
    local end_pos = vim.fn.getpos("'>")[2]
    local lines = vim.api.nvim_buf_get_lines(0, start_pos - 1, end_pos, false)
    table.sort(lines, function(a, b)
        return #a < #b
    end)
    vim.api.nvim_buf_set_lines(0, start_pos - 1, end_pos, false, lines)
end, { range = true })

vim.api.nvim_create_user_command('GenerateCtags', '!ctags -R --exclude=node_modules .', {})
vim.api.nvim_create_user_command('Aask', 'terminal aichat <args>', { nargs = '*' })
vim.api.nvim_create_user_command('Acode', 'terminal aichat --role \\%code\\% <args>', { nargs = '*' })
vim.api.nvim_create_user_command('E', 'e %:p:h/<args>', { nargs = '*' })
vim.api.nvim_create_user_command('SSH', 'e oil-ssh://<args>//', { nargs = 1 })
vim.api.nvim_create_user_command('SCP', 'e scp://<args>//', { nargs = 1 })
-- норм работает, но пока не пользуюсь, можно лучше придумать
-- vim.api.nvim_create_user_command('Rg', 'silent grep <args>', { nargs = '+' })

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.fillchars:append { vert = " " }
opt.number = true -- Show line number
opt.relativenumber = true
opt.encoding = "UTF-8"
opt.scrolloff = 10
-- opt.showmatch = true -- Highlight matching parenthesis
-- opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = "80" -- Line lenght marker at 80 columns
-- opt.splitright = true -- Vertical split to the right
-- opt.splitbelow = true -- Horizontal split to the bottom
-- opt.ignorecase = true -- Ignore case letters when search
-- opt.smartcase = true -- Ignore lowercase for the whole pattern
-- opt.linebreak = true -- Wrap on word boundary
-- opt.termguicolors = true -- Enable 24-bit RGB colors
-- opt.laststatus = 3 -- Set global statusline
vim.api.nvim_create_user_command("Sotri", function()
  -- Получаем границы визуального выделения
  local start_pos = vim.fn.getpos("'<")[2]
  local end_pos = vim.fn.getpos("'>")[2]

  -- Извлекаем строки из буфера
  local lines = vim.api.nvim_buf_get_lines(0, start_pos - 1, end_pos, false)

  -- Сортировка по длине строки
  table.sort(lines, function(a, b)
    return #a < #b
  end)

  -- Заменяем исходные строки отсортированными
  vim.api.nvim_buf_set_lines(0, start_pos - 1, end_pos, false, lines)
end, { range = true, desc = "Сортировка выделенных строк по длине" })
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
-- opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

vim.filetype.add({
    extension = {
        ['http'] = 'http',
        hbs = "html"
    },
})
