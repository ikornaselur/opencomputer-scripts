local component = require("component")
local shell = require("shell")

local rs = component.block_refinedstorage_interface

local args, options = shell.parse(...)
local filter = nil
if (args[1] ~= nil) then
  filter = args[1]
end

local patterns = rs.getPatterns()

local function printItem(item)
  print(item['label'] .. " (" .. item['name'] ..") <Damage: " .. item['damage'] .. ">")
end

for i, pattern in ipairs(patterns) do
  local item = pattern['outputs'][1]
  if (filter ~= nil) then
    if (item['name']:find(filter) ~= nil or item['label']:lower():find(filter) ~= nil) then
      printItem(item)
    end
  else
    printItem(item)
  end
end
