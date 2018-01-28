admin = false

RegisterNetEvent("skadmin:adminStatus")
AddEventHandler("skadmin:adminStatus", function(status)
  Citizen.Trace("Hello!!! :)")
  if status then
    admin = true
  end
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
    WarMenu.CreateSubMenu('spectate', 'admin_menu', 'Spectate Player')
    WarMenu.CreateSubMenu('kick', 'admin_menu', 'Kick Player')
    WarMenu.CreateSubMenu('teleport', 'admin_menu', 'Teleport to Player')

    while true do
        -- MAIN MENU
        if WarMenu.IsMenuOpened('main') then
          if admin == false then
              WarMenu.CloseMenu()
          elseif WarMenu.MenuButton('Admin Options', 'admin_menu') then
          elseif WarMenu.MenuButton('Admin Trainer', 'trainer_menu') then
          elseif WarMenu.MenuButton('Exit', 'closeMenu') then
          end

          WarMenu.Display()
        -- ADMIN MENU
        elseif WarMenu.IsMenuOpened('admin_menu') then
          if WarMenu.MenuButton('Kick Player', 'kick') then

          end
          WarMenu.Display()
        -- CLOSE MENU
        elseif WarMenu.IsMenuOpened('closeMenu') then
            if WarMenu.Button('Yes') then
                WarMenu.CloseMenu()
            elseif WarMenu.MenuButton('No', 'main') then
            end

            WarMenu.Display()
        elseif IsControlJustReleased(0, 244) then --M by default
            WarMenu.OpenMenu('main')
        end

        Citizen.Wait(0)
    end
end)
