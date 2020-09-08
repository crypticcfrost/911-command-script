-----------------------------------------------    911 CALL COMMAND BY ILLUMIINATI-----------------------------------------------------------------

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end

-----------------------------------------------------------------------------------------------------------------------------------

-- [SERVER SIDED] 911 CHAT

RegisterServerEvent('esx_jobChat:911')
AddEventHandler('esx_jobChat:911', function(targetCoords, msg, streetName, emergency)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	fal = xPlayer.getName(source)
	local messageFull
	if emergency == '911' then
		messageFull = {
			template = '<div style="padding: 8px; margin: 8px; background-color: rgba(0, 38, 153); border-radius: 25px;"><i class="fas fa-bell"style="font-size:15px"></i> [EMERGENCY!] : {0} | Location : {1} | {2}</font></i></b></div>',
        	args = {fal, streetName, msg}
		}
	end
	TriggerClientEvent('esx_jobChat:911Marker', -1, targetCoords, emergency)
	TriggerClientEvent('esx_jobChat:911EmergencySend', -1, messageFull)
end)

-----------------------------------------------------------------------------------------------------------------------------------