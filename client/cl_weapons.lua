local deleteGun = false
local fireAmmo = false
local oneShotKill = false
local explossiveAmmo = false
local infiniteAmmo = false
local teleportGun = false
local vehicleGun = false
local whaleGun = false

-- GIVE ALL WEAPONS
RegisterNetEvent("skadmin:giveAllWeapons")
AddEventHandler("skadmin:giveAllWeapons", function()

  local Melee = {
  	-1716189206, 1737195953, 1317494643, -1786099057, -2067956739, 1141786504, -102323637, -102323637,
  	-102973651, -656458692, -581044007, -1951375401, -538741184, -1810795771, 419712736, -853065399
  }
  local Handguns = {
  	453432689, 1593441988, -1716589765, -1076751822, -771403250, 137902532,
  	-598887786, -1045183535, 584646201, 911657153, 1198879012, 3219281620
  }
  local MachineGuns = {
  	324215364,  -619010992, 736523883, -270015777, 171789620, -1660422300, 2144741730,
  	1627465347, -1121678507, 2024373456, 3686625920
	}
  local AssaultRifles = {
		-1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 1649403952,
		961495388, 4208062921
	}
  local SniperRifles = {
		100416529, 205991906, -952879014, 177293209
 }
  local Shotguns = {
		487013001, 2017895192, -1654528753, -494615257, -1466123874, 984333226, -275439685, 317205821
	}
  local HeavyWeapons = {
		-1568386805, -1312131151, 1119849093, 2138347493, 1834241177, 1672152130, 125959754
	}
  local ThrownWeapons = {
		-1813897027, 741814745, -1420407917, -1600701090, 615608432, 101631238, 883325847, 1233104067,
		 600439132, 126349499, -37975472, -1169823560
   }
  local Parachute = {
  	-72657034
	}

  for k,v in pairs(Melee) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(Handguns) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(MachineGuns) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(AssaultRifles) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(SniperRifles) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(Shotguns) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(ThrownWeapons) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(HeavyWeapons) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end
  for k,v in pairs(Parachute) do
    GiveWeaponToPed(GetPlayerPed(-1), v, 99999, false, false)
  end

  drawNotification("~b~All weapons given.")
end)

-- REMOVE ALL WEAPONS
RegisterNetEvent("skadmin:removeAllWeapons")
AddEventHandler("skadmin:removeAllWeapons", function()
  RemoveAllPedWeapons(GetPlayerPed(-1), true)
  drawNotification("~b~All weapons removed.")
end)

-- DELETE GUN
RegisterNetEvent("skadmin:toggleDeleteGun")
AddEventHandler("skadmin:toggleDeleteGun", function()
  deleteGun = not deleteGun
  if deleteGun then
    drawNotification("~b~Delete gun activated.")
  else
    drawNotification("~r~Delete gun deactivated.")
  end
end)

-- FIRE AMMO
RegisterNetEvent("skadmin:toggleFireAmmo")
AddEventHandler("skadmin:toggleFireAmmo", function()
  fireAmmo = not fireAmmo
  if fireAmmo then
    drawNotification("~b~Fire Ammo activated.")
  else
    drawNotification("~r~Fire Ammo deactivated.")
  end
end)

-- ONE SHOT KILL
RegisterNetEvent("skadmin:toggleOneShotKill")
AddEventHandler("skadmin:toggleOneShotKill", function()
  oneShotKill = not oneShotKill
  if oneShotKill then
    SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
    drawNotification("~b~One Shot Kill activated.")
  else
    SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
    drawNotification("~r~One Shot Kill deactivated.")
  end
end)

-- EXPLOSIVE AMMO
RegisterNetEvent("skadmin:toggleExplosiveAmmo")
AddEventHandler("skadmin:toggleExplosiveAmmo", function()
  explossiveAmmo = not explossiveAmmo
  if explossiveAmmo then
    drawNotification("~b~Explosive Ammo activated.")
  else
    drawNotification("~r~Explosive Ammo deactivated.")
  end
end)

-- INFINITE AMMO
RegisterNetEvent("skadmin:toggleInfiniteAmmo")
AddEventHandler("skadmin:toggleInfiniteAmmo", function()
  infiniteAmmo = not infiniteAmmo
  if infiniteAmmo then
    drawNotification("~b~Infinite Ammo activated.")
  else
    drawNotification("~r~Infinite Ammo deactivated.")
  end
end)

-- TELEOPORT GUN
RegisterNetEvent("skadmin:toggleTeleportGun")
AddEventHandler("skadmin:toggleTeleportGun", function()
  teleportGun = not teleportGun
  if teleportGun then
    drawNotification("~b~Teleport Gun activated.")
  else
    drawNotification("~r~Teleport Gun deactivated.")
  end
end)

