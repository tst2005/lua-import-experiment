local import = require("import")

local x = function()
	local e = {}
	e.print = print
	local _ENV = setmetatable(e, {__index = _G})

	import(_ENV, "mod1", "f1")
	assert(f1 and f2 == nil)
	--print("f1", f1, "f2", f2, "_G", _G)
	assert(f1 and f2 == nil)

	import(_ENV, "mod1", "f2")
	--print("f1", f1, "f2", f2, "_G", _G)
	assert(f2)
end

local y = function()
	local env = {print = print}
	import(env, "mod1", "f1", "f2")

	--setmetatable(env, {__index = {print = print}})
	local _ENV = env

	print("f1", f1, "f2", f2, "_G", _G)
end

print("x")
x()
print("y")
y()
print("script")
--print("f1", f1, "f2", f2, "_G", _G)


local env = {}
import(env, "mod1", "f1", {"f2", "F2"})
print("f1", f1, "F2", F2, "_G", _G)
setmetatable(env, {__index = {print = print, assert=assert}})
local _ENV = env
assert(f2 == nil)
print("f1", f1, "(f2)", f2, "F2", F2, "_G", _G)


