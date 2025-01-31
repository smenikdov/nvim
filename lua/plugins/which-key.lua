return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	tag = "stable",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		local lang = require("scripts.language")
		local oil = require("oil")
        local harpoon = require("harpoon")
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

		-- <M is alt!!!!

		-- AI
		-- vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-x>', function () return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-]>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-[>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<M-a>', function () return vim.fn['codeium#Complete'] end, { expr = true, silent = true })

		-- Increment and decrement
		vim.keymap.set("n", "<C-a>", function()
			require("dial.map").manipulate("increment", "normal")
		end)
		vim.keymap.set("n", "<C-x>", function()
			require("dial.map").manipulate("decrement", "normal")
		end)
		vim.keymap.set("n", "g<C-a>", function()
			require("dial.map").manipulate("increment", "gnormal")
		end)
		vim.keymap.set("n", "g<C-x>", function()
			require("dial.map").manipulate("decrement", "gnormal")
		end)
		vim.keymap.set("v", "<C-a>", function()
			require("dial.map").manipulate("increment", "visual")
		end)
		vim.keymap.set("v", "<C-x>", function()
			require("dial.map").manipulate("decrement", "visual")
		end)
		vim.keymap.set("v", "g<C-a>", function()
			require("dial.map").manipulate("increment", "gvisual")
		end)
		vim.keymap.set("v", "g<C-x>", function()
			require("dial.map").manipulate("decrement", "gvisual")
		end)

		-- Snippets
		vim.keymap.set("i", "<C-l>", function()
			return require("luasnip").jump(1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-j>", function()
			return require("luasnip").jump(-1)
		end, { expr = true, silent = true })

		-- Language
		vim.keymap.set("i", "<C-l>", function()
			return lang.toggle_language_i()
		end, { expr = true, silent = true })
		vim.keymap.set("n", "<C-l>", function()
			return lang.toggle_language_n()
		end, { expr = true, silent = true })
		vim.keymap.set("c", "<C-l>", function()
			return lang.toggle_language_c()
		end, { expr = true, silent = true })
		vim.keymap.set("v", "<C-l>", function() end, { expr = true, silent = true })

		wk.setup(opts.setup)
		wk.add({
			{ "<Esc>", ":noh<CR>", hidden = true },
			{ "<C-s>", "<Esc>:w<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Save" },
			-- { "<C-q>", "<Esc>:q<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Close" },
			-- { "<C-a>", "ggVG", hidden = true, desc = "Select all" },
			{ "<Esc>", "<C-\\><C-n>", mode = "t", hidden = true, desc = "Quit terminal emulator" },

			{
				"<C-\\>",
				"<C-\\><C-n>:ToggleTerm<CR>",
				mode = "t",
				hidden = true,
				desc = "Terminal Close",
			},
			{
				"<C-\\>",
				":ToggleTerm<CR>",
				hidden = true,
				desc = "Terminal Toggle",
			},

			{ "<leader><leader>", ":Telescope find_files<CR>", desc = "Find File", hidden = true },
			{ "<leader>/", ":Telescope live_grep<CR>", desc = "Find Text", hidden = true },
			{ "<leader>q", ":CloseBuffer<CR>", desc = "Close Buffer", hidden = true },
			{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle tree", hidden = true },

			{ "<leader>f", group = "Find" },
			{ "<leader>ff", "yiw:Telescope find_files<CR><C-r>0<Esc>", desc = "Find File" },
			{ "<leader>ft", "yiw:Telescope live_grep<CR><C-r>0<Esc>", desc = "Find Text" },
			-- { "<leader>ff",       ":SmartFind<CR>",                       desc = "Find" },
			{ "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffer" },
			{ "<leader>fh", ":Telescope help_tags<CR>", desc = "Find Help" },
			{ "<leader>fc", ":Telescope git_commits<CR>", desc = "Find Commit" },
			-- { "<leader>fp", ":Telescope projects<CR>", desc = "Find Projects" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gr", ":LazyGit<CR>3++]", desc = "Git Remote Branches" },
			{ "<leader>gc", ":LazyGit<CR>4+", desc = "Git Commits" },
			{ "<leader>gg", ":LazyGit<CR>", desc = "Git Menu" },
			{ "<leader>gs", ":Telescope git_status<CR>", desc = "Git Status" },
			{ "<leader>gh", ":Gitsigns blame_line<CR>", desc = "Git Hover" },
			{ "<leader>gb", ":Gitsigns blame<CR>", desc = "Git Blame" },
			{ "<leader>gR", ":Gitsigns refresh<CR>", desc = "Git Refresh" },
			{ "<leader>gd", ":Gitsigns diffthis<CR>", desc = "Git Diffthis" },
			-- { "<leader>gb",       ":GitSigns toggle_current_line_blame<CR>", desc = "Open Blame" },

			{ "<leader>b", group = "Buffer" },
			{ "<leader>bd", ":CloseBuffer<CR>", desc = "Close Buffer" },
			{ "L", ":BufferLineCycleNext<CR>", hidden = true },
			{ "H", ":BufferLineCyclePrev<CR>", hidden = true },

			{ "<leader>c", group = "Code" },
			{ "<leader>cd", vim.lsp.buf.definition, desc = "Code Definition" },
			{ "<leader>cD", vim.lsp.buf.declaration, desc = "Code Declaration" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
			{
                "<leader>cE",
                function()
                    vim.diagnostic.open_float(0, { sope="line" })
                end,
                desc = "Code Expand Error"
            },
			{ "<leader>ce", vim.diagnostic.setqflist, desc = "Code Errors" },
			{ "<leader>cR",  ":LspRestart<CR>", desc = "Code Restart LSP" },
			{ "<leader>cn",  vim.lsp.buf.rename, desc = "Code Rename" },
			-- { "<leader>cf",       vim.lsp.buf.format,                     desc = "Code Format" },
			{
				"<leader>cf",
				function()
					local conform = require("conform")
					conform.format({
						async = false,
						timeout_ms = 1000,
						lsp_format = "fallback",
					})
				end,
				desc = "Code Format",
			},
			{ "<leader>ch", vim.lsp.buf.hover, desc = "Code Hover" },
			{ "<leader>cr", vim.lsp.buf.references, desc = "Code References" },
			{ "<leader>ci", vim.lsp.buf.implementation, desc = "Code Implementation" },
            {
                "<leader>cx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Code Diagnostics",
            },
            {
                "<leader>cX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Code Buffer Diagnostics",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Code Symbols",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "Code LSP",
            },
            {
                "<leader>cL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Code Location",
            },
            {
                "<leader>cQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Code Quickfix",
            },

			{ "<leader>m", group = "Move" },
			{ "<leader>md", vim.lsp.buf.definition, desc = "Move To Definition" },
			{ "<leader>mD", vim.lsp.buf.declaration, desc = "Move To Declaration" },
			{ "<leader>mr", vim.lsp.buf.references, desc = "Move To References" },

			{ "gd", vim.lsp.buf.definition, desc = "Definition" },
			{ "gD", vim.lsp.buf.declaration, desc = "Declaration" },
			{ "gr", vim.lsp.buf.references, desc = "References" },

			{ "<leader>v", group = "Vue" },
			{ "<leader>vm", "/^\\s*methods:\\s*{<CR>:noh<CR>zz", desc = "Vue Methods" },
			{ "<leader>vc", "/^\\s*computed:\\s*{<CR>:noh<CR>zz", desc = "Vue Computed" },
			{ "<leader>vv", "/^\\s*components:\\s*{<CR>:noh<CR>zz", desc = "Vue Components" },
			{ "<leader>vw", "/^\\s*watch:\\s*{<CR>:noh<CR>zz", desc = "Vue Watch" },
			{ "<leader>vp", "/^\\s*props:\\s*{<CR>:noh<CR>zz", desc = "Vue Props" },
			{ "<leader>vd", "/^\\s*data\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Data" },
			{
				"<leader>vb",
				"/^\\s*\\(async\\)\\?\\s*beforeDestroy\\s*()\\s*{<CR>:noh<CR>zz",
				desc = "Vue Before Destroy",
			},
			{ "<leader>vM", "/^\\s*\\(async\\)\\?\\s*mounted\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Mounted" },
			{ "<leader>vC", "/^\\s*\\(async\\)\\?\\s*created\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Created" },
			{ "<leader>vU", "/^\\s*\\(async\\)\\?\\s*updated\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Updated" },
			{ "<leader>vs", "/^\\s*<script<CR>:noh<CR>zz", desc = "Vue Script" },
			{ "<leader>vS", "/^\\s*<style<CR>:noh<CR>zz", desc = "Vue Style" },
			{ "<leader>vt", "G/^\\s*<template<CR>:noh<CR>zz", desc = "Vue Template" },

			{ "<leader>t", group = "Terminal" },
			{
				"<leader>tt",
				":1ToggleTerm name='Master'<CR>",
				desc = "Terminal Master",
			},
			{
				"<leader>t1",
				":4ToggleTerm name='Terminal 1'<CR>",
				desc = "Terminal 1",
			},
			{
				"<leader>t2",
				":5ToggleTerm name='Terminal 2'<CR>",
				desc = "Terminal 2",
			},
			{
				"<leader>t3",
				":6ToggleTerm name='Terminal 3'<CR>",
				desc = "Terminal 3",
			},

			{ "<leader>s", group = "Spell" },
			{
				"<leader>ss",
				":set spell!<CR>",
				desc = "Toggle Spell",
			},
			{
				"<leader>sg",
				"zg",
				desc = "Spell Good Mark",
			},
			{
				"<leader>sw",
				"zw",
				desc = "Spell Woops Mark",
			},
			{
				"<leader>sh",
				"[s",
				desc = "Spell Prev",
			},
			{
				"<leader>sl",
				"]s",
				desc = "Spell Next",
			},

			{
				"<leader>o",
				function()
					return oil.open_float()
				end,
				desc = "Oil",
			},

			{ "<leader>h", group = "Harpoon" },
			{
				"<leader>hh",
				function()
                    toggle_telescope(harpoon:list())
                    local keys = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
                    vim.api.nvim_feedkeys(keys, 'm', false)
				end,
				desc = "Harpoon Menu",
			},
			{
				"<leader>h1",
				function()
                    harpoon:list():select(1)
				end,
				desc = "Harpoon Select 1",
			},
			{
				"<leader>h2",
				function()
                    harpoon:list():select(2)
				end,
				desc = "Harpoon Select 2",
			},
			{
				"<leader>h3",
				function()
                    harpoon:list():select(3)
				end,
				desc = "Harpoon Select 3",
			},
            {
				"<leader>h4",
				function()
                    harpoon:list():select(4)
				end,
				desc = "Harpoon Select 4",
			},
            {
				"<leader>h5",
				function()
                    harpoon:list():select(5)
				end,
				desc = "Harpoon Select 5",
			},
			{
				"<leader>ha",
				function()
                    harpoon:list():add()
				end,
				desc = "Harpoon Add",
			},
			{
				"<leader>hd",
				function()
                    harpoon:list():remove()
				end,
				desc = "Harpoon Delete",
			},
			{
				"<leader>hc",
				function()
                    harpoon:list():clear()
				end,
				desc = "Harpoon Clear",
			},

			-- { "<leader>a", group = "AI" },
			-- {
			--     "<leader>aa",
			--     ":TabnineToggle<CR>",
			--     desc = "AI Clear",
			-- },
			-- {
			--     "<leader>ac",
			--     ":TabnineChat<CR>",
			--     desc = "AI Chat",
			-- },
			-- {
			--     "<leader>as",
			--     ":TabnineStatus<CR>",
			--     desc = "AI Status",
			-- },

			-- { "<leader>a", group = "Arduino" },
			-- {
			--     "<leader>aa",
			--     ":call arduino#Attach()<CR>",
			--     desc = "Arduino Attach",
			-- },
			-- {
			--     "<leader>av",
			--     ":call arduino#Verify()<CR>",
			--     desc = "Arduino Verify",
			-- },
			-- {
			--     "<leader>au",
			--     ":call arduino#Upload()<CR>",
			--     desc = "Arduino Upload",
			-- },
			-- {
			--     "<leader>ad",
			--     ":call arduino#UploadAndSerial()<CR>",
			--     desc = "Arduino Upload And Serial",
			-- },
			-- {
			--     "<leader>ap",
			--     ":call arduino#ChooseProgrammer()<CR>",
			--     desc = "Arduino Choose Programmer",
			-- },
			-- {
			--     "<leader>ab",
			--     ":call arduino#ChooseBoard()<CR>",
			--     desc = "Arduino Choose Board",
			-- },

			-- { "<leader>;", "<Esc><CMD>CodeSnap<CR>", mode = "x", hidden = true },
		})
	end,
}
