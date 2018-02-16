--[[
Ranks System:
1 - Moderator
2 - Administrator
3 - Owner
]]
local admins = {
  {"steam:1100001018397d5", 3},
  {"ip:127.0.0.1", 3},
}

Config = {}
Config.settings = {
  saves_directory = "skadmin_saves/", -- Extremely important: this directory must be created in server-data
  banlist_file = "banlist.txt",
  event_messages = 1, -- Event messages in server chat (ban, kick, etc..). Change to nil if you want to desactivate, to 1 if want it active.
  event_messages_console = 1, -- Event messages in the console
  skins = 1,
}

Config.permissions = {
  ["server_management"] = 3,
  ["kick"] = 1,
  ["ban"] = 2,
  ["unban"] = 2,
  ["spectate"] = 2,
  ["teleport_player"] = 1,
  ["teleport_waypoint"] = 1,
  ["noclip"] = 2,
  ["max_health"] = 1,
  ["max_armor"] = 1,
  ["godmode"] = 1,
  ["infStamina"] = 1,
  ["invisibility"] = 2,
  ["neverWanted"] = 1,
  ["increase_wanted"] = 1,
  ["clear_wanted"] = 1,
  ["fastSwim"] = 1,
  ["fastSprint"] = 1,
  ["superJump"] = 1,
  ["noRagDoll"] = 1,
  ["give_all"] = 1,
  ["remove_all"] = 1,
  ["deleteGun"] = 3,
  ["fireAmmo"] = 1,
  ["oneShotKill"] = 1,
  ["explossiveAmmo"] = 1,
  ["infiniteAmmo"] = 1,
  ["teleportGun"] = 2,
  ["vehicleGun"] = 2,
  ["whaleGun"] = 3,
}

Config.color = {
  blue = {0, 0, 255},
  red = {255, 0, 0}
}

-- Is identifier in admins list?
function isAdmin(identifier)
  identifier = string.lower(identifier)
  local identifier2 = string.upper(identifier)
  for _, v in pairs(admins) do
    if identifier == v[1] or identifier2 == v[1] then
      return true
    end
  end
  return false
end

-- Return de admin rank of a player
-- Returns 0 if player is not an admin
function getRank(id)
  local identifiers = GetPlayerIdentifiers(id)
  for i=1,#identifiers,1 do
    local identifier = string.lower(identifiers[i])
    local identifier2 = string.upper(identifiers[i])
    for _, v in pairs(admins) do
      if identifier == v[1] or identifier2 == v[1] then
        return v[2]
      end
    end
  end
  return 0
end

-- Is player an admin?
RegisterServerEvent("skadmin:isAdmin")
AddEventHandler("skadmin:isAdmin", function(id)
  local source = source
	local found = false
  local rank = getRank(id)
	if rank > 0 then
		TriggerClientEvent("skadmin:adminStatus",source,true, rank)
		found = true
	end
	if(not found)then
		TriggerClientEvent("skadmin:adminStatus",source,false, 0)
	end
end)


RegisterServerEvent("skadmin:getPermissions")
AddEventHandler("skadmin:getPermissions", function()
  TriggerClientEvent("skadmin:receivePermissions", source, Config.permissions)
end)

RegisterServerEvent("skadmin:getRank")
AddEventHandler("skadmin:getRank", function(id)
  TriggerClientEvent("skadmin:receiveRank", source, getRank(id))
end)

RegisterServerEvent("skadmin:getSettings")
AddEventHandler("skadmin:getSettings", function()
  TriggerClientEvent("skadmin:receiveSettings", source, Config.settings)
end)
