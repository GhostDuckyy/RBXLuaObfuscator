# RBX-obfuscator
this is a modified [RBXLuaObfuscator](https://github.com/kosuke14/RBXLuaObfuscator) (made by [**kosuke14**](https://github.com/kosuke14)) version

### Script
```lua
local obfuscator = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/Taurus-obfuscator/main/source.lua"))()

obfuscator(
 [===[
  --// Paste your source here
  print("Hello World!")
 ]===],
 "Taurus_", --// Custom Variable
 "Protected" --// WaterMark
)
```
**NOTE**: will be copied to clipboard after executed!
