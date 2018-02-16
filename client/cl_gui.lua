Citizen.CreateThread(function()

    -- MAIN MENU
    WarMenu.CreateMenu('main', 'SK Admin')
    WarMenu.CreateSubMenu('admin_menu', 'main', 'Admin Menu')
    WarMenu.CreateSubMenu('teleport_menu', 'main', 'Teleport Menu')
    WarMenu.CreateSubMenu('player_menu', 'main', 'Player Menu')
    WarMenu.CreateSubMenu('weapon_menu', 'main', 'Weapon Menu')
    WarMenu.CreateSubMenu('closeMenu', 'main', 'Are you sure?')
    -- ADMIN MENU
    WarMenu.CreateSubMenu('server_management', 'admin_menu', 'Server Management')
    WarMenu.CreateSubMenu('kick', 'admin_menu', 'Kick Player')
    WarMenu.CreateSubMenu('ban', 'admin_menu', 'Ban Player')
    WarMenu.CreateSubMenu('unban', 'admin_menu', 'Unban Player')
    WarMenu.CreateSubMenu('spectate', 'admin_menu', 'Spectate Player')
    -- SERVER MANAGEMENT
    WarMenu.CreateSubMenu('restart', 'server_management', 'Restart Resource')
    WarMenu.CreateSubMenu('start', 'server_management', 'Start Resource')
    WarMenu.CreateSubMenu('stop', 'server_management', 'Stop Resource')
    WarMenu.CreateSubMenu('game_type', 'server_management', 'Set Game Type')
    WarMenu.CreateSubMenu('map_name', 'server_management', 'Set Map Name')
    -- TELEPORT MENU
    WarMenu.CreateSubMenu('teleport_player', 'teleport_menu', 'Teleport to Player')
    WarMenu.CreateSubMenu('teleport_point', 'teleport_menu', 'Teleport to WayPoint')
    -- PLAYER MENU
    WarMenu.CreateSubMenu('increase_wanted', 'player_menu', 'Increase Wanted Level')
    WarMenu.CreateSubMenu('clear_wanted', 'player_menu', 'Clear Wanted Level')
    WarMenu.CreateSubMenu('max_health', 'player_menu', 'Max Health')
    WarMenu.CreateSubMenu('max_armor', 'player_menu', 'Max Armor')
    local noclip = false
    local godmode = false
    local infinite_stamina = false
    local invisibility = false
    local policeIgnore = false
    local nerverWanted = false
    local fastSwim =  false
    local fastRun = false
    local superJump =  false
    local noRagDoll = false
    local nightVision = false
    local thermalVision = false
    -- WEAPON MENU
    WarMenu.CreateSubMenu('give_all', 'weapon_menu', 'Give All Weapons')
    WarMenu.CreateSubMenu('remove_all', 'weapon_menu', 'Remove All Weapons')
    WarMenu.CreateSubMenu('explosiveAmmo_menu', 'weapon_menu', 'Fire Ammo')
    WarMenu.CreateSubMenu('explosion_type', 'explosiveAmmo_menu', 'Explosion Type')
    local deleteGun = false
    local fireAmmo = false
    local oneShotKill = false
    local explossiveAmmo = false
    local infiniteAmmo = false
    local teleportGun = false
    local vehicleGun = false
    local whaleGun = false

    while true do
        -- ---------------------------------------------------------------------
        -- MAIN MENU
        -- ---------------------------------------------------------------------
        if WarMenu.IsMenuOpened('main') then
          if admin == false then
              WarMenu.CloseMenu()
          elseif WarMenu.MenuButton('Admin Options', 'admin_menu') then
          elseif WarMenu.MenuButton('Teleport Menu', 'teleport_menu') then
          elseif WarMenu.MenuButton('Player Menu', 'player_menu') then
          elseif WarMenu.MenuButton('Weapon Menu', 'weapon_menu') then
          elseif WarMenu.MenuButton('Exit', 'closeMenu') then
          end

          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- ADMIN MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('admin_menu') then
          if havePermissions("server_management") and WarMenu.MenuButton('Server Management', 'server_management') then
          elseif havePermissions("kick") and WarMenu.MenuButton('Kick Player', 'kick') then
          elseif havePermissions("ban") and WarMenu.MenuButton('Ban Player', 'ban') then
          elseif havePermissions("unban") and WarMenu.MenuButton('Unban Player', 'unban') then
          elseif havePermissions("spectate") and WarMenu.MenuButton('Spectate Player', 'spectate') then
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- SERVER MANAGEMENT MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('server_management') then
          if havePermissions("server_management") and WarMenu.MenuButton('Restart Resource', 'restart') then
          elseif havePermissions("server_management") and WarMenu.MenuButton('Start Resource', 'start') then
          elseif havePermissions("server_management") and WarMenu.MenuButton('Stop Resource', 'stop') then
          elseif havePermissions("server_management") and WarMenu.MenuButton('Set Game Type', 'game_type') then
          elseif havePermissions("server_management") and WarMenu.MenuButton('Set Map Name', 'map_name') then
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- TELEPORT MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('teleport_menu') then
          if havePermissions("teleport_player") and WarMenu.MenuButton('Teleport to Player', 'teleport_player') then
          elseif havePermissions("teleport_waypoint") and WarMenu.MenuButton('Teleport to WayPoint', 'teleport_point') then
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- PLAYER MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('player_menu') then
          if havePermissions("noclip") and WarMenu.CheckBox("Noclip", noclip, function(checked) noclip = checked end) then
            toggleNoClipMode()
            WarMenu.CloseMenu()
          elseif havePermissions("max_health") and WarMenu.MenuButton('Max Health', 'max_health') then
            TriggerServerEvent("skadmin:svmaxHealth",GetPlayerServerId(source))
            WarMenu.OpenMenu('player_menu')
          elseif havePermissions("max_armor") and WarMenu.MenuButton('Max Amor', 'max_armor') then
            TriggerServerEvent("skadmin:svmaxArmor",GetPlayerServerId(source))
            WarMenu.OpenMenu('player_menu')
          elseif havePermissions("godmode") and WarMenu.CheckBox("God Mode", godmode, function(checked) godmode = checked end) then
            TriggerServerEvent("skadmin:svtoggleGodmode",GetPlayerServerId(source))
          elseif havePermissions("infStamina") and WarMenu.CheckBox("Infinite Stamina", infinite_stamina, function(checked) infinite_stamina = checked end) then
            TriggerServerEvent("skadmin:svtoggleInfStamina",GetPlayerServerId(source))
          elseif havePermissions("invisibility") and WarMenu.CheckBox("Invisibility", invisibility, function(checked) invisibility = checked end) then
            TriggerServerEvent("skadmin:svtoggleInvisibility",GetPlayerServerId(source))
          elseif havePermissions("increase_wanted") and WarMenu.MenuButton('Increase Wanted Level', 'increase_wanted') then
            TriggerServerEvent("skadmin:svincreaseWantedLevel",GetPlayerServerId(source))
            WarMenu.OpenMenu('player_menu')
          elseif havePermissions("clear_wanted") and WarMenu.MenuButton('Clear Wanted Level', 'clear_wanted') then
            TriggerServerEvent("skadmin:svclearWantedLevel",GetPlayerServerId(source))
            WarMenu.OpenMenu('player_menu')
          elseif havePermissions("neverWanted") and WarMenu.CheckBox("Never Wanted", neverWanted, function(checked) neverWanted = checked end) then
            TriggerServerEvent("skadmin:svtoggleNeverWanted",GetPlayerServerId(source))
          elseif havePermissions("fastSwim") and WarMenu.CheckBox("Fast Swim", fastSwim, function(checked) fastSwim = checked end) then
            TriggerServerEvent("skadmin:svtoggleFastSwim",GetPlayerServerId(source))
          elseif havePermissions("fastSprint") and WarMenu.CheckBox("Fast Sprint", fastSprint, function(checked) fastSprint = checked end) then
            TriggerServerEvent("skadmin:svtoggleFastSprint",GetPlayerServerId(source))
          elseif havePermissions("superJump") and WarMenu.CheckBox("Super Jump", superJump, function(checked) superJump = checked end) then
            TriggerServerEvent("skadmin:svtoggleSuperJump",GetPlayerServerId(source))
          elseif havePermissions("noRagDoll") and WarMenu.CheckBox("No Rag Doll", noRagDoll, function(checked) noRagDoll = checked end) then
            TriggerServerEvent("skadmin:svtoggleNoRagDoll",GetPlayerServerId(source))
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- WEAPON MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('weapon_menu') then
          if havePermissions("give_all") and WarMenu.MenuButton('Give All Weapons', 'give_all') then
            TriggerServerEvent("skadmin:svgiveAllWeapons",GetPlayerServerId(source))
            WarMenu.OpenMenu('weapon_menu')
          elseif havePermissions("remove_all") and WarMenu.MenuButton('Remove All Weapons', 'remove_all') then
            TriggerServerEvent("skadmin:svremoveAllWeapons",GetPlayerServerId(source))
            WarMenu.OpenMenu('weapon_menu')
          elseif havePermissions("deleteGun") and WarMenu.CheckBox("Delete Gun", deleteGun, function(checked) deleteGun = checked end) then
            TriggerServerEvent("skadmin:svtoggleDeleteGun",GetPlayerServerId(source))
          elseif havePermissions("teleportGun") and WarMenu.CheckBox("Teleport Gun", teleportGun, function(checked) teleportGun = checked end) then
            TriggerServerEvent("skadmin:svtoggleTeleportGun",GetPlayerServerId(source))
          elseif havePermissions("vehicleGun") and WarMenu.CheckBox("Vehicle Gun", vehicleGun, function(checked) vehicleGun = checked end) then
            TriggerServerEvent("skadmin:svtoggleVehicleGun",GetPlayerServerId(source))
          elseif havePermissions("whaleGun") and WarMenu.CheckBox("Whale Gun", whaleGun, function(checked) whaleGun = checked end) then
            TriggerServerEvent("skadmin:svtoggleWhaleGun",GetPlayerServerId(source))
          elseif havePermissions("explossiveAmmo") and WarMenu.MenuButton('Explosive Ammo', 'explosiveAmmo_menu') then
          elseif havePermissions("fireAmmo") and WarMenu.CheckBox("Fire Ammo", fireAmmo, function(checked) fireAmmo = checked end) then
            TriggerServerEvent("skadmin:svtoggleFireAmmo",GetPlayerServerId(source))
          elseif havePermissions("infiniteAmmo") and WarMenu.CheckBox("Infinite Ammo", infiniteAmmo, function(checked) infiniteAmmo = checked end) then
            TriggerServerEvent("skadmin:svtoggleInfiniteAmmo",GetPlayerServerId(source))
          elseif havePermissions("oneShotKill") and WarMenu.CheckBox("One Shot Kill", oneShotKill, function(checked) oneShotKill = checked end) then
            TriggerServerEvent("skadmin:svtoggleOneShotKill",GetPlayerServerId(source))
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- CLOSE MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('closeMenu') then
          if WarMenu.Button('Yes') then
              WarMenu.CloseMenu()
          elseif WarMenu.MenuButton('No', 'main') then
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- KICK PLAYER
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('kick') then
          local players = getOnlinePlayers()

          for i, player in ipairs(players) do
            TriggerServerEvent("skadmin:getRank", players[i]['serverID'])
            if WarMenu.MenuButton("["..players[i]['serverID'].."]"..players[i]['name'], 'kick') then
              TriggerEvent("chatMessage", "SKAdmin", {0, 0, 255}, "Insert the reason to kick.")
              DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP8', '', '', '', '', '', 128+1)
              while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                Citizen.Wait(0)
              end
              local result = GetOnscreenKeyboardResult()
              if result then
                TriggerServerEvent("skadmin:kickPlayer", players[i]['serverID'], result)
                WarMenu.OpenMenu('admin_menu')
              end
            end
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- BAN PLAYER
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('ban') then
          local players = getOnlinePlayers()

          for i, player in ipairs(players) do
            if WarMenu.MenuButton("["..players[i]['serverID'].."]"..players[i]['name'], 'ban') then
              TriggerEvent("chatMessage", "SKAdmin", {0, 0, 255}, "Insert the reason to ban.")
              DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP8', '', '', '', '', '', 128+1)
              while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                Citizen.Wait(0)
              end
              local result = GetOnscreenKeyboardResult()
              if result then
                TriggerServerEvent("skadmin:banPlayer", players[i], result)
                WarMenu.OpenMenu('admin_menu')
              end
            end
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- UNBAN PLAYER
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('unban') then
          TriggerServerEvent("skadmin:getBanList")
          if banlist ~= {} then
            for i, ban in ipairs(banlist) do
              if WarMenu.MenuButton(ban["name"], "unban") then
                TriggerServerEvent("skadmin:unbanPlayer", ban["license"], ban["name"])
                WarMenu.OpenMenu('admin_menu')
              end
            end
          else
            WarMenu.OpenMenu("admin_menu")
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- SPECTATE PLAYER
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('spectate') then
          local players = getOnlinePlayers()

          for i, player in ipairs(players) do
            if WarMenu.MenuButton("["..players[i]['serverID'].."]"..players[i]['name'], 'spectate') then
              spectatePlayer(players[i]['serverID'])
              WarMenu.CloseMenu()
            end
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- TELEPORT PLAYER
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('teleport_player') then
          local players = getOnlinePlayers()

          for i, player in ipairs(players) do
            if WarMenu.MenuButton("["..players[i]['serverID'].."]"..players[i]['name'], 'teleport_player') then
              teleportToPlayer(players[i]["id"])
              WarMenu.OpenMenu("teleport_menu")
            end
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- TELEPORT TO WAYPOINY
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('teleport_point') then
          teleportToWayPoint()
          WarMenu.OpenMenu("teleport_menu")
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- RESTART RESOURCE
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('restart') then
          TriggerEvent("chatMessage", "SKAdmin", {0, 0, 255}, "Insert the name of resource.")
          DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP8', '', '', '', '', '', 128+1)
          while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(0)
          end
          local result = GetOnscreenKeyboardResult()
          if result then
            TriggerServerEvent("skadmin:restartResource", result)
          end
          WarMenu.OpenMenu("admin_menu")
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- START RESOURCE
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('start') then
          TriggerEvent("chatMessage", "SKAdmin", {0, 0, 255}, "Insert the name of resource.")
          DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP8', '', '', '', '', '', 128+1)
          while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(0)
          end
          local result = GetOnscreenKeyboardResult()
          if result then
            TriggerServerEvent("skadmin:startResource", result)
          end
          WarMenu.OpenMenu("admin_menu")
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- STOP RESOURCE
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('stop') then
          TriggerEvent("chatMessage", "SKAdmin", {0, 0, 255}, "Insert the name of resource.")
          DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP8', '', '', '', '', '', 128+1)
          while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(0)
          end
          local result = GetOnscreenKeyboardResult()
          if result then
            TriggerServerEvent("skadmin:stopResource", result)
          end
          WarMenu.OpenMenu("admin_menu")
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- SET GAME TYPE
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('game_type') then
          TriggerEvent("chatMessage", "SKAdmin", {0, 0, 255}, "Insert game type.")
          DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP8', '', '', '', '', '', 128+1)
          while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(0)
          end
          local result = GetOnscreenKeyboardResult()
          if result then
            TriggerServerEvent("skadmin:setGameType", result)
          end
          WarMenu.OpenMenu("admin_menu")
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- SET MAP NAME
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('map_name') then
          TriggerEvent("chatMessage", "SKAdmin", {0, 0, 255}, "Insert map name.")
          DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP8', '', '', '', '', '', 128+1)
          while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(0)
          end
          local result = GetOnscreenKeyboardResult()
          if result then
            TriggerServerEvent("skadmin:setMapName", result)
          end
          WarMenu.OpenMenu("admin_menu")
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- EXPLOSION AMMO MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('explosiveAmmo_menu') then
          if havePermissions("explossiveAmmo") and WarMenu.CheckBox("Explosive Ammo", explossiveAmmo, function(checked) explossiveAmmo = checked end) then
            TriggerServerEvent("skadmin:svtoggleExplosiveAmmo",GetPlayerServerId(source))
          elseif havePermissions("explossiveAmmo") and WarMenu.MenuButton('Explosion Type', 'explosion_type') then
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- EXPLOSION TYPE
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('explosion_type') then
          for i, tup in ipairs(explosions) do
            if WarMenu.MenuButton(tup[1], 'explosion_type') then
              explosionType = tup[2]
              drawNotification("~b~Explosion ammo changed to " .. tup[1])
            end
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- OPEN MENU
        -- ---------------------------------------------------------------------
        elseif IsControlJustReleased(0, 244) then --M by default
          WarMenu.OpenMenu('main')
        end
        Citizen.Wait(0)
      end
end)

-- checks if a client haves permissions to use a commmand
-- perm is a string (ex.: "kick", "ban", etc..)
function havePermissions(perm)
  return rank >= permissions[perm]
end
