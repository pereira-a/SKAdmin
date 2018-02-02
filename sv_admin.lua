-- Pre defined strings
strings = {
  kicked = "Kicked by %s, Reason: %q",
  banned = "You have been banned from this server.\nReason: %q",
  reason_add = "(Nickname: %s) Banned by: %q",
}


-- KICK PLAYER EVENT
RegisterServerEvent("skadmin:kickPlayer")
AddEventHandler("skadmin:kickPlayer", function(id, reason)
  DropPlayer(id, string.format(strings.kicked, GetPlayerName(source), reason))
end)

-- BAN PLAYER EVENT
RegisterServerEvent("skadmin:banPlayer")
AddEventHandler("skadmin:banPlayer", function(player, reason)
  local playerIdent = GetPlayerIdentifiers(player["serverID"])

  for i, ident in ipairs(playerIdent) do
    if string.find(ident, "license:") then
      local save_reason = reason.. string.format(strings.reason_add, player["name"], GetPlayerName(source))
      save_reason = string.gsub(reason, ";", "") -- filter out characters that may break this
      -- TODO: UPDATE BAN LIST
      Citizen.Trace(save_reason)
    end
    DropPlayer(player["serverID"], string.format(strings.banned, reason))
  end
end)
