Config = {}

Config.Key =  38 --E

Config.ESX = 'esx:getSharedObject' --your own getSharedObject

Config.Cost = {bank=false,cash=true,item=true} -- bank or cash , item

Config.Marker = {
    type = 2,
    x = 1286.55,
    y = -1604.02,
    z = 54.82
}

Config.Blip = {
    title = "GunCrafting",
    color = 61,
    id = 567,
    scale = 1.0
}

Config.Weapons = {
    { Name = 'weapon_sawnoffshotgun', Label = 'Shotgun',     Price = 2000, Items = { { name = 'gold', count = 3 }, { name = 'iron', count = 10 } } },
    { Name = 'weapon_snspistol',      Label = 'SNS Pistol',  Price = 0,  Items = { { name = 'iron', count = 5 } } }
}