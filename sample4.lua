
local import = require("import")
local env = {import=import}

local _ENV = import(
env, -- import inside this environment
{ "math", -- from the module
	"min", -- 'math.min' imported as 'min'
	{"pi", "PI"} -- 'math.pi' imported as 'PI'
},
{ "_G",
	"print",
})
print( min(PI, 3, 10) == 3 and "ok" or "error" )


