RegisterNetEvent("SaveCommand")
AddEventHandler("SaveCommand", function(comment)
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	    local PlayerName = GetPlayerName()
	    TriggerServerEvent("SaveCoords", PlayerName , x , y , z, comment)			
end)