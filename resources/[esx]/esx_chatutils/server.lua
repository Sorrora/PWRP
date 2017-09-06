ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- /whitelist <id> <job>
TriggerEvent('es:addCommand', 'whitelist', function(source, args, user)

	-- verify permissions to use this command
	local sourcePlayer = ESX.GetPlayerFromId(source)
	if sourcePlayer.getGroup() ~= "superadmin" and sourcePlayer.getGroup() ~= "admin" then
		help(source, "Insufficient Permissions.")
		return
	end
	
	-- verify the proper number of arguments are given
	if not args[3] then
		help(source, "/whitelist <id> <job>")
		return
	end
	
	-- verify given player ID is valid
	local xPlayer = ESX.GetPlayerFromId(args[2])
	if not xPlayer then
		help(source, args[2] .. " is not a valid player ID")
		help(source, "/whitelist <id> <job>")
		return
	end
		
	-- verify given job is valid
	if not jobExists(args[3]) then
		help(source, args[3] .. " is not a valid job.. verify job exists in /joblist")
		help(source, "/whitelist <id> <job>")
		return
	end
		
	-- add user, job to the whitelist_users database table
	MySQL.Async.fetchScalar('SELECT COUNT(1) FROM whitelist_jobs WHERE identifier = @id AND name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3]},
		function(result)
			if result == 0 then	
				MySQL.Async.execute(
					'INSERT INTO whitelist_jobs (identifier, name) VALUES (@id,@job)',
					{
							['@id']  = xPlayer.identifier,
							['@job'] = args[3]
					}
				)
				success(source, xPlayer.name .. " is now whitelisted for " .. args[3])
			else
				help(source, xPlayer.name .. " already whitelisted for " .. args[3])
			end
		end
	)
end)

-- /unwhitelist <id> <job>
TriggerEvent('es:addCommand', 'unwhitelist', function(source, args, user)
    
	-- verify permissions to use this command
	local sourcePlayer = ESX.GetPlayerFromId(source)
	if sourcePlayer.getGroup() ~= "superadmin" and sourcePlayer.getGroup() ~= "admin" then
		help(source, "Insufficient Permissions.")
		return
	end
	
	-- verify the proper number of arguments are given
	if not args[3] then
		help(source, "/unwhitelist <id> <job>")
		return
	end
	
	-- verify given player ID is valid
	local xPlayer = ESX.GetPlayerFromId(args[2])
	if not xPlayer then
		help(source, args[2] .. " is not a valid player ID")
		help(source, "/unwhitelist <id> <job>")
		return
	end
		
	-- verify given job is valid
	if not jobExists(args[3]) then
		help(source, args[3] .. " is not a valid job.. verify job exists in /joblist")
		help(source, "/unwhitelist <id> <job>")
		return
	end

	-- remove user, job to the whitelist_users database table
	MySQL.Async.fetchScalar('SELECT COUNT(1) FROM whitelist_jobs WHERE identifier = @id AND name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3]},
		function(result)
			if result == 1 then	
				MySQL.Async.execute(
					'DELETE FROM whitelist_jobs WHERE identifier = @id AND name = @job',
					{
							['@id']  = xPlayer.identifier,
							['@job'] = args[3]
					}
				)
				success(source, xPlayer.name .. " is no longer whitelisted for " .. args[3])
			else
				help(source, xPlayer.name .. " not whitelisted for " .. args[3])
			end
		end
	)
end)

