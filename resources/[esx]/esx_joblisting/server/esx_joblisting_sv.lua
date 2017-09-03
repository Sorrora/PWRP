ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_joblisting:getJobsList', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	
	MySQL.Async.fetchAll(
		'SELECT * FROM jobs WHERE whitelisted=false UNION SELECT * FROM essentialmode.jobs WHERE jobs.name IN (SELECT whitelist_jobs.name FROM whitelist_jobs WHERE identifier=@id)',
		{
			['@id'] = xPlayer.identifier
		},
		function(result)
			local data = {}
			for i=1, #result, 1 do
				table.insert(data, {
					value   = result[i].name,
					label   = result[i].label
				})
			end
			cb(data)
		end
	)
end)

RegisterServerEvent('esx_joblisting:setJob')
AddEventHandler('esx_joblisting:setJob', function(job)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local result = MySQL.Sync.fetchScalar(
		'SELECT grade FROM user_job_grades WHERE identifier = @id AND job_name = @job',
		{
			['@id']  = xPlayer.identifier,
			['@job'] = job
		}
	)
	if result then
		print(job .. " " .. result)
		xPlayer.setJob(job, result)
	else
		xPlayer.setJob(job, 0)
	end
end)