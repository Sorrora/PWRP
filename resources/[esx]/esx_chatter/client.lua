RegisterNetEvent('proximityChatMessage')
AddEventHandler('proximityChatMessage', function(id, prefix, color, message)
	local recvPlayer = GetPlayerPed(PlayerId())
	local sendPlayer = GetPlayerPed(GetPlayerFromServerId(id))
	
	if recvPlayer == sendPlayer then
		print('recvplayer == sendplayer')
		TriggerEvent('chatMessage', prefix, color, message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(recvPlayer), GetEntityCoords(sendPlayer), true) < 19.999 then
		print('big distance statement')
		TriggerEvent('chatMessage', prefix, color, message)
	end
end)