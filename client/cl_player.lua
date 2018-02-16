local godmode = false
local infStamina = false
local invisibility = false
local nerverWanted = false
local fastSwim = false
local fastSprint = false
local superJump = false
local noRagDoll = false

-- MAX HEALTH
RegisterNetEvent("skadmin:maxHealth")
AddEventHandler("skadmin:maxHealth", function()
  SetEntityHealth(GetPlayerPed(-1), 100)
  drawNotification("~b~Health updated")
end)

-- MAX ARMOR
RegisterNetEvent("skadmin:svmaxArmor")
AddEventHandler("skadmin:svmaxArmor", function()
  SetEntityArmor(GetPlayerPed(-1), 100)
  drawNotification("~b~Armor updated")
end)

-- GODMODE
RegisterNetEvent("skadmin:toggleGodmode")
AddEventHandler("skadmin:toggleGodmode", function()
  godmode = not godmode
  SetEntityInvincible(GetPlayerPed(-1), godmode)
  if godmode then
    drawNotification("~b~God mode activated")
  else
    drawNotification("~r~God mode deactivated")
  end
end)

-- INFINITE STAMINA
RegisterNetEvent("skadmin:toggleInfStamina")
AddEventHandler("skadmin:toggleInfStamina", function()
  infStamina = not infStamina
  if infStamina then
    drawNotification("~b~Infinite Stamina activated")
  else
    drawNotification("~r~Infinite Stamina deactivated")
  end
end)

-- INVISIBILITY
RegisterNetEvent("skadmin:toggleInvisibility")
AddEventHandler("skadmin:toggleInvisibility", function()
  invisibility = not invisibility
  SetEntityVisible(GetPlayerPed(-1), not invisibility, 0)
  SetForcePedFootstepsTracks(invisibility) -- TODO: all players ?!
  if invisibility then
    drawNotification("~b~Invisibility activated")
  else
    drawNotification("~r~Invisibility deactivated")
  end
end)

-- INCREASE WANTED LEVEL
RegisterNetEvent("skadmin:increaseWantedLevel")
AddEventHandler("skadmin:increaseWantedLevel", function()
  local level = GetPlayerWantedLevel(PlayerId())
  if level < 5 then
    SetPlayerWantedLevel(PlayerId(), level + 1, false)
    SetPlayerWantedLevelNow(PlayerId(), true)
    drawNotification("~b~Wanted level increased")
  end
end)

-- CLEAR WANTED LEVEL
RegisterNetEvent("skadmin:clearWantedLevel")
AddEventHandler("skadmin:clearWantedLevel", function()
    ClearPlayerWantedLevel(PlayerId())
    drawNotification("~b~Wanted level cleared")
end)

-- NEVER WANTED
RegisterNetEvent("skadmin:toggleNeverWanted")
AddEventHandler("skadmin:toggleNeverWanted", function()
  nerverWanted = not nerverWanted
  if nerverWanted then
    drawNotification("~b~Never Wanted activated")
  else
    drawNotification("~r~Never Wanted deactivated")
  end
end)

-- FAST SWIM
RegisterNetEvent("skadmin:toggleFastSwim")
AddEventHandler("skadmin:toggleFastSwim", function()
  fastSwim = not fastSwim
  if fastSwim then
    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
    drawNotification("~b~Fast Swim activated")
  else
    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
    drawNotification("~r~Fast Swim deactivated")
  end
end)

-- FAST SPRINT
RegisterNetEvent("skadmin:toggleFastSprint")
AddEventHandler("skadmin:toggleFastSprint", function()
  fastSprint = not fastSprint
  if fastSprint then
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    drawNotification("~b~Fast Sprint activated")
  else
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    drawNotification("~r~Fast Sprint deactivated")
  end
end)

-- SUPER JUMP
RegisterNetEvent("skadmin:toggleSuperJump")
AddEventHandler("skadmin:toggleSuperJump", function()
  superJump = not superJump
  if superJump then
    drawNotification("~b~Super Jump activated")
  else
    drawNotification("~r~Super Jump deactivated")
  end
end)

-- NO RAG DOLL
RegisterNetEvent("skadmin:toggleNoRagDoll")
AddEventHandler("skadmin:toggleNoRagDoll", function()
  noRagDoll = not noRagDoll
  SetPedCanRagdoll( GetPlayerPed(-1), not noRagDoll )
  if noRagDoll then
    drawNotification("~b~No Rag Doll activated")
  else
    drawNotification("~r~No Rag Doll deactivated")
  end
end)


Citizen.CreateThread(function()

  while true do
    Citizen.Wait(0)

    if infStamina then
      RestorePlayerStamina(source, 1.0)
    end

    if neverWanted then
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
    end

    if superJump then
      SetSuperJumpThisFrame(PlayerId())
    end
  end

end)

--SET_PLAYER_WEAPON_DAMAGE_MODIFIER
--_SET_VEHICLE_ENGINE_POWER_MULTIPLIER
