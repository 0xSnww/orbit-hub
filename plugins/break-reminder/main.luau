-- Break reminder: a nudge after every hour in the same game.
local playing = nil
local minutes = 0

orbit.on("game_start", function(game)
  playing = game.name
  minutes = 0
end)

orbit.on("game_end", function()
  playing = nil
  minutes = 0
end)

orbit.on("minute", function()
  if not playing then
    return
  end
  minutes += 1
  if minutes % 60 == 0 then
    local hours = minutes // 60
    orbit.notify("Time for a break?", "You've been in " .. playing .. " for " .. hours .. (hours == 1 and " hour." or " hours."))
  end
end)
