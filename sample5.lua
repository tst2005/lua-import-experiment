
local import = require("import").import2
local env = {
--	import=import,
	assert=assert,
}
env.math={}
env._G=env

import( assert(env.math),
{ "math", -- from the module
	"min", -- 'math.min' imported as 'min'
	{"pi", "PI"} -- 'math.pi' imported as 'PI'
})

import(env._G,
{ "_G",
	"print",
})

local _ENV=env
print( math.min(math.PI, 3, 10) == 3 and "ok" or "error" )
assert( pi == nil)
