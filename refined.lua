local component = require("component")
local utils = require("utils")

local rs = component.block_refinedstorage_interface

local targetAmount = 64
local items = {
  {name = "minecraft:redstone_torch"},
  {name = "minecraft:gold_nugget"},
  {name = "immersiveengineering:metal", damage = 29},  -- Iron Nugent
  {name = "refinedstorage:processor", damage = 0},  -- Printed Basic Processor
  {name = "refinedstorage:processor", damage = 1},  -- Printed Improved Processor
  {name = "refinedstorage:processor", damage = 2},  -- Printed Advanced Processor
  {name = "refinedstorage:processor", damage = 6},  -- Printed Silicon
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
        if (rs.getTasks()['n'] == 0) then  -- Only craft when idle
          local itemInfo = rs.getItem(stack)
          print("Crafting " .. toCraft .. " of " .. itemInfo.label)
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
