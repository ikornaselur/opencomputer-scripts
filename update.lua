local internet = require("internet")

local baseUrl = "https://raw.githubusercontent.com/ikornaselur/opencomputer-scripts/master/"

for file in internet.request(baseUrl .. "files") do
  print("Updating " .. file)
  local f, reason = io.open(file, "w")
  for line in internet.request(baseUrl .. file) do
    f:write(line)
  end
  f:close()
end
