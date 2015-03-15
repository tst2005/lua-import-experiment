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


