-- GODMODE
RegisterServerEvent("skadmin:svtoggleGodmode")
AddEventHandler("skadmin:svtoggleGodmode", function(id)
  TriggerClientEvent("skadmin:toggleGodmode", id)
end)
