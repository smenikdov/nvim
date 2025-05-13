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
        local digraphs = require("better-digraphs")


		-- <M is alt!!!!

		-- AI
		-- vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-x>', function () return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-]>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-[>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<M-a>', function () return vim.fn['codeium#Complete'] end, { expr = true, silent = true })

		-- Digraphs
		vim.keymap.set("i", "<C-k><C-k>", function()
			return digraphs.digraphs("insert");
		end)

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

        -- vim.keymap.set('v', '<Leader>cf', vim.lsp.buf.format)

		wk.setup(opts.setup)
		wk.add({
			{ "<Esc>", ":noh<CR>", hidden = true },
			{ "<C-s>", "<Esc>:w<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Save" },
			-- { "<C-q>", "<Esc>:q<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Close" },
			-- { "<C-a>", "ggVG", hidden = true, desc = "Select all" },
			-- { "<Esc>", "<C-\\><C-n>", mode = "t", hidden = true, desc = "Quit terminal emulator" },

			-- {
			-- 	"<C-\\>",
			-- 	"<C-\\><C-n>:ToggleTerm<CR>",
			-- 	mode = "t",
			-- 	hidden = true,
			-- 	desc = "Terminal Close",
			-- },
			{
				"<C-\\>",
				":ToggleTerm<CR>",
				hidden = true,
				desc = "Terminal Toggle",
			},

			{ "<leader><leader>", ":Telescope find_files<CR>", desc = "Find File", hidden = true },
			{ "<leader>/", ":Telescope live_grep_args<CR>", desc = "Find Text", hidden = true },
			{ "<leader>q", ":CloseBuffer<CR>", desc = "Close Buffer", hidden = true },
			{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle tree", hidden = true },

			{ "<leader>f", group = "Find" },
			{ "<leader>ff", "yiw:Telescope find_files<CR><C-r>0<Esc>", desc = "Find File" },
			{ "<leader>ft", "yiw:Telescope live_grep_args<CR><C-r>0<Esc>", desc = "Find Text" },
			{ "<leader>fm", "yiw:FindCurrentMethod<CR><C-r>0<Esc>", desc = "Find Current Method" },
			-- { "<leader>fr", ":Telescope live_grep_args<CR>\"url.+\" --iglob **/point.js<ESC>0", desc = "Find Route" },
			{ "<leader>fr", ":FindRoute<CR>", desc = "Find Route" },
			-- { "<leader>ff",       ":SmartFind<CR>",                       desc = "Find" },
			{ "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffer" },
			{ "<leader>fh", ":Telescope help_tags<CR>", desc = "Find Help" },
			{ "<leader>fc", ":Telescope git_commits<CR>", desc = "Find Commit" },
			{ "<leader>f'", ":Telescope marks<CR>", desc = "Find Mark" },
			{ "<leader>fi", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Find In Buffer" },
			-- { "<leader>fp", ":Telescope projects<CR>", desc = "Find Projects" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gr", ":LazyGit<CR>3++]", desc = "Git Remote Branches" },
			{ "<leader>gc", ":LazyGit<CR>4+", desc = "Git Commits" },
			{ "<leader>gg", ":LazyGit<CR>", desc = "Git Menu" },
			{ "<leader>gs", ":Telescope git_status<CR>", desc = "Git Status" },
			{ "<leader>gh", ":Gitsigns blame_line<CR>", desc = "Git Hover" },
			{ "<leader>gb", ":Gitsigns blame<CR>", desc = "Git Blame" },
			-- { "<leader>gR", ":Gitsigns refresh<CR>", desc = "Git Refresh" },
			{ "<leader>gd", ":Gitsigns diffthis<CR>", desc = "Git Diffthis" },
			{ "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Git Preview" },
			-- { "<leader>gb",       ":GitSigns toggle_current_line_blame<CR>", desc = "Open Blame" },

			-- { "<leader>b", group = "Buffer" },
			-- { "<leader>bd", ":CloseBuffer<CR>", desc = "Close Buffer" },

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

			-- { "<leader>m", group = "Move" },
			-- { "<leader>md", vim.lsp.buf.definition, desc = "Move To Definition" },
			-- { "<leader>mD", vim.lsp.buf.declaration, desc = "Move To Declaration" },
			-- { "<leader>mr", vim.lsp.buf.references, desc = "Move To References" },

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

			{ "<leader>s", group = "Spectre" },
			{
				"<leader>ss",
                ":lua require('spectre').toggle()<CR>",
				desc = "Spectre Toggle",
			},
			{
				"<leader>sw",
                ":lua require('spectre').open_visual({select_word=true})<CR>",
				desc = "Spectre Word",
			},
			{
				"<leader>sf",
                ":lua require('spectre').open_file_search({select_word=true})<CR>",
				desc = "Spectre File",
			},

			-- { "<leader>s", group = "Spell" },
			-- {
			-- 	"<leader>ss",
			-- 	":set spell!<CR>",
			-- 	desc = "Toggle Spell",
			-- },
			-- {
			-- 	"<leader>sg",
			-- 	"zg",
			-- 	desc = "Spell Good Mark",
			-- },
			-- {
			-- 	"<leader>sw",
			-- 	"zw",
			-- 	desc = "Spell Woops Mark",
			-- },
			-- {
			-- 	"<leader>sh",
			-- 	"[s",
			-- 	desc = "Spell Prev",
			-- },
			-- {
			-- 	"<leader>sl",
			-- 	"]s",
			-- 	desc = "Spell Next",
			-- },

			{
				"<leader>o",
				function()
                    require("oil").open_float(nil, {
                        -- preview = {
                        --     vertical = true,
                        -- }
                    })
				end,
				desc = "Oil",
			},

			{ "<leader>n", group = "Notifications" },
			{
				"<leader>nc",
                ":Noice dismiss<CR>",
				desc = "Notifications Clear",
			},
			-- {
			-- 	"<leader>nl",
			--              ":Noice last<CR>",
			-- 	desc = "Notifications Last",
			-- },
			{
				"<leader>nn",
                ":Noice telescope<CR>",
				desc = "Notifications Menu",
			},

			{ "<leader>a", group = "AI" },
			{
			    "<leader>aa",
			    "dd:r!sgpt 'Выполни задание по '.%:e.'. Напиши только код без примеров использования, комментариев и объяснения. Вот текст задания: <C-r>1' | sed 's/[[:space:]]*$//'<CR>",
			    desc = "AI Ask",
			},
			{
			    "<leader>ae",
			    "dd:r!sgpt '<C-r>1' | sed 's/[[:space:]]*$//'<CR>",
			    desc = "AI Ask empty",
			},


			-- { "<leader>a", group = "AI" },
			-- {
			--     "<leader>aa",
			--     ":AvanteChat<CR>",
			--     desc = "AI Ask",
			-- },
			-- {
			--     "<leader>an",
			--     ":AvanteChat<CR>",
			--     desc = "AI New",
			-- },
			-- {
			--     "<leader>ah",
			--     ":AvanteHistory<CR>",
			--     desc = "AI History",
			-- },
			-- {
			--     "<leader>am",
			--     ":AvanteModels<CR>",
			--     desc = "AI Models",
			-- },
			-- {
			--     "<leader>al",
			--     ":AvanteClear<CR>",
			--     desc = "AI Clear",
			-- },
			-- {
			--     "<leader>ar",
			--     ":AvanteRefresh<CR>",
			--     desc = "AI Refresh",
			-- },
			-- {
			--     "<leader>ax",
			--     ":AvanteStop<CR>",
			--     desc = "AI Stop",
			-- },
			-- {
			--     "<leader>ac",
			--     desc = "AI Add file",
			-- },
			-- {
			--     "<leader>ae",
			--     ":AvanteEdit<CR>",
			--     desc = "AI Edit",
			--              mode = "v",
			-- },
			-- {
			--     "<leader>aa",
			--     "<CMD>AvanteAsk<CR><Esc>",
			--     desc = "AI Ask",
			--              mode = "v",
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

			{ "<leader>r", group = "Rest" },
            { "<leader>rb", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad" },
            { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL" },
            { "<leader>rC", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste from curl" },
            {
                "<leader>rg",
                "<cmd>lua require('kulala').download_graphql_schema()<cr>",
                desc = "Download GraphQL schema"
            },
            { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request" },
            { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
            { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
            { "<leader>rq", "<cmd>lua require('kulala').close()<cr>", desc = "Close window" },
            { "<leader>rr", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay the last request" },
            { "<leader>rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
            { "<leader>rS", "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats" },
            { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
		})
	end,
}
