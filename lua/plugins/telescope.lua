return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ['<C-l>'] = false,
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            }
        }
    }
}
