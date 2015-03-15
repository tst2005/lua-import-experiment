
local import = require("import")

local _ENV = import(import({}, "math", "min", {"pi", "PI"}), "_G", "print")
print( min(PI, 3, 10) == 3 and "ok" or "error" )


