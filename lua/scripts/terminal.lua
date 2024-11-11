-- local Terminal = require('toggleterm.terminal').Terminal
--
-- local maser = Terminal:new({ id = 1 })
-- local frontend = Terminal:new({ id = 2 })
-- local backend = Terminal:new({ id = 3 })
-- local term1 = Terminal:new({ id = 4 })
-- local term2 = Terminal:new({ id = 5 })
-- local term3 = Terminal:new({ id = 6 })

local function InstallPackages()
    vim.cmd('1TermExec cmd="nvm use vdelo; npm i" name="Installing"')
end

local function StartVdeloFrontend()
    vim.cmd('2TermExec cmd="nvm use vdelo; npm run dev" name="Frontend" open=0')
    print("Frontend started")
end

local function StartVdeloBackend()
    vim.cmd('3TermExec cmd="nvm use vdelo; npm run start" name="Backend" open=0')
    print("Backend started")
end

local function StartVdeloProject()
    StartVdeloBackend()
    StartVdeloFrontend()
end

local function StartChechnyFrontend()
    vim.cmd('2TermExec cmd="nvm use 20; npm run dev" name="Frontend" open=0 dir=~/projects/chechny/lk')
    print("Frontend started")
end

local function StartChechnyBackend()
    vim.cmd('3TermExec cmd="nvm use 20; npm run start" name="Backend" open=0 dir=~/projects/chechny/back')
    print("Backend started")
end

local function StartVdeloProject()
    StartVdeloBackend()
    StartVdeloFrontend()
end

local function StartChechnyProject()
    StartChechnyBackend()
    StartChechnyFrontend()
end

local commands = {
    StartVdeloProject = StartVdeloProject,
    StartChechnyProject = StartChechnyProject,
    InstallPackages = InstallPackages,
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
