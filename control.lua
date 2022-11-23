-- Updated version of https://forums.factorio.com/viewtopic.php?p=5937#p5937

local player

script.on_event(defines.events.on_tick, function(event)

  if not player then
    player = game.get_player(1)
  end

  if not player.gui.left.label_time then
    player.gui.left.add{
      type="label",
      name="label_time",
      caption="time"
    }
  end
  
  -- https://github.com/wube/factorio-data/blob/master/core/prototypes/style.lua
  local style = player.gui.left.label_time.style
  style.font = "default-bold"
  style.font_color = {r = 1, g = 1, b = 1}
  style.top_padding = 2
  style.left_padding = 4

  -- format time
  local time = game.surfaces[1].daytime
  time = time + 0.5
  if time > 1 then
    time = time - 1
  end
  
  -- format hour
  local hour = math.floor(time * 24)
  local meridiem = "AM"
  if hour > 12 then
    hour = hour - 12
    meridiem = "PM"
  end
  
  -- format minute
  local minute = math.floor(60 * ((time * 24) - math.floor(time * 24)))
  if minute < 10 then
    minute = "0" .. minute
  end
  
  -- display time
  player.gui.left.label_time.caption =
  hour .. ":" .. minute .. " " .. meridiem

  end)
