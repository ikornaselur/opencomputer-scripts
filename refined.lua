local component = require("component")
local utils = require("utils")

local rs = component.block_refinedstorage_interface

local targetAmount = 64
local items = {
  {name = "minecraft:redstone_torch", label = "Redstone Torch"},
  {name = "minecraft:gold_nugget", label = "Gold Nugget"},
  {name = "immersiveengineering:metal", damage = 29, label = "Iron Nugget"},
  {name = "refinedstorage:processor", damage = 0, label = "Printed Basic Processor"},
  {name = "refinedstorage:processor", damage = 1, label = "Printed Improved Processor"},
  {name = "refinedstorage:processor", damage = 2, label = "Printed Advanced Processor"},
  {name = "refinedstorage:processor", damage = 6, label = "Printed Silicon"}
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
          print("Crafting " .. toCraft .. " of " .. stack.label)
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
