
local require = require
local type = type

local function import(env, mod, ...)
	if type(mod) == "string" then
		mod = require(mod)
	end
	assert(type(mod) == "table")
	if ... then
		for i,k in pairs({...}) do
			local k0, k1 = k, k
			if type(k) == "table" then
				k0=k[1]
				k1=k[2]
			end
			local v = mod[k0]
			if v then
				env[k1] = v
			else
				error("no such key "..k0)
			end
		end
	else
		-- import all without aliasing
		for k,v in pairs(mod) do
			env[k] = v
		end
	end
	return env
end
local _M = {import = import}
return setmetatable(_M, {__call=function(_, ...) return import(...) end})
