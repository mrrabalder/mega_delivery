
Config = {}

Config.ShowBlip = true -- Sätt till false om du inte vill visa blippen
Config.NPCBlip = {
    sprite = 280,          -- Ändra till valfri blip (t.ex. 1 = röd prick, 514 = paket)
    scale = 0.8,
    color = 52,
    name = "Greger"
}


Config.DeliveryPoints = {

    vector3(252.0, -1003.0, 29.3),
    vector3(-500.0, -200.0, 34.0),
    vector3(100.0, -1500.0, 29.0),
    vector3(450.0, -660.0, 28.5),
    vector3(115.0, -785.0, 31.3),
    vector3(-132.0, -1307.0, 29.2),
    vector3(-670.0, -880.0, 24.5),
    vector3(-815.0, -1120.0, 7.0),
    vector3(-1030.0, -2730.0, 20.2),
    vector3(845.0, -1025.0, 28.5),
    vector3(1250.0, -1600.0, 52.5),
    vector3(1200.0, -400.0, 68.0),
    vector3(610.0, -175.0, 72.2),
    vector3(295.0, 150.0, 104.3),
    vector3(-300.0, 190.0, 85.0),
    vector3(-800.0, 200.0, 76.0),
    vector3(-1000.0, -500.0, 37.5),
    vector3(-1500.0, -700.0, 25.0),
    vector3(1000.0, -2000.0, 30.0),
    vector3(1350.0, -2400.0, 45.0)
}

Config.Cooldown = 60 * 5 -- 5 minuter
Config.Payment = 750 -- Bankpengar

-- 'money', 'item', eller 'random'
Config.RewardType = 'random'

Config.PaymentType = 'cash'


Config.RewardItems = {
    { item = "repairkit", amount = 1 },
    { item = "bandage", amount = 2 },
    { item = "lockpick", amount = 1 },
    { item = "water", amount = 3 }
}

Config.NPC = {
    model = 's_m_m_postal_01',
    coords = vector4(109.29, -1087.67, 28.3, 341.79)
}

Config.PickupPoints = {
    vector3(142.0, -1065.0, 29.2),
    vector3(305.0, -1440.0, 29.9),
    vector3(-320.0, -1545.0, 27.5),
    vector3(-635.0, -1225.0, 11.8),
    vector3(215.0, -810.0, 30.7)
}
