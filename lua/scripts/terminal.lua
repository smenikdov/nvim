local function StartBackend()
	vim.cmd('3TermExec cmd="nvm use vdelo; npm run start" name="backend"')
end

local function StartFrontend()
	vim.cmd('2TermExec cmd="nvm use vdelo; npm run dev" name="frontend"')
end

local function InstallPackages()
	vim.cmd('1TermExec cmd="nvm use vdelo; npm i" name="installing"')
end

local commands = {
	StartFrontend = StartFrontend,
	StartBackend = StartBackend,
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
