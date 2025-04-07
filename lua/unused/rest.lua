return {
    'rest-nvim/rest.nvim',
    config = function()
        vim.g.rest_nvim = {
            response = {
                hooks = {
                    decode_url = true,
                    format = true,
                },
            },
        }
    end,
}
