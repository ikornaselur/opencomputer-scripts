local keyboard = require("keyboard")


local utils = {}

function utils.check_break()
  if keyboard.isKeyDown(keyboard.keys.w) and keyboard.isControlDown() then
    os.exit()
  end
end

return utils
