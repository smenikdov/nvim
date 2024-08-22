-- local Terminal = require('toggleterm.terminal').Terminal
--
-- local maser = Terminal:new({ id = 1 })
-- local frontend = Terminal:new({ id = 2 })
-- local backend = Terminal:new({ id = 3 })
-- local term1 = Terminal:new({ id = 4 })
-- local term2 = Terminal:new({ id = 5 })
-- local term3 = Terminal:new({ id = 6 })


local function StartFrontend()
    vim.cmd('2TermExec cmd="nvm use vdelo; npm run dev" name="Frontend" open=0')
    print("Frontend started")
end

local function StopFrontend()
    vim.cmd('2TermExec cmd="" name="Frontend"')
    local keys = vim.api.nvim_replace_termcodes('i<C-c><Esc><C-q>', true, false, true)
    vim.api.nvim_feedkeys(keys, 'm', false)
    print("Frontend stopped")
end

local function RestartFrontend()
    StopFrontend()
    StartFrontend()
    print("Frontend restarted")
end

local function InstallPackages()
    vim.cmd('1TermExec cmd="nvm use vdelo; npm i" name="Installing"')
end

local function StartBackend()
    vim.cmd('3TermExec cmd="nvm use vdelo; npm run start" name="Backend" open=0')
    print("Backend started")
end

local function StopBackend()
    vim.cmd('3TermExec cmd="" name="Backend"')
    local keys = vim.api.nvim_replace_termcodes('i<C-c><Esc><C-q>', true, false, true)
    vim.api.nvim_feedkeys(keys, 'm', false)
    print("Backend stopped")
end

local function StartProject()
    StartBackend()
    StartFrontend()
end

local function RestartBackend()
    StopBackend()
    StartBackend()
    print("Backend restarted")
end

local commands = {
    StartFrontend = StartFrontend,
    StopFrontend = StopFrontend,
    RestartFrontend = RestartFrontend,
    StartBackend = StartBackend,
    InstallPackages = InstallPackages,
    StopBackend = StopBackend,
    RestartBackend = RestartBackend,
    StartProject = StartProject,
}

vim.api.nvim_create_user_command("T", function(opts)
    local arg = opts.args
    if commands[arg] then
        commands[arg]()
    else
        print("Unknown argument" .. arg)
    end
end, {
    nargs = 1,
    complete = function()
        return vim.tbl_keys(commands)
    end,
})
