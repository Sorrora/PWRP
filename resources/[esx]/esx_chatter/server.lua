ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(source, name, arg)
	-- Table of chatMessage split by space
	argument_table = split(arg)

	-- Loop through all the Config.intercepts options for a match
	for command, settings in pairs(Config.intercepts) do
		if command == string.lower(argument_table[1]) then
			-- If we found a match, stop if from going to chat
			CancelEvent()
			
			-- Set player name and id
			name = GetPlayerName(source)
			id = source
			
			-- Concatenate the message without the command
			message = table.concat(argument_table, " ", 2)
			-- Format the message based on config for the given command
			if settings.message then
				message = resolve(settings.message, name, id, message)
			end
			
			-- Create the message prefix, including $name substitution
			if settings.prefix then
				prefix = resolve(settings.prefix, name, id, message)
			else
				prefix = name
			end
						
			-- Format the config color setting, else set it to white
			if settings.color then
				color = {settings.color.red, settings.color.green, settings.color.blue}
			else
				color = {255, 255, 255}
			end
			
			-- If the message is proximity based, it needs to be sent from the client.lua
			if settings.proximity then
				TriggerClientEvent('proximityChatMessage', -1, source, prefix, color, message)
			-- If the message is only intended for specific jobs
			elseif settings.job_whitelist then
				local whitelister_found = false
				local xPlayerIds = ESX.GetPlayers()
				-- Loop through all players in the server
				for i=1, #xPlayerIds, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayerIds[i])
					-- Loop through all the jobs in the config whitelist
					for x=1, #settings.job_whitelist, 1 do
						-- If a player in the server matches a job in the whitelist
						if xPlayer.job.name == settings.job_whitelist[x] then
							whitelister_found = true
							TriggerClientEvent('chatMessage', xPlayerIds[i], prefix, color, message)
						end
					end
				end
				-- Make sure the message source sees the message too and let them know if they were heard
				TriggerClientEvent('chatMessage', id, prefix, color, message)
				if not whitelister_found then
					TriggerClientEvent('chatMessage', id, "Answering Machine", color, "Sorry nobody is around to hear your message...")
				end
			-- If the messages are for the whole server
			else
				TriggerClientEvent('chatMessage', -1, prefix, color, message)
			end
			
			-- We found the prefix we were looking for.
			-- Nothing else to see here.
			break
		end
	end
end)
	
-- Replace $name, $id, and $message variables
function resolve(string_input, name, id, message)
	
	string_input = string.gsub(string_input, "$name", name)
	string_input = string.gsub(string_input, "$id", id)
	string_input = string.gsub(string_input, "$message", message)
	
	return string_input
end


-- Split chatMessage by space characters into a table
function split(string_input)
	
	local token_table = {}
	
	for token in string.gmatch(string_input, "%S+") do
		table.insert(token_table, token)
	end

	return token_table
end