--https://forums.factorio.com/viewtopic.php?p=200995#p200995
--http://lua-api.hornwitser.no/1.1.49/LuaGameScript.html#LuaGameScript.remove_path

--Handles hot key
script.on_event("perform-quicksave", function(event)
  local max_saves_number = 3
  local last_save_number = global["last_save_number"]

  if (last_save_number == nil or last_save_number >= max_saves_number) then
    last_save_number = 0
  end

  last_save_number = last_save_number + 1

  global["last_save_number"] = last_save_number

  local auto_save_name = string.format("quick%d", last_save_number)
  local auto_save_message = string.format("Saved '_autosave-%s'", auto_save_name)
  game.auto_save(auto_save_name)
  game.print(auto_save_message)
end)