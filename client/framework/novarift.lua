local Novarift = exports['novarift-core']:GetCoreObject()
local utils = require 'client.utils'
local character

if (Novarift.Player.GetCharacter()) then
    character = Novarift.Player.GetCharacter()
end

RegisterNetEvent('novarift-core:client:player:loaded', function ()
    character = Novarift.Player.GetCharacter()
end)

RegisterNetEvent('novarift-core:client:player:groups:updated', function ()
    character = Novarift.Player.GetCharacter()
end)

function utils.hasPlayerGotGroup(filter)

    local groups = character.groups or {}
    
    local _type = type(filter)

    if (_type == 'string') then
        return groups[filter]
    end

    local tabletype = table.type(filter)

    if (tabletype == 'hash') then
        for name, grade in pairs(filter) do
            local playerGrade = groups[name]

            if (playerGrade and grade <= playerGrade) then
                return true
            end
        end

        return false
    end

    for i = 1, #filter do
        if (groups[filter[i]]) then 
            return true
        end
    end

    return false

end
