local admins = {
  "steam:1100001018397d5",
  "ip:127.0.0.1",
}

Config = {}
Config.settings = {
    saves_directory = "skadmin_saves/", -- Extremely important: this directory must be created in server-data
    banlist_file = "banlist.txt",
    event_messages = 1, -- Event messages in server chat (ban, kick, etc..). Change to nil if you want to desactivate, to 1 if want it active.
    event_messages_console = 1 -- Event messages in the console
}

Config.color = {
  blue = {0, 0, 255}
}

-- Is identifier in admins list?
function isAdmin(identifier)
	local adminList = {}
	for _,v in pairs(admins) do
		adminList[v] = true
	end
	identifier = string.lower(identifier)
	identifier2 = string.upper(identifier)

	if(adminList[identifier] or adminList[identifier2])then
		return true
	else
		return false
	end
end

-- Is player an admin?
RegisterServerEvent("skadmin:isAdmin")
AddEventHandler("skadmin:isAdmin", function()
  local source = source
	local identifiers = GetPlayerIdentifiers(source)
	local found = false
	for i=1,#identifiers,1 do
		if(isAdmin(identifiers[i]))then
			TriggerClientEvent("skadmin:adminStatus",source,true)
			found = true
			break
		end
	end
	if(not found)then
		TriggerClientEvent("skadmin:adminStatus",source,false)
	end
end)
