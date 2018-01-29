RegisterServerEvent("skadmin:kickPlayer")
AddEventHandler("skadmin:kickPlayer", function(id, reason)
  DropPlayer(id, reason)
end)
