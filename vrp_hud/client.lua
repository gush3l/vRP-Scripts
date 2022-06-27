local display = false

RegisterCommand(
    "hud",
    function()
        Citizen.CreateThread(
            function()
                display = true
                Wait(15000)
                display = false
            end
        )
    end
)

function formatMoney(amount)
    local left, num, right = string.match(tostring(amount), "^([^%d]*%d)(%d*)(.-)$")
    return left .. (num:reverse():gsub("(%d%d%d)", "%1."):reverse()) .. right
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)
            TriggerServerEvent("vRP_Hud:updateValues")
        end
    end
)

function GetOnlinePlayers()
    local players = 0
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            players = players + 1
        end
    end
    return tonumber(players)
end

RegisterNetEvent("vRP_Hud:setValues")
AddEventHandler(
    "vRP_Hud:setValues",
    function(bmoney, pmoney)
        SendNUIMessage(
            {
                type = "ui",
                players = GetOnlinePlayers(),
                bmoney = formatMoney(bmoney),
                pmoney = formatMoney(pmoney),
                display = display
            }
        )
    end
)
