local QBCore = exports['qb-core']:GetCoreObject()
local chatOpen = false

Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
if IsControlJustReleased(0, 245) then -- Key T
toggleChat()
end
end
end)

function toggleChat()
chatOpen = not chatOpen
SetNuiFocus(chatOpen, chatOpen)
SendNUIMessage({ action = chatOpen and 'openChat' or 'closeChat' })
end

RegisterNUICallback('closeChat', function(data, cb)
toggleChat()
cb('ok')
end)

RegisterNUICallback('sendMessage', function(data, cb)
TriggerServerEvent('qb-zombie-chat:sendMessage', data.message)
cb('ok')
end)