-- /setgrade <id> <job> <grade>
-- same functionality as /setrank
TriggerEvent('es:addCommand', 'setgrade', function(source, args, user)
    
	-- verify permissions to use this command
	local sourcePlayer = ESX.GetPlayerFromId(source)
	if sourcePlayer.getGroup() ~= "superadmin" and sourcePlayer.getGroup() ~= "admin" then
		help(source, "Insufficient Permissions.")
		return
	end
	
	-- verify the proper number of arguments are given
	if not args[4] then
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
	
	-- verify given player ID is valid
	local xPlayer = ESX.GetPlayerFromId(args[2])
	if not xPlayer then
		help(source, args[2] .. " is not a valid player ID")
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
		
	-- verify given job is valid
	if not jobExists(args[3]) then
		help(source, args[3] .. " is not a valid job.. verify job exists in /joblist")
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
		
	-- verify given job grade is valid
	if not gradeExists(args[3], args[4]) then
		help(source, args[4] .. " is not a valid job grade for " .. args[3] .. ".")
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
	
	-- add player, job, grade to user_job_grades database table or update grade if user,job exists
	MySQL.Async.fetchScalar('SELECT COUNT(1) FROM user_job_grades WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3]},
		function(result)
			if result == 1 then
				MySQL.Async.execute('UPDATE user_job_grades SET grade = @grade WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3], ['@grade'] = args[4]})
				success(source, xPlayer.name .. " is now set to grade " .. args[4] .. " for job " .. args[3])
			else
				MySQL.Async.execute('INSERT INTO user_job_grades (identifier, job_name, grade) VALUES (@id, @job, @grade)', {['@id'] = xPlayer.identifier, ['@job'] = args[3], ['@grade'] = args[4]})
				success(source, xPlayer.name .. " is now set to grade " .. args[4] .. " for job " .. args[3])
			end
		end
	)
end)

-- /setrank <id> <job> <grade>
-- same functionality as /setgrade
TriggerEvent('es:addCommand', 'setrank', function(source, args, user)
    
	-- verify permissions to use this command
	local sourcePlayer = ESX.GetPlayerFromId(source)
	if sourcePlayer.getGroup() ~= "superadmin" and sourcePlayer.getGroup() ~= "admin" then
		help(source, "Insufficient Permissions.")
		return
	end
	
	-- verify the proper number of arguments are given
	if not args[4] then
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
	
	-- verify given player ID is valid
	local xPlayer = ESX.GetPlayerFromId(args[2])
	if not xPlayer then
		help(source, args[2] .. " is not a valid player ID")
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
		
	-- verify given job is valid
	if not jobExists(args[3]) then
		help(source, args[3] .. " is not a valid job.. verify job exists in /joblist")
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
		
	-- verify given job grade is valid
	if not gradeExists(args[3], args[4]) then
		help(source, args[4] .. " is not a valid job grade for " .. args[3] .. ".")
		help(source, "/setgrade <id> <job> <grade>")
		return
	end
	
	-- add player, job, grade to user_job_grades database table or update grade if user,job exists
	MySQL.Async.fetchScalar('SELECT COUNT(1) FROM user_job_grades WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3]},
		function(result)
			if result == 1 then
				MySQL.Async.execute('UPDATE user_job_grades SET grade = @grade WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3], ['@grade'] = args[4]})
				success(source, xPlayer.name .. " is now set to grade " .. args[4] .. " for job " .. args[3])
			else
				MySQL.Async.execute('INSERT INTO user_job_grades (identifier, job_name, grade) VALUES (@id, @job, @grade)', {['@id'] = xPlayer.identifier, ['@job'] = args[3], ['@grade'] = args[4]})
				success(source, xPlayer.name .. " is now set to grade " .. args[4] .. " for job " .. args[3])
			end
		end
	)
end)

-- /promote <id> <job>
-- job grade ++
TriggerEvent('es:addCommand', 'promote', function(source, args, user)
    
	-- verify permissions to use this command
	local sourcePlayer = ESX.GetPlayerFromId(source)
	if sourcePlayer.getGroup() ~= "superadmin" and sourcePlayer.getGroup() ~= "admin" then
		help(source, "Insufficient Permissions.")
		return
	end
	
	-- verify the proper number of arguments are given
	if not args[3] then
		help(source, "/promote <id> <job>")
		return
	end
	
	-- verify given player ID is valid
	local xPlayer = ESX.GetPlayerFromId(args[2])
	if not xPlayer then
		help(source, args[2] .. " is not a valid player ID")
		help(source, "/promote <id> <job>")
		return
	end
		
	-- verify given job is valid
	if not jobExists(args[3]) then
		help(source, args[3] .. " is not a valid job.. verify job exists in /joblist")
		help(source, "/promote <id> <job>")
		return
	end
	
	-- grade++ the user for the given job if they already have a grade and it isn't maxed already
	MySQL.Async.fetchScalar('SELECT grade FROM user_job_grades WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3]}, 
		function(currentGrade)
			local maxJobGrade = maxGrade(args[3])
			if not currentGrade then
				help(source, xPlayer.name .. " does not currently have a grade for " .. args[3] .. ".")
				help(source, "Try /setgrade instead")
			elseif currentGrade < maxJobGrade then
				MySQL.Async.execute('UPDATE user_job_grades SET grade = @grade WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3], ['@grade'] = currentGrade + 1})
				success(source, xPlayer.name .. " is now set to grade " .. currentGrade + 1 .. " for job " .. args[3])
			elseif currentGrade == maxJobGrade then
				help(source, xPlayer.name .. " is already at the max grade for " .. args[3] .. ".")
			end
		end
	)
end)

-- /demote <id> <job>
-- job grade --
TriggerEvent('es:addCommand', 'demote', function(source, args, user)
    
	-- verify permissions to use this command
	local sourcePlayer = ESX.GetPlayerFromId(source)
	if sourcePlayer.getGroup() ~= "superadmin" and sourcePlayer.getGroup() ~= "admin" then
		help(source, "Insufficient Permissions.")
		return
	end
	
	-- verify the proper number of arguments are given
	if not args[3] then
		help(source, "/demote <id> <job>")
		return
	end
	
	-- verify given player ID is valid
	local xPlayer = ESX.GetPlayerFromId(args[2])
	if not xPlayer then
		help(source, args[2] .. " is not a valid player ID")
		help(source, "/demote <id> <job>")
		return
	end
		
	-- verify given job is valid
	if not jobExists(args[3]) then
		help(source, args[3] .. " is not a valid job.. verify job exists in /joblist")
		help(source, "/demote <id> <job>")
		return
	end
	
	-- grade++ the user for the given job if they already have a grade and it isn't maxed already
	local currentGrade = MySQL.Sync.fetchScalar('SELECT grade FROM user_job_grades WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3]})
	local maxJobGrade = maxGrade(args[3])
	if not currentGrade then
		help(source, xPlayer.name .. " does not currently have a grade for " .. args[3] .. ".")
		help(source, "Try /setgrade instead")
	elseif currentGrade > 0 then
		MySQL.Async.execute('UPDATE user_job_grades SET grade = @grade WHERE identifier = @id AND job_name = @job', {['@id'] = xPlayer.identifier, ['@job'] = args[3], ['@grade'] = currentGrade - 1})
		success(source, xPlayer.name .. " is now set to grade " .. currentGrade - 1 .. " for job " .. args[3])
	elseif currentGrade == 0 then
		help(source, xPlayer.name .. " is already at the minimum grade for " .. args[3] .. ".")
	end
end)

-- /joblist
-- list all job name+label combinations 
TriggerEvent('es:addCommand', 'joblist', function(source, args, user)
    MySQL.Async.fetchAll('SELECT name,label FROM jobs',
						 {},
						 function(result)
							local jobList = {}
							for i=1, #result, 1 do
								table.insert(jobList, result[i].label .. " = " .. result[i].name)
							end
							local jobListCat = table.concat(jobList, "; ")
							success(source, jobListCat)
						end)
end)

function maxGrade(job)
	local grade = MySQL.Sync.fetchScalar('SELECT MAX(grade) FROM job_grades WHERE job_name = @job', {['@job'] = job})
	return grade
end

function jobExists(job)
	if MySQL.Sync.fetchScalar('SELECT label FROM jobs WHERE name = @job', {['@job'] = job}) then
		return true
	else
		return false
	end
end

function gradeExists(job, grade)
	local igrade = tonumber(grade)
	if igrade and igrade >= 0 and igrade <= maxGrade(job) then
		return true
	else
		return false
	end
end

function help(source, message)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, message)
end

function success(source, message)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {0, 255, 0}, message)
end
