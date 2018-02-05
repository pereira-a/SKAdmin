local maxPlayers = 32

function getOnlinePlayers()
  local players = {}
  local me = PlayerId(-1)
  for i=0, maxPlayers, 1 do
    -- if NetworkIsPlayerConnected(i) and i ~= me then
    if NetworkIsPlayerConnected(i) then
      local playerName = GetPlayerName(i)
      local serverID = GetPlayerServerId(i)

      table.insert(players, {
        ['ped'] = GetPlayerPed(i),
        ['name'] = playerName,
        ['id'] = i,
        ['serverID'] = serverID,
      })
    end
  end
  return players
end


function spectatePlayer(targetId)
  local playerPed = GetPlayerPed(-1)
  local targetPed = GetPlayerPed(targetId)

  if not IsScreenFadedOut() and not IsScreenFadingOut() then
    DoScreenFadeOut(1000)
    while (not IsScreenFadedOut()) do
		    Wait(0)
    end

    --local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(targetId),true))

    FreezeEntityPosition(playerPed, true)
    RequestCollisionAtCoord(GetEntityCoords(targetPed))
    NetworkSetInSpectatorMode(true, targetId)

    if(IsScreenFadedOut()) then
      DoScreenFadeIn(1000)
    end

    TriggerClientEvent("chatMessage", -1, "SKAdmin", {255, 0, 0}, "In spectate mode. To exit press BACKSPACE")

    while true do
      Citizen.Wait(0)
      if IsControlJustPressed(3, 177) then

        FreezeEntityPosition(playerPed, false)
        RequestCollisionAtCoord(GetEntityCoords(playerPed))
        NetworkSetInSpectatorMode(0, playerPed)
        break
      end
    end
  end

end
