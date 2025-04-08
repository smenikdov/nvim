-- Глобальные переменные для хранения профилей и активного состояния
local function get_env_path()
    local env_path = vim.fn.findfile(".env", "**")
    return env_path
end

local function get_env_file()
    local env_path = get_env_path()
    if (not env_path) or (#env_path == 0) then
        return nil
    end

    local env = vim.fn.readfile(env_path)
    return env
end

-- Функция для парсинга .env файла
local function parse_env_file()
    local profiles = {}
    local active_db_name = nil

    local file = get_env_file()
    if not file then
        return
    end

    -- Парсим профили
    for i, line in ipairs(file) do
        if line:match("^#%s*@%s*DB_PROFILE") then
            local profile = {}
            -- Собираем следующие 6 строк
            for j = 1, 6 do
                local next_line = file[i + j]
                if next_line then
                    -- Удаляем комментарий (#) и пробелы
                    local clean_line = next_line:gsub("^#%s*", "")
                    local key, value = clean_line:match("([^=]+)=(.+)")
                    if key and value then
                        profile[key] = value
                    end
                end
            end
            -- Сохраняем профиль по уникальному DB_NAME
            if profile.DB_NAME then
                profiles[profile.DB_NAME] = profile
            end
        elseif line:match("^DB_NAME=") then
            -- Ищем активный DB_NAME (без # в начале)
            active_db_name = line:match("^DB_NAME=(.+)")
            -- print(active_db_name)
        end
    end

    vim.g.env_manager_sources = profiles
    vim.g.env_manager_active = active_db_name
end

-- Функция для получения активного имени
local function active_state_name()
    return vim.g.env_manager_active
end

-- Функция для переключения профиля
local function set_source_state(profile_name)
    local profiles = vim.g.env_manager_sources
    if not profiles[profile_name] then
        print("Профиль " .. profile_name .. " не найден")
        return
    end

    local env = get_env_file()
    if not env then
        print("Не удалось открыть .env файл для записи")
        return
    end

    -- Обновляем активные строки
    local new_lines = {}
    for _, line in ipairs(env) do
        local new_line = line

        if line:match("^DB_HOST=") then
            new_line = "DB_HOST=" .. profiles[profile_name].DB_HOST
        elseif line:match("^DB_PORT=") then
            new_line = "DB_PORT=" .. profiles[profile_name].DB_PORT
        elseif line:match("^DB_DATABASE=") then
            new_line = "DB_DATABASE=" .. profiles[profile_name].DB_DATABASE
        elseif line:match("^DB_USER=") then
            new_line = "DB_USER=" .. profiles[profile_name].DB_USER
        elseif line:match("^DB_PASSWORD=") then
            new_line = "DB_PASSWORD=" .. profiles[profile_name].DB_PASSWORD
        elseif line:match("^DB_NAME=") then
            new_line = "DB_NAME=" .. profiles[profile_name].DB_NAME
        end
        table.insert(new_lines, new_line)
    end

    local env_path = get_env_path()
    if not env_path then
        print("Не удалось записать в .env файл")
        return
    end
    vim.fn.writefile(new_lines, env_path)
    vim.g.env_manager_active = profiles[profile_name].DB_NAME
end

-- Функция автодополнения для команды
local function complete_env_profiles(arg_lead, cmd_line, cursor_pos)
    local profiles = vim.g.env_manager_sources
    local matches = {}
    for profile_name, _ in pairs(profiles) do
        if profile_name:find(arg_lead, 1, true) == 1 then
            table.insert(matches, profile_name)
        end
    end
    return matches
end

local function setup()
    vim.g.env_manager_sources = {}
    vim.g.env_manager_active = nil

    parse_env_file()

    vim.api.nvim_create_user_command(
        "EnvManagerSetSourceState",
        function(opts)
            set_source_state(opts.args)
        end,
        {
            nargs = 1,
            complete = complete_env_profiles,
        }
    )

    -- Экспорт функции active_state_name для использования в других скриптах
end

return {
    setup = setup,
    active_state_name = active_state_name,
}
