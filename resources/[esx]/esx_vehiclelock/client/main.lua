ESX               = nil
local playerCars = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- 
function OpenCloseVehicle()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

	local vehicle = nil

	if IsPedInAnyVehicle(playerPed,  false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	elseif GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70) ~= 0 then
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
	elseif GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 71) then
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 71)
	end
	
	if vehicle and vehicle ~= 0 then
		if isPoliceVehicle(vehicle) then
			ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerJob', function(playerJob)
				if playerJob == "police" then
					toggleLock(vehicle)
				else
					ESX.ShowNotification("~r~You do not have the keys for this vehicle.")
				end
			end)
		else
			ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

				if isOwnedVehicle then
					toggleLock(vehicle)
				else
					ESX.ShowNotification("~r~You do not have the keys for this vehicle.")
				end
			end, GetVehicleNumberPlateText(vehicle))
		end
	else
		ESX.ShowNotification("~r~ No lockable vehicle found")
	end
end

-- toggle the door lock based on its current lockedness
-- mostly in its own function to clean up OpenCloseVehicle()
function toggleLock(vehicle)
	local locked = GetVehicleDoorLockStatus(vehicle)
	if locked == 1 then -- if unlocked
		SetVehicleDoorsLocked(vehicle, 2)
		PlayVehicleDoorCloseSound(vehicle, 1)
		ESX.ShowNotification("You have ~r~locked~s~ the vehicle.")
	elseif locked == 2 then -- if locked
		SetVehicleDoorsLocked(vehicle, 1)
		PlayVehicleDoorOpenSound(vehicle, 0)
		ESX.ShowNotification("You have ~g~unlocked~s~ the vehicle.")
	end
end

-- check if "police" or "sheriff" are substrings of the vehicle model
-- might not be the best, but it's more flexible than specific models
function isPoliceVehicle(vehicle)
	local name = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
	name = string.lower(name)
	if string.match(name, "police") or string.match(name, "sheriff") then
		return true
	else
		return false
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 182) then
			OpenCloseVehicle()
		end
	end
end)