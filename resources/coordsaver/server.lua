print("Write /pos ingame to save the coords in a .txt in server's main folder")

RegisterServerEvent("SaveCoords")
AddEventHandler("SaveCoords", function( PlayerName , x , y , z , comment )
 file = io.open( PlayerName .. "-Coords.txt", "a")
    if file then
        file:write("{" .. x .. "," .. y .. "," .. z .. ",".. comment .."},")
        file:write("\n")
    end
    file:close()
end)

AddEventHandler("chatMessage", function(p, color, msg)
    if msg:sub(1, 1) == "/" then
        fullcmd = stringSplit(msg, " ")
        cmd = fullcmd[1]
        comment = fullcmd[2]
        if #fullcmd > 2 then
          for i=3, #fullcmd do
              comment = comment .. " " .. fullcmd[i]
          end
        end
        if cmd == "/pos" then
        	TriggerClientEvent("SaveCommand", p, comment)
        	CancelEvent()
        end
    end
end)

function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
