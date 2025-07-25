return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	tag = "stable",
	opts = {},

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


		-- AI
		-- vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-x>', function () return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-]>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<C-[>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<M-a>', function () return vim.fn['codeium#Complete'] end, { expr = true, silent = true })

		-- Digraphs
		-- vim.keymap.set("i", "<C-k><C-k>", function()
		-- 	return digraphs.digraphs("insert");
		-- end)

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
			-- { "<Esc>", "<C-\\><C-n>", mode = "t", hidden = true, desc = "Quit terminal emulator" },

			-- {
			-- 	"<C-\\>",
			-- 	"<C-\\><C-n>:ToggleTerm<CR>",
			-- 	mode = "t",
			-- 	hidden = true,
			-- 	desc = "Terminal Close",
			-- },
			-- {
			-- 	"<C-\\>",
			-- 	":ToggleTerm<CR>",
			-- 	hidden = true,
			-- 	desc = "Terminal Toggle",
			-- },

			{ "<leader><leader>", ":FzfLua files<CR>", desc = "Find File", hidden = true },
			{ "<leader>/", ":FzfLua live_grep<CR>", desc = "Find Text", hidden = true },
			{ "<leader>q", ":CloseBuffer<CR>", desc = "Close Buffer", hidden = true },
			{ "<leader>yy", ":Yazi<CR>", desc = "Yazi", hidden = true },
			{ "<leader>yc", ":Yazi cwd<CR>", desc = "Yazi Cwd", hidden = true },
			{
				"<leader>o",
				function()
                    -- vim.cmd("vsplit | wincmd l")
                    -- require("oil").open()
                    require("oil").open_float(nil, {})
                end,
                hidden = true,
			},
			{ "<leader>u", ":UndotreeShow<CR>:UndotreeFocus<CR>", hidden = true },


			{ "<leader>f", group = "Find" },
			{ "<leader>ff", "yiw:FzfLua files query=<C-r>0<CR>", desc = "Find File" },
			{ "<leader>fw", ":FzfLua grep_cword<CR>", desc = "Find Word" },
			{ "<leader>fW", ":FzfLua grep_cWORD<CR>", desc = "Find Word" },
			{ "<leader>ft", ":FzfLua btags<CR>", desc = "Find Buffer Tags" },
			{ "<leader>fT", ":FzfLua tags<CR>", desc = "Find Tags" },
			{ "<leader>fF", ":FindMethod<CR>", desc = "Find Function" },
			{ "<leader>fr", ":FindRoute<CR>", desc = "Find Route" },
			{ "<leader>fb", ":FzfLua buffers<CR>", desc = "Find Buffer" },
			{ "<leader>fm", ":FzfLua marks<CR>", desc = "Find Mark" },
			{ "<leader>fi", ":FzfLua blines<CR>", desc = "Find In Buffer" },
			{ "<leader>fp", ":FzfLua files cwd=~/.config/nvim/templates<CR>", desc = "Find Pattern" },
			{ "<leader>fz", ":FzfLua zoxide<CR>", desc = "Find Zoxide" },
			{ "<leader>fh", ":FzfLua helptags<CR>", desc = "Find Help" },
			{ "<leader>fq", ":FzfLua quickfix<CR>", desc = "Find Quickfix" },
			{ "<leader>fs", ":FzfLua lsp_document_symbols<CR>", desc = "Find Buffer Symbols" },
			{ "<leader>fS", ":FzfLua lsp_workspace_symbols<CR>", desc = "Find Symbols" },
			{ "<leader>fg", ":FzfLua git_status<CR>", desc = "Find Git" },
			{ "<leader>f=", ":FzfLua spell_suggest<CR>", desc = "Find Spell Suggest" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gg", ":G<CR>", desc = "Git Menu" },
			{ "<leader>gh", ":Gitsigns blame_line<CR>", desc = "Git Hover" },
			{ "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Git Preview" },
			{ "<leader>gb", ":FzfLua git_branches<CR>", desc = "Git Branches" },
			{ "<leader>gB", ":Gitsigns blame<CR>", desc = "Git Blame" },
			{ "<leader>gC", ":FzfLua git_commits<CR>", desc = "Git Commits" },
			{ "<leader>gc", ":FzfLua git_bcommits<CR>", desc = "Git Buffer Commits" },
			{ "<leader>gs", ":FzfLua git_status<CR>", desc = "Git Status" },

			-- { "<leader>gd", ":Gitsigns diffthis<CR>", desc = "Git Diffthis" },
			-- { "<leader>gf", ":FzfLua git_hunks<CR>]", desc = "Git Branches" },
			-- { "<leader>gR", ":Gitsigns refresh<CR>", desc = "Git Refresh" },
			-- { "<leader>gb", ":GitSigns toggle_current_line_blame<CR>", desc = "Open Blame" },

			{ "L", ":bnext<CR>", hidden = true },
			{ "H", ":bprevious<CR>", hidden = true },

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
                "<leader>cX",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Code Diagnostics",
            },
            {
                "<leader>cx",
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
                "<leader>cq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Code Quickfix",
            },

			{ "gd", vim.lsp.buf.definition, desc = "Definition" },
			{ "gD", vim.lsp.buf.declaration, desc = "Declaration" },
			-- { "gr", vim.lsp.buf.references, desc = "References" },

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

			-- { "<leader>t", group = "Terminal" },
			-- {
			-- 	"<leader>tt",
			-- 	":1ToggleTerm name='Master'<CR>",
			-- 	desc = "Terminal Master",
			-- },
			-- {
			-- 	"<leader>t1",
			-- 	":4ToggleTerm name='Terminal 1'<CR>",
			-- 	desc = "Terminal 1",
			-- },
			-- {
			-- 	"<leader>t2",
			-- 	":5ToggleTerm name='Terminal 2'<CR>",
			-- 	desc = "Terminal 2",
			-- },
			-- {
			-- 	"<leader>t3",
			-- 	":6ToggleTerm name='Terminal 3'<CR>",
			-- 	desc = "Terminal 3",
			-- },
			--

			{ "<leader>n", group = "Notifications" },
			{
				"<leader>nc",
                ":Noice dismiss<CR>",
				desc = "Notifications Clear",
			},
            {
                "<leader>nl",
                ":Noice last<CR>",
                desc = "Notifications Last",
            },
			{
				"<leader>nn",
                ":Noice fzf<CR>",
				desc = "Notifications Menu",
			},

			-- { "<leader>a", group = "AI" },
			-- {
			--     "<leader>aa",
			--     ":SgptAsk<CR>",
			--     desc = "AI Ask",
			--              mode = "n",
			-- },
			-- {
			--     "<leader>aa",
			--     ":SgptAskSelection<CR>",
			--     desc = "AI Ask",
			--              mode = "v",
			--              hidden = true,
			-- },
			-- {
			--     "<leader>aq",
			--     "dd:r!sgpt --code 'Выполни задание по '.%:e.'. <C-r>1' | sed 's/[[:space:]]*$//'<CR>",
			--     desc = "AI Ask Query",
			--              mode = "n",
			-- },
			-- {
			--     "<leader>aq",
			--     "d:r!sgpt --code 'Выполни задание по '.%:e.'. <C-r>1' | sed 's/[[:space:]]*$//'<CR>",
			--     desc = "AI Ask Query",
            --     mode = "v",
            --     hidden = true,
			-- },
			-- {
			--     "<leader>ae",
			--     "dd:r!sgpt --md '<C-r>1' | sed 's/[[:space:]]*$//'<CR>",
			--     desc = "AI Ask empty",
			--              mode = "n",
			-- },
			-- {
			--     "<leader>ae",
			--     "d:r!sgpt --md '<C-r>1' | sed 's/[[:space:]]*$//'<CR>",
			--     desc = "AI Ask empty",
			--              mode = "v",
			--              hidden = true,
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
		})
	end,
}
