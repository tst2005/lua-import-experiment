local env

do
	local import = require("import").import2
	env = {
		import=import,
		assert=assert,
		tostring=tostring,
		P=print,
	}
	env._Estr=tostring(env)
	env._Gstr=tostring(_G)

	env._G=env
end

local _ENV=env
---- now in env -----------------------
local env -- drop access to env
assert(env==nil)

assert( pi == nil)

assert(tostring(_G)==_Estr)
assert(tostring(_G)~=_Gstr)

assert(_G == _G._G)

math={}

assert(math==_G.math)

import( assert(_G.math),
{ "math", -- from the module
	"min", -- 'math.min' imported as 'min'
	{"pi", "PI"} -- 'math.pi' imported as 'PI'
})

import(_G,
{ "_G",
	"print",
})

print( math.min(math.PI, 3, 10) == 3 and "ok" or "error" )
