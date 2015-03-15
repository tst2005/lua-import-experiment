
local import = require("import")

local env = {}
import(env, "math", "min", {"pi", "PI"})
import(env, "_G", "print")

local _ENV = env
print( min(PI, 3, 10) == 3 and "ok" or "error" )


