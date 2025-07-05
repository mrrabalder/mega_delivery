QBCore = exports['qb-core']:GetCoreObject()
local cooldowns = {}

RegisterNetEvent('mega_delivery:tryStart', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid

    if cooldowns[cid] and os.time() < cooldowns[cid] then
        local remain = cooldowns[cid] - os.time()
        local message = Config.Text[Config.Locale].cooldown_wait:format(math.ceil(remain / 60))
        TriggerClientEvent('QBCore:Notify', src, message, 'error')
        return
    end

    local randomLoc = Config.DeliveryPoints[math.random(#Config.DeliveryPoints)]
    cooldowns[cid] = os.time() + Config.Cooldown

    TriggerClientEvent('mega_delivery:start', src, randomLoc)
end)

RegisterNetEvent('mega_delivery:checkItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local locale = Config.Text[Config.Locale]

    if Config.RewardType == 'money' then
        Player.Functions.AddMoney('cash', Config.Payment)
        TriggerClientEvent('QBCore:Notify', src, locale.reward_money:format(Config.Payment), 'success')

    elseif Config.RewardType == 'item' then
        local reward = Config.RewardItems[math.random(#Config.RewardItems)]
        Player.Functions.AddItem(reward.item, reward.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward.item], "add")
        local label = QBCore.Shared.Items[reward.item].label
        TriggerClientEvent('QBCore:Notify', src, locale.reward_item:format(reward.amount, label), 'success')

    elseif Config.RewardType == 'random' then
        if math.random() < 0.5 then
            Player.Functions.AddMoney('cash', Config.Payment)
            TriggerClientEvent('QBCore:Notify', src, locale.reward_money:format(Config.Payment), 'success')
        else
            local reward = Config.RewardItems[math.random(#Config.RewardItems)]
            Player.Functions.AddItem(reward.item, reward.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward.item], "add")
            local label = QBCore.Shared.Items[reward.item].label
            TriggerClientEvent('QBCore:Notify', src, locale.reward_item:format(reward.amount, label), 'success')
        end
    end
end)