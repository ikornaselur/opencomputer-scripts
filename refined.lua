local component = require("component")
local utils = require("utils")

local rs = component.block_refinedstorage_interface

local targetAmount = 64
local items = {
  {name = "minecraft:redstone_torch"},
  {name = "minecraft:gold_nugget"},
  {name = "immersiveengineering:metal", damage = 29},
}


while (true) do
  for i, stack in ipairs(items) do
    if (rs.hasPattern(stack)) then
      local rsStack = rs.getItem(stack)
      local toCraft = targetAmount

      if (rsStack ~= nil) then
        toCraft = toCraft - rsStack.size
      end

      if (toCraft > 0) then
        print("Crafting " .. toCraft .. " of " .. stack.name)
        if (rs.getTasks()['n'] > 0) then
          print("Queue is not empty, will only craft when idle..")
        else
          rs.craftItem(stack, toCraft)
        end
      end
    else
      print("Missing pattern for: " .. stack.name)
    end
  end

  utils.check_break()
  os.sleep(5)
end
