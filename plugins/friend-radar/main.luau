-- Friend radar: tells you when a friend comes online straight into a game.
local minute = 0
local muted_until = 0

orbit.on("minute", function()
  minute += 1
end)

orbit.on("friend_online", function(friend)
  if minute < muted_until or not friend.game then
    return
  end
  orbit.notify(friend.name .. " is playing", friend.game)
end)

orbit.command("Mute friend radar for an hour", function()
  muted_until = minute + 60
  orbit.notify("Friend radar", "Muted for an hour.")
end)
