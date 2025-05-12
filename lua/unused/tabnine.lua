return {
    'codota/tabnine-nvim',
    commit = 'dc7cdf59df675921220e70acfc003b27d1b8160f',

    build = "./dl_binaries.sh",
	config = function()
        require('tabnine').setup({
            disable_auto_comment = true,
            accept_keymap = "<C-a>",
            dismiss_keymap = "<C-x>",
            debounce_ms = 800,
            suggestion_color = {gui = "#808080", cterm = 244},
            exclude_filetypes = {"TelescopePrompt", "NvimTree", "DuckyType"},
            log_file_path = nil, -- absolute path to Tabnine log file
            ignore_certificate_errors = false,
        })
    end
}
