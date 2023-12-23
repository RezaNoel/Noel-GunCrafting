
function ShowAlert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ShowNotification(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function GiveWeapon(weapon)
    local playerPed = GetPlayerPed(-1)
    local weaponHash = GetHashKey(weapon)
    local ammoCount = 9999
    GiveWeaponToPed(playerPed, weaponHash, ammoCount, false)
end

function GiveWeaponMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weaponmenu', {
            title = 'Craft Gun',
            align = 'top-left',
            elements = Weapons
        },
        function(data, menu)
            for i = 1, #Weapons, 1 do
                if data.current.value == Weapons[i].value then
                    GiveWeapon(data.current.value)
                    TriggerServerEvent("noelguncrafting:removemoney", GetPlayerServerId(PlayerId()), Weapons[i].price)
                    for j=1,#Weapons[i].items,1 do
                        TriggerServerEvent("noelguncrafting:removeitem", GetPlayerServerId(PlayerId()),
                            Weapons[i].items[j].name, Weapons[i].items[j].count)
                    end
                end
            end
            menu.close()
        end, function(data, menu) menu.close() end)
end