-- VEHICLE GUN
RegisterNetEvent("skadmin:toggleVehicleGun")
AddEventHandler("skadmin:toggleVehicleGun", function()
  vehicleGun = not vehicleGun
  if vehicleGun then
    drawNotification("~b~Vehicle Gun activated.")
  else
    drawNotification("~r~Vehicle Gun deactivated.")
  end
end)

-- WHALE GUN
RegisterNetEvent("skadmin:toggleWhaleGun")
AddEventHandler("skadmin:toggleWhaleGun", function()
  whaleGun = not whaleGun
  if whaleGun then
    drawNotification("~b~Whale Gun activated.")
  else
    drawNotification("~r~Whale Gun deactivated.")
  end
end)

Citizen.CreateThread(function() -- Delete Gun
  while true do
    Citizen.Wait(0)

    if deleteGun then
      if IsPlayerFreeAiming(PlayerId()) then
        local entity = getEntity(PlayerId())
        if IsPedShooting(GetPlayerPed(-1)) then
          SetEntityAsMissionEntity(entity, true, true)
          DeleteEntity(entity)
        end
      end
    end
  end
end)

Citizen.CreateThread(function() -- Fire Ammo
  while true do
    Citizen.Wait(0)

    if fireAmmo then
      SetFireAmmoThisFrame(PlayerId())
    end
  end
end)

Citizen.CreateThread(function() -- One Shot Kill
  while true do
    Citizen.Wait(0)

    if oneShotKill then
      if IsPlayerFreeAiming(PlayerId()) then
        local entity = getEntity(PlayerId())
        if IsPedShooting(GetPlayerPed(-1)) then
          if IsEntityAVehicle(entity) then
            Citizen.Trace("veh")
            NetworkExplodeVehicle(entity, true, true, 0)
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function() -- Explosive Ammo
  while true do
    Citizen.Wait(0)

    if explossiveAmmo then
      SetExplosiveAmmoThisFrame(PlayerId())
      local x,y,z = table.unpack(bulletCoords())
      if x ~= 0 and y ~= 0 and z ~= 0 then
        AddOwnedExplosion(GetPlayerPed(-1), x, y, z, explosionType, 20.0, true, false, 0.0)
      end
    end
  end
end)

Citizen.CreateThread(function() -- INFINITE Ammo
  while true do
    Citizen.Wait(0)

    if infiniteAmmo then
      SetPedInfiniteAmmo(GetPlayerPed(-1), true)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
			SetPedAmmo(GetPlayerPed(-1), (GetSelectedPedWeapon(GetPlayerPed(-1))), 99999)
    else
      SetPedInfiniteAmmo(GetPlayerPed(-1), false)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), false)
    end
  end
end)

Citizen.CreateThread(function() -- Teleport Gun
  while true do
    Citizen.Wait(0)

    if teleportGun then
      local x,y,z = table.unpack(bulletCoords())
      if x ~= 0 and y ~= 0 and z ~= 0 then
        SetEntityCoords(GetPlayerPed(-1), x,y,z)
      end
    end
  end
end)

Citizen.CreateThread(function() -- Vehicle Gun
  while true do
    Citizen.Wait(0)

    if vehicleGun then
      if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
        if IsPedShooting(GetPlayerPed(-1)) then
          while not HasModelLoaded(GetHashKey(vehicleGunVehicle)) do
						Citizen.Wait(0)
						RequestModel(GetHashKey(vehicleGunVehicle))
          end
          local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
          local veh =  CreateVehicle(GetHashKey(vehicleGunVehicle), playerPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), getGroundZ(playerPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), playerPos.z + 5), GetEntityHeading(GetPlayerPed(-1)), true, true)
          SetEntityAsNoLongerNeeded(veh)
          SetVehicleForwardSpeed(veh, 150.0)
        end
      end
    end
  end
end)

Citizen.CreateThread(function() --Whale Gun
	while true do
		Citizen.Wait(0)

		if whaleGun then
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
			if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
				if IsPedShooting(GetPlayerPed(-1)) then
					if not HasModelLoaded(GetHashKey("a_c_humpback")) then
						RequestModel(GetHashKey("a_c_humpback"))
						while not HasModelLoaded(GetHashKey("a_c_humpback")) do
							Citizen.Wait(0)
						end
					end
					local whale = CreatePed(28, GetHashKey("a_c_humpback"), playerPedPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z, GetEntityHeading(GetPlayerPed(-1)), true, true)
					SetEntityAsNoLongerNeeded(whale)
					ApplyForceToEntity(whale, 1, GetEntityForwardX(whale) * 1000, GetEntityForwardY(whale) * 1000, 0.0, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
				end
			end
		end
	end
end)
