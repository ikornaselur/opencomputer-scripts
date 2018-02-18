local component = require("component")
local os = require("os")
local utils = require("utils")

local rs = component.block_refinedstorage_interface

local items = {
  {name = "minecraft:redstone_torch",  amount = 64},
  {name = "minecraft:gold_nugget",  amount = 64},
  {name = "immersiveengineering:metal", damage = 29, amount = 64},
  {name = "refinedstorage:processor", damage = 0, amount = 32},
  {name = "refinedstorage:processor", damage = 1, amount = 32},
  {name = "refinedstorage:processor", damage = 2, amount = 32},
  {name = "refinedstorage:processor", damage = 6, amount = 32}
}


while (true) do
  for i, stack in ipairs(items) do
    if (rs.hasPattern(stack)) then
      local rsStack = rs.getItem(stack, true)  -- Compare metadata (damage)
      local toCraft = stack.amount

      if (rsStack ~= nil) then
        toCraft = toCraft - rsStack.size
      end

      if (toCraft > 0) then
        if (rs.getTasks()['n'] == 0) then  -- Only craft when idle
          print(os.date("%Y-%m-%d %H:%M:%S") .. " " .. "Crafting " .. toCraft .. " of " .. rsStack.label)
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
