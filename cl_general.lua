function drawNotification(string)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(string)
  DrawNotification(true, false)
end

function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function getTableLength(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end

Citizen.CreateThread(function()
  while true do
    TriggerServerEvent("skadmin:getBanList")
    Citizen.Wait(10000) -- 10 seconds
  end
end)
