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
    WarMenu.CreateSubMenu('admin_menu', 'main', 'Admin Options')
    WarMenu.CreateSubMenu('trainer_menu', 'main', 'Admin Trainer')
    WarMenu.CreateSubMenu('closeMenu', 'main', 'Are you sure?')
    -- ADMIN Menu
    WarMenu.CreateSubMenu('kick', 'admin_menu', 'Kick Player')
    WarMenu.CreateSubMenu('ban', 'admin_menu', 'Ban Player')
    WarMenu.CreateSubMenu('unban', 'admin_menu', 'Unban Player')
    WarMenu.CreateSubMenu('spectate', 'admin_menu', 'Spectate Player')
    WarMenu.CreateSubMenu('teleport', 'admin_menu', 'Teleport to Player')

    while true do
        -- ---------------------------------------------------------------------
        -- MAIN MENU
        -- ---------------------------------------------------------------------
        if WarMenu.IsMenuOpened('main') then
          if admin == false then
              WarMenu.CloseMenu()
          elseif WarMenu.MenuButton('Admin Options', 'admin_menu') then
          elseif WarMenu.MenuButton('Admin Trainer', 'trainer_menu') then
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
              Citizen.Trace("name: " .. ban["name"].. " " .. i)
              if WarMenu.MenuButton(ban["name"], "unban") then
                TriggerServerEvent("skadmin:unbanPlayer", ban["license"], ban["name"])
                WarMenu.OpenMenu('admin_menu')
              end
            end
          else
            WarMenu.OpenMenu("admin_menu")
          end
          WarMenu.Display()
        elseif IsControlJustReleased(0, 244) then --M by default
          WarMenu.OpenMenu('main')
        end

        Citizen.Wait(0)
    end
end)
