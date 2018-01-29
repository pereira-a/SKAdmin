maxPlayers = 32

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
        ['serverID'] = serverID
      })
    end
  end
  return players
end
