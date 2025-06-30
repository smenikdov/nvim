return {
    -- https://github.com/kana/vim-textobj-user/wiki
    "kana/vim-textobj-user",
    { "fvictorio/vim-textobj-backticks", dependencies = { "kana/vim-textobj-user" } },
    { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },
    { "kana/vim-textobj-line", dependencies = { "kana/vim-textobj-user" } },
}
