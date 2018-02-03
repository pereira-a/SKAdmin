-- Pre defined strings
local strings = {
  kicked = "Kicked by %s, Reason: %q",
  banned = "You have been banned from this server.\nReason: %q",
  reason_add = " (Nickname: %s) Banned by: %q",
  connecting_banned = "You are banned from the server."
}

local dir = Config.settings.saves_directory
local banfile = Config.settings.banlist_file

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
      local save_reason = reason.. string.format(strings.reason_add, player["name"], "GetPlayerName(source)")
      save_reason = string.gsub(save_reason, ";", "") -- filter out characters that may break this
      DATA:appendToFile(dir .. banfile ,ident..";"..save_reason .. "\r\n")
    end
    DropPlayer(player["serverID"], string.format(strings.banned, reason))
  end
end)

-- PLAYER CONNECTION
AddEventHandler("playerConnecting", function(playerName, setKickReason)
  local bansIterator = DATA:getLineIterator(dir .. banfile)
  local idents = GetPlayerIdentifiers(source)
  for _, ident in ipairs(idents) do
    if string.find(ident, "license:") then
      local id = ident

      for line in bansIterator do
        local index = string.find(line, ";")
        if index then
          local savedId = string.sub(line, 1, index-1) -- minus 1, because it includes
          print("line: " .. line)
          print("savedId: " .. savedId)
          print("id2: " .. id)
          if id == savedId then
            setKickReason(strings.connecting_banned)
            CancelEvent()
          end
        end
      end
    end
  end
end)
