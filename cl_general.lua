Citizen.CreateThread(function()
  while true do
    TriggerServerEvent("skadmin:getBanList")
    Citizen.Wait(10000) -- 10 seconds
  end
end)
