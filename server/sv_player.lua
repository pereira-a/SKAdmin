-- MAX HEALTH
RegisterServerEvent("skadmin:svmaxHealth")
AddEventHandler("skadmin:svmaxHealth", function(id)
  TriggerClientEvent("skadmin:maxHealth", id)
end)

-- MAX ARMOR
RegisterServerEvent("skadmin:svmaxArmor")
AddEventHandler("skadmin:svmaxArmor", function(id)
  TriggerClientEvent("skadmin:maxArmor", id)
end)

-- GODMODE
RegisterServerEvent("skadmin:svtoggleGodmode")
AddEventHandler("skadmin:svtoggleGodmode", function(id)
  TriggerClientEvent("skadmin:toggleGodmode", id)
end)

-- INFINITE STAMINA
RegisterServerEvent("skadmin:svtoggleInfStamina")
AddEventHandler("skadmin:svtoggleInfStamina", function(id)
  TriggerClientEvent("skadmin:toggleInfStamina", id)
end)

-- INVISIBILITY
RegisterServerEvent("skadmin:svtoggleInvisibility")
AddEventHandler("skadmin:svtoggleInvisibility", function(id)
  TriggerClientEvent("skadmin:toggleInvisibility", id)
end)

-- INCREASE WANTED LEVEL
RegisterServerEvent("skadmin:svincreaseWantedLevel")
AddEventHandler("skadmin:svincreaseWantedLevel", function(id)
  TriggerClientEvent("skadmin:increaseWantedLevel", id)
end)

-- CLEAR WANTED LEVEL
RegisterServerEvent("skadmin:svclearWantedLevel")
AddEventHandler("skadmin:svclearWantedLevel", function(id)
  TriggerClientEvent("skadmin:clearWantedLevel", id)
end)

-- NEVER WANTED
RegisterServerEvent("skadmin:svtoggleNeverWanted")
AddEventHandler("skadmin:svtoggleNeverWanted", function(id)
  TriggerClientEvent("skadmin:toggleNeverWanted", id)
end)

-- FAST SWIM
RegisterServerEvent("skadmin:svtoggleFastSwim")
AddEventHandler("skadmin:svtoggleFastSwim", function(id)
  TriggerClientEvent("skadmin:toggleFastSwim", id)
end)

-- FAST SPRINT
RegisterServerEvent("skadmin:svtoggleFastSprint")
AddEventHandler("skadmin:svtoggleFastSprint", function(id)
  TriggerClientEvent("skadmin:toggleFastSprint", id)
end)

-- SUPER JUMP
RegisterServerEvent("skadmin:svtoggleSuperJump")
AddEventHandler("skadmin:svtoggleSuperJump", function(id)
  TriggerClientEvent("skadmin:toggleSuperJump", id)
end)

-- NO RAG DOLL
RegisterServerEvent("skadmin:svtoggleNoRagDoll")
AddEventHandler("skadmin:svtoggleNoRagDoll", function(id)
  TriggerClientEvent("skadmin:toggleNoRagDoll", id)
end)
