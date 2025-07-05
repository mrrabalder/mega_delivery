local lang = Config.Text[Config.Locale]
local deliveryBlip = nil
local deliveryProp = nil
local deliveryCoords = nil
local interacting = false
local returnToNpc = false
local npcCoords = Config.NPC.coords.xyz

RegisterNetEvent('mega_delivery:start')
AddEventHandler('mega_delivery:start', function(location)
    deliveryCoords = location

    deliveryBlip = AddBlipForCoord(location)
    SetBlipSprite(deliveryBlip, 478)
    SetBlipColour(deliveryBlip, 2)
    SetBlipScale(deliveryBlip, 0.8)
    SetBlipAsShortRange(deliveryBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(lang.pickup)
    EndTextCommandSetBlipName(deliveryBlip)
    SetBlipRoute(deliveryBlip, true)

    exports.ox_lib:notify({ type = 'inform', description = lang.pickup })

    CreateThread(function()
        while true do
            Wait(0)
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)

            if not returnToNpc and #(coords - deliveryCoords) < 2.5 then
                if not interacting then
                    interacting = true
                    exports.ox_lib:showTextUI('[E] ' .. lang.pickup)
                end

                if IsControlJustReleased(0, 38) then
                    exports.ox_lib:hideTextUI()
                    interacting = false

                    local propModel = `prop_cs_cardbox_01`
                    RequestModel(propModel)
                    while not HasModelLoaded(propModel) do Wait(10) end

                    deliveryProp = CreateObject(propModel, coords.x, coords.y, coords.z, true, true, false)
                    FreezeEntityPosition(deliveryProp, true)
                    SetEntityAsMissionEntity(deliveryProp, true, true)

                    RemoveBlip(deliveryBlip)

                    deliveryBlip = AddBlipForCoord(npcCoords)
                    SetBlipSprite(deliveryBlip, 478)
                    SetBlipColour(deliveryBlip, 5)
                    SetBlipScale(deliveryBlip, 0.8)
                    SetBlipAsShortRange(deliveryBlip, false)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(lang.deliver)
                    EndTextCommandSetBlipName(deliveryBlip)
                    SetBlipRoute(deliveryBlip, true)

                    returnToNpc = true
                    exports.ox_lib:notify({ type = 'inform', description = lang.deliver })
                end
            elseif returnToNpc and #(coords - npcCoords) < 2.5 then
                if not interacting then
                    interacting = true
                    exports.ox_lib:showTextUI('[E] ' .. lang.deliver)
                end

                if IsControlJustReleased(0, 38) then
                    exports.ox_lib:hideTextUI()
                    interacting = false
                    RemoveBlip(deliveryBlip)
                    DeleteEntity(deliveryProp)
                    deliveryProp = nil
                    returnToNpc = false
                    deliveryCoords = nil
                    TriggerServerEvent('mega_delivery:checkItem')
                    break
                end
            else
                if interacting then
                    exports.ox_lib:hideTextUI()
                    interacting = false
                end
            end
        end
    end)
end)

CreateThread(function()
    exports.ox_target:addBoxZone({
        coords = vec3(Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z),
        size = vec3(1, 1, 2),
        rotation = Config.NPC.coords.w,
        debug = false,
        options = {
            {
                label = lang.start,
                icon = 'fa-solid fa-box',
                onSelect = function()
                    TriggerServerEvent('mega_delivery:tryStart')
                end
            }
        }
    })

    RequestModel(Config.NPC.model)
    while not HasModelLoaded(Config.NPC.model) do Wait(0) end
    local ped = CreatePed(0, Config.NPC.model, Config.NPC.coords.xyz, Config.NPC.coords.w, true, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityAsMissionEntity(ped, true, true)
end)

if Config.ShowBlip then
    local blip = AddBlipForCoord(Config.NPC.coords.xyz)
    SetBlipSprite(blip, Config.NPCBlip.sprite)
    SetBlipScale(blip, Config.NPCBlip.scale)
    SetBlipColour(blip, Config.NPCBlip.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.NPCBlip.name)
    EndTextCommandSetBlipName(blip)
end