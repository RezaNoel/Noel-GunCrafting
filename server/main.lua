-- function TakeMoney(Value)
--     xPlayer.removeAccountMoney(account, money)
-- end

ESX = nil
TriggerEvent(Config.ESX, function(obj) ESX = obj end)

RegisterServerEvent('noelguncrafting:removemoney')
AddEventHandler('noelguncrafting:removemoney', function(target, amount)
    local _source = target
    local xPlayer = ESX.GetPlayerFromId(_source)
    amount = tonumber(amount)
    if not tonumber(amount) then return end
    amount = ESX.Math.Round(amount)
    if Config.Cost.cash then
        xPlayer.removeMoney(amount)
    elseif Config.Cost.bank then
        xPlayer.removeBank(amount)
    end
end)

RegisterServerEvent('noelguncrafting:removeitem')
AddEventHandler('noelguncrafting:removeitem', function(target, item, count)
    local _source = target
    local xPlayer = ESX.GetPlayerFromId(_source)
    count = tonumber(count)
    if not tonumber(count) then return end
    count = ESX.Math.Round(count)
    xPlayer.removeInventoryItem(item, count)
end)

