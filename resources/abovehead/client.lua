-- Script Created By: MrDaGree
-- If you wish to use this, dont claim it as your own.
-- This is a client.lua script. This must be ran BY the client.

local showPlayerBlips = false
local ignorePlayerNameDistance = false
local disPlayerNames = 100
local playerSource = 0

function DrawText3D(x,y,z, text) -- some useful function, use it if you want!
    local onScreen, _x, _y=SetDrawOrigin(x, y, z, 0)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.60*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do
        for i=0,99 do
            N_0x31698aa80e0223f8(i)
        end
        for id = 0, 31 do
            if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= GetPlayerPed( -1 )) then
                ped = GetPlayerPed( id )

                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))

                if(ignorePlayerNameDistance) then
                    DrawText3D(x2, y2, z2+1.25, tostring(GetPlayerServerId(id)))
                    -- For just the player's source id use this or use the line above for name and source id | DrawText3D(x2, y2, z2+1, GetPlayerServerId(id))
                end

                if ((distance < disPlayerNames)) then
                    if not (ignorePlayerNameDistance) then
                        DrawText3D(x2, y2, z2+1.25, tostring(GetPlayerServerId(id)))
                        -- For just the player's source id use this or use the line above for name and source id | DrawText3D(x2, y2, z2+1, GetPlayerServerId(id))
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)
