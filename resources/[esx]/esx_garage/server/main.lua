ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_garage:setParking')
AddEventHandler('esx_garage:setParking', function(garage, zone, vehicleProps)

	local xPlayer = ESX.GetPlayerFromId(source)

	if vehicleProps == false then

		MySQL.Async.execute(
			'DELETE FROM `user_parkings` WHERE `identifier` = @identifier AND `garage` = @garage AND zone = @zone',
			{
				['@identifier'] = xPlayer.identifier,
				['@garage']     = 'MainGarage';
				['@zone']       = zone
			}, function(rowsChanged)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_released'))
			end
		)

	else

		MySQL.Async.execute(
			'INSERT INTO `user_parkings` (`identifier`, `garage`, `zone`, `vehicle`) VALUES (@identifier, @garage, @zone, @vehicle)',
			{
				['@identifier'] = xPlayer.identifier,
				['@garage']     = 'MainGarage';
				['@zone']       = zone,
				['vehicle']     = json.encode(vehicleProps)
			}, function(rowsChanged)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_stored'))
			end
		)

	end

end)

RegisterServerEvent('esx_garage:setCurrentGarage')
AddEventHandler('esx_garage:setCurrentGarage', function(garage)

	local xPlayer = ESX.GetPlayerFromId(source)
		
	if MySQL.Sync.fetchScalar('SELECT garage FROM current_garage WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}) then
		MySQL.Async.execute('UPDATE current_garage SET garage = @garage WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier, ['@garage'] = garage})
	else
		MySQL.Async.execute('INSERT INTO `current_garage` VALUES (@identifier, @garage)', {['@identifier'] = xPlayer.identifier, ['@garage'] = garage})
	end

end)

ESX.RegisterServerCallback('esx_garage:getCurrentGarage', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
		
	local result = MySQL.Sync.fetchScalar(
		'SELECT garage FROM current_garage WHERE `identifier` = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		}
	)
	cb(result)
	
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehiclesInGarage', function(source, cb, garage)

	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll(
		'SELECT * FROM `user_parkings` WHERE `identifier` = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)
		
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					zone    = result[i].zone,
					vehicle = json.decode(result[i].vehicle)
				})
			end

			cb(vehicles)

		end
	)

end)
