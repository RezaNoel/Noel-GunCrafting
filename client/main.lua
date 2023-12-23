ESX = nil
TriggerEvent(Config.ESX, function(obj) ESX = obj end)

------------------ Weapon Label -------------------
Weapons = { }
for i = 1, #Config.Weapons, 1 do
    Weapons[i] = {
        label = Config.Weapons[i].Label,
        value = Config.Weapons[i].Name,
        price = Config.Weapons[i].Price,
        items = Config.Weapons[i].Items
    }
end

Citizen.CreateThread(function()
        local myBlip = AddBlipForCoord(Config.Marker.x, Config.Marker.y, Config.Marker.z)
        SetBlipSprite(myBlip, Config.Blip.id)
        SetBlipDisplay(myBlip, 4)
        SetBlipScale(myBlip, Config.Blip.scale)
        SetBlipColour(myBlip, Config.Blip.color)
        SetBlipAsShortRange(myBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.title)
        EndTextCommandSetBlipName(myBlip)
end)

CreateThread(function()
    while true do
        Wait(0)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local distance = Vdist(pedCoords.x, pedCoords.y, pedCoords.z, Config.Marker.x, Config.Marker.y, Config.Marker.z)
        DrawMarker(Config.Marker.type, Config.Marker.x, Config.Marker.y, Config.Marker.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 0, 255,0, 50, false, true, 2, nil, nil, false)

        if ( distance <= 1 ) then
            ShowAlert("~b~Press ~INPUT_PICKUP~ For Start")
            if ( distance <= 1 ) and IsControlJustReleased(0, Config.Key) then
                GiveWeaponMenu()
            end
        end
    end 
end)

