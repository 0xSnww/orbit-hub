-- Session log: your last five sessions, on Home.
local MAX = 5

local log = {}
local saved = orbit.storage.get("log")
if saved then
  for line in string.gmatch(saved, "[^\n]+") do
    table.insert(log, line)
  end
end

local function length(seconds)
  local m = seconds // 60
  if m < 60 then
    return m .. " min"
  end
  return (m // 60) .. " h " .. (m % 60) .. " min"
end

local function show()
  if #log == 0 then
    orbit.widget("Recent sessions", { "Nothing yet. Go play something." })
  else
    orbit.widget("Recent sessions", log)
  end
end

orbit.on("start", show)

orbit.on("game_end", function(game)
  table.insert(log, 1, game.name .. " - " .. length(game.seconds or 0))
  while #log > MAX do
    table.remove(log)
  end
  orbit.storage.set("log", table.concat(log, "\n"))
  show()
end)

orbit.command("Clear recent sessions", function()
  log = {}
  orbit.storage.set("log", "")
  show()
end)
