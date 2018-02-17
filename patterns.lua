local component = require("component")
local shell = require("shell")

local rs = component.block_refinedstorage_interface

local args, options = shell.parse(...)
local filter = nil
if (args[1] ~= nil) then
  filter = args[1]
end

local patterns = rs.getPatterns()

for i, pattern in ipairs(patterns) do
  local name = pattern['outputs'][1]['name']
  if (filter ~= nil) then
    if (name:find(filter) ~= nil) then
      print(name)
    end
  else
    print(name)
  end
end
