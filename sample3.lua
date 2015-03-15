
local import = require("import")

local _ENV = import({import=import}, "math", "min", {"pi", "PI"}):import("_G", "print")
print( min(PI, 3, 10) == 3 and "ok" or "error" )


