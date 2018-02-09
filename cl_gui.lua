Citizen.CreateThread(function()

    -- MAIN MENU
    WarMenu.CreateMenu('main', 'SK Admin')
    WarMenu.CreateSubMenu('admin_menu', 'main', 'Admin Menu')
    WarMenu.CreateSubMenu('teleport_menu', 'main', 'Teleport Menu')
    WarMenu.CreateSubMenu('player_menu', 'main', 'Player Menu')
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
    local noclip = false
    local godmode = false
    local infinite_stamina = false
    local invisibility = false
    local drunkMode =  false
    local silentMode =  false
    local allIgnore = false
    local policeIgnore = false
    local nerverWanted = false
    local fastSwim =  false
    local fastRun = false
    local superJump =  false
    local noRagDoll = false
    local nightVision = false
    local thermalVision = false

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
            elseif havePermissions("godmode") and WarMenu.CheckBox("Godmode", godmode, function(checked) godmode = checked end) then
              TriggerServerEvent("skadmin:svtoggleGodmode",GetPlayerServerId(source))
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
