-- GIVE ALL WEAPONS
RegisterServerEvent("skadmin:svgiveAllWeapons")
AddEventHandler("skadmin:svgiveAllWeapons", function(id)
  TriggerClientEvent("skadmin:giveAllWeapons", id)
end)

-- REMOVE ALL WEAPONS
RegisterServerEvent("skadmin:svremoveAllWeapons")
AddEventHandler("skadmin:svremoveAllWeapons", function(id)
  TriggerClientEvent("skadmin:removeAllWeapons", id)
end)

-- DELETE GUN
RegisterServerEvent("skadmin:svtoggleDeleteGun")
AddEventHandler("skadmin:svtoggleDeleteGun", function(id)
  TriggerClientEvent("skadmin:toggleDeleteGun", id)
end)

-- FIRE AMMO
RegisterServerEvent("skadmin:svtoggleFireAmmo")
AddEventHandler("skadmin:svtoggleFireAmmo", function(id)
  TriggerClientEvent("skadmin:toggleFireAmmo", id)
end)

-- ONE SHOT KILL
RegisterServerEvent("skadmin:svtoggleOneShotKill")
AddEventHandler("skadmin:svtoggleOneShotKill", function(id)
  TriggerClientEvent("skadmin:toggleOneShotKill", id)
end)

-- EXPLOSIVE AMMO
RegisterServerEvent("skadmin:svtoggleExplosiveAmmo")
AddEventHandler("skadmin:svtoggleExplosiveAmmo", function(id)
  TriggerClientEvent("skadmin:toggleExplosiveAmmo", id)
end)

-- INFINITE AMMO
RegisterServerEvent("skadmin:svtoggleInfiniteAmmo")
AddEventHandler("skadmin:svtoggleInfiniteAmmo", function(id)
  TriggerClientEvent("skadmin:toggleInfiniteAmmo", id)
end)

-- TELEOPORT GUN
RegisterServerEvent("skadmin:svtoggleTeleportGun")
AddEventHandler("skadmin:svtoggleTeleportGun", function(id)
  TriggerClientEvent("skadmin:toggleTeleportGun", id)
end)

-- VEHICLE GUN
RegisterServerEvent("skadmin:svtoggleVehicleGun")
AddEventHandler("skadmin:svtoggleVehicleGun", function(id)
  TriggerClientEvent("skadmin:toggleVehicleGun", id)
end)

-- WHALE GUN
RegisterServerEvent("skadmin:svtoggleWhaleGun")
AddEventHandler("skadmin:svtoggleWhaleGun", function(id)
  TriggerClientEvent("skadmin:toggleWhaleGun", id)
end)
