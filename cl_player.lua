local godmode = false
local isInfStamina = false

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

Citizen.CreateThread(function()

  while true do
    Citizen.Wait(0)
  end

end)
