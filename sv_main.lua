Citizen.CreateThread(function()
  local dir = Config.settings.saves_directory
  local banfile = Config.settings.banlist_file
  if not DATA:fileExists(dir .. banfile) then
      DATA:createFile(dir .. banfile)
  end

  print("\n\nSkAdmin Running...\n\n")
end)
