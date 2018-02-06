local admin = false
local banlist = {}

RegisterNetEvent("skadmin:adminStatus")
AddEventHandler("skadmin:adminStatus", function(status)
  if status then
    admin = true
  end
end)

RegisterNetEvent("skadmin:updateGuiBanList")
AddEventHandler("skadmin:updateGuiBanList", function(table)
  banlist = table
end)

Citizen.CreateThread(function()
    TriggerServerEvent("skadmin:isAdmin")

    -- MAIN MENU
    WarMenu.CreateMenu('main', 'SK Admin')
    WarMenu.CreateSubMenu('admin_menu', 'main', 'Admin Menu')
    WarMenu.CreateSubMenu('teleport_menu', 'main', 'Teleport Menu')
    WarMenu.CreateSubMenu('player_menu', 'main', 'Player Menu')
    WarMenu.CreateSubMenu('closeMenu', 'main', 'Are you sure?')
    -- ADMIN MENU
    WarMenu.CreateSubMenu('kick', 'admin_menu', 'Kick Player')
    WarMenu.CreateSubMenu('ban', 'admin_menu', 'Ban Player')
    WarMenu.CreateSubMenu('unban', 'admin_menu', 'Unban Player')
    WarMenu.CreateSubMenu('spectate', 'admin_menu', 'Spectate Player')
    -- TELEPORT MENU
    WarMenu.CreateSubMenu('teleport_player', 'teleport_menu', 'Teleport to Player')
    WarMenu.CreateSubMenu('teleport_point', 'teleport_menu', 'Teleport to WayPoint')
    -- PLAYER MENU
    local noclip = false

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
          if WarMenu.MenuButton('Kick Player', 'kick') then
          elseif WarMenu.MenuButton('Ban Player', 'ban') then
          elseif WarMenu.MenuButton('Unban Player', 'unban') then
          elseif WarMenu.MenuButton('Spectate Player', 'spectate') then
          end
          WarMenu.Display()
        -- ---------------------------------------------------------------------
        -- TELEPORT MENU
        -- ---------------------------------------------------------------------
        elseif WarMenu.IsMenuOpened('teleport_menu') then
          if WarMenu.MenuButton('Teleport to Player', 'teleport_player') then
          elseif WarMenu.MenuButton('Teleport to WayPoint', 'teleport_point') then
          end
          WarMenu.Display()
          -- ---------------------------------------------------------------------
          -- PLAYER MENU
          -- ---------------------------------------------------------------------
          elseif WarMenu.IsMenuOpened('player_menu') then
            if WarMenu.CheckBox("Noclip", noclip, function(checked) noclip = checked end) then
              toggleNoClipMode()
              WarMenu.CloseMenu()
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
            if WarMenu.MenuButton("["..players[i]['serverID'].."]"..players[i]['name'], 'kick') then
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
        -- OPEN MENU
        -- ---------------------------------------------------------------------
        elseif IsControlJustReleased(0, 244) then --M by default
          WarMenu.OpenMenu('main')
        end
        Citizen.Wait(0)
      end
end)
