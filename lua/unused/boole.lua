return {
    "nat-418/boole.nvim",
    opts = {
        mappings = {
            increment = '<C-a>',
            decrement = '<C-x>'
        },
        additions = {
            {'error', 'warn', 'success'},
            {'div', 'span'},
            {'positive', 'primary', 'nagative'},
            {'justify-end', 'justify-start'},
            -- <div v-if="isAdmin && !isSignStatusPass" class=" col-lg-5 col-md-5 col-sm-6 col-12 d-flex justify-end">

        },
        allow_caps_additions = {
            -- {'enable', 'disable'}
            -- enable → disable
            -- Enable → Disable
            -- ENABLE → DISABLE
        }
    },
}
