local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-zombie-chat:sendMessage')
AddEventHandler('qb-zombie-chat:sendMessage', function(message)
local src = source
local Player = QBCore.Functions.GetPlayer(src)
local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname

TriggerClientEvent('chat:addMessage', -1, { args = { '^1[Zombie Chat] ^7' .. playerName, message } })
end)