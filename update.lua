local internet = require("internet")


local baseUrl = "https://raw.githubusercontent.com/ikornaselur/opencomputer-scripts/master/"


local response = internet.request(baseUrl .. "files")()

-- Split file list on new lines
for file in response:gmatch("[^\r\n]+") do
  print("Updating " .. file)
  local f, reason = io.open(file, "w")
  f:write(internet.request(baseUrl .. file)())
  f:close()
end
