local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent("vRP_Hud:updateValues")
AddEventHandler(
    "vRP_Hud:updateValues",
    function()
        local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            local pmoney = vRP.getMoney({user_id})
            local bmoney = vRP.getBankMoney({user_id})
            TriggerClientEvent("vRP_Hud:setValues", source, pmoney, bmoney)
        end
    end
)