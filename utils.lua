local keyboard = require("keyboard")


function utils.check_break()
  if keyboard.isKeyDown(keyboard.keys.w) and keyboard.isControlDown() then
    os.exit()
  end
end
