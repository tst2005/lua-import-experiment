# lua import

It's a `import` function that allow to import module function into the local environment.

# Sample

Import some module function into the local env

## Without lua-import

```lua
local min, PI = require("math").min, require("math").pi
local print = print

print( min(PI, 3, 10) == 3 and "ok" or "error" )
```

## With lua-import

```lua
local import = require("import")

local env = {}
import(env, "math", "min", {"pi", "PI"})
import(env, "_G", "print")

local _ENV = env
print( min(PI, 3, 10) == 3 and "ok" or "error" )
```
The difference between the both way is the second one setup a restricted environment.
My goal is to use this util to setup sandbox environment


# Limitation

The current version is lua5.2+ only (because _ENV support is required).
This limitation will probably fixed soon with the lua-compat library.

# License

 * this import module follow the MIT License
