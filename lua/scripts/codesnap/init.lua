local visual_utils = require("scripts.utils.visual")
local table_utils = require("scripts.utils.table")
local string_utils = require("scripts.utils.string")

local config_module = require("scripts.codesnap.config")
local static = require("scripts.codesnap.static")

local main = {
    cwd = static.cwd,
    preview_switch = static.preview_switch,
    highlight_mode_config = nil,
}

local function run_generator_function(func)
    xpcall(func, function(err)
        print(err)
    end)
end

local function take_snapshot(take_snapshot_function)
    return function(detail)
        local args = detail.fargs

        run_generator_function(function()
            take_snapshot_function(args[1])
        end)
    end
end


function main.copy_into_clipboard_with_config(config)
    require("scripts.codesnap.generator").copy_into_clipboard(config)
    vim.cmd("delmarks <>")
    vim.notify("Save snapshot into clipboard successfully")
end

function main.save_snapshot_with_config(config)
    if string_utils.is_str_empty(static.config.save_path) then
        error(
            "If you want to save snapshot in somewhere, you should config the save_path before, refer: https://github.com/mistricky/codesnap.nvim?tab=readme-ov-file#save-the-snapshot",
            0
        )
    end

    local matched_extension = string.match(static.config.save_path, "%.(.+)$")

    if matched_extension ~= "png" and matched_extension ~= nil then
        error("The extension of save_path should be .png", 0)
    end

    require("scripts.codesnap.generator").save_snapshot(config)
    vim.cmd("delmarks <>")
    vim.notify("Save snapshot in " .. config.save_path .. " successfully")
end

function main.copy_into_clipboard(extension)
    main.copy_into_clipboard_with_config(config_module.get_config(extension))
end

function main.save_snapshot(extension)
    main.save_snapshot_with_config(config_module.get_config(extension))
end

function main.setup(config)
    static.config = table_utils.merge(static.config, config == nil and {} or config)

    vim.api.nvim_create_user_command("CodeSnap", take_snapshot(main.copy_into_clipboard), { nargs = "*", range = "%" })
    vim.api.nvim_create_user_command("CodeSnapSave", take_snapshot(main.save_snapshot), { nargs = "*", range = "%" })
end

return main
