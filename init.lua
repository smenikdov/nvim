require("core/options")
require("core/lazy")

require("scripts/delete-buffer")
-- require("scripts/files/smart-find")
require("scripts/find-route")
require("scripts/find-method")
require("scripts/find-table")

local language = require("scripts/language")
language.setup()

local env = require("scripts/env-manager")
env.setup()

require("scripts/lsp")
