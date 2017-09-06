--
-- Created by SuperCoolNinja.
-- Date: 14/08/2017
-- Time: 19:04
-- Simple Animations Menu Compatible FX.
--
local options = {
    x = 0.900,
    y = 0.32,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 2,
    menu_title = "Menu Animations", --Modifier le Nom du Menu Ici !
    menu_subtitle = "Categories",
    color_r = 24,
    color_g = 225,
    color_b = 178,
}
------------------------------------------------------------------------------------------------------------------------
-- Base du menu
function PersonnalMenu()
    ped = GetPlayerPed(-1);
    ClearMenu()
    Menu.addButton("Animations", "animsMenu", nil)
	Menu.addButton("Quit", "quitter", nil)
end
------------------------------------------------------------------------------------------------------------------------



-- handles when a player spawns either from joining or after death
RegisterNetEvent("pm:notifs")
AddEventHandler("pm:notifs", function(msg)
    notifs(msg)
end)

function notifs(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString( msg )
    DrawNotification(false, false)
end



------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedUsingAnyScenario(GetPlayerPed(-1)) then
            if IsControlJustPressed(1, 34) or IsControlJustPressed(1, 32) or IsControlJustPressed(1, 8) or IsControlJustPressed(1, 9) then
                ClearPedTasks(GetPlayerPed(-1))
            end
        end

    end
end)

-- Menu des animations
function animsMenu()
    options.menu_subtitle = "Animations"
    ClearMenu()
    Menu.addButton("Hands Up", "animsAction", { lib = "ped", anim = "handsup" })
    Menu.addButton("Greetings", "animsSalute", nil)
    Menu.addButton("Mood", "animsHumor", nil)
    Menu.addButton("Sports", "animsSportives",nil)
    Menu.addButton("Festives", "animsFestives",nil)
    Menu.addButton("Other", "animsOthers", nil)
    Menu.addButton("Return","PersonnalMenu",nil)
end

function animsSportives()
    options.menu_subtitle = "Sports Animations"
    ClearMenu()
    Menu.addButton("Yoga", "animsActionScenario", { anim = "WORLD_HUMAN_YOGA" })
    Menu.addButton("Jogging", "animsActionScenario", { anim = "WORLD_HUMAN_JOG_STANDING" })
    Menu.addButton("Push-Ups", "animsActionScenario", { anim = "WORLD_HUMAN_PUSH_UPS" })
    Menu.addButton("Return","animsMenu",nil)
end

function animsFestives()
    options.menu_subtitle = "Animations Festives"
    ClearMenu()
    Menu.addButton("Drink Beer", "animsActionScenario", { anim = "WORLD_HUMAN_DRINKING" })
    Menu.addButton("Close to Fire", "animsActionScenario", { anim = "WORLD_HUMAN_STAND_FIRE" })
    Menu.addButton("Play Music", "animsActionScenario", {anim = "WORLD_HUMAN_MUSICIAN" })
    Menu.addButton("Return","animsMenu",nil)
end

function animsSalute()
    options.menu_subtitle = "Animations Greetings"
    ClearMenu()
    Menu.addButton("Shake Hands", "animsAction", { lib = "mp_common", anim = "givetake1_a" })
    Menu.addButton("Wave", "animsAction", { lib = "gestures@m@standing@casual", anim = "gesture_hello" })
    Menu.addButton("High-Five", "animsAction", { lib = "mp_ped_interaction", anim = "highfive_guy_a" })
    Menu.addButton("Military Salute", "animsAction", { lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute" })
    Menu.addButton("Return","animsMenu",nil)
end

function animsHumor()
    options.menu_subtitle = "Animations Mood"
    ClearMenu()
    Menu.addButton("Cheer", "animsActionScenario", {anim = "WORLD_HUMAN_CHEERING" })
    Menu.addButton("Dammed ", "animsAction", { lib = "gestures@m@standing@casual", anim = "gesture_damn" })
    Menu.addButton("No Way", "animsAction", { lib = "gestures@m@standing@casual", anim = "gesture_no_way" })
    Menu.addButton("Middle Fingers", "animsAction", { lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter" })
    Menu.addButton("Kiss", "animsAction", { lib = "mp_ped_interaction", anim = "kisses_guy_a" })
    Menu.addButton("Return","animsMenu",nil)
end

function animsOthers()
    options.menu_subtitle = "Animations Other"
    ClearMenu()
    Menu.addButton("Take Notes", "animsActionScenario", { anim = "WORLD_HUMAN_CLIPBOARD" })
    Menu.addButton("Sit", "animsActionScenario", { anim = "WORLD_HUMAN_PICNIC" })
    Menu.addButton("Smoke", "animsActionScenario", { anim = "WORLD_HUMAN_SMOKING" })
    Menu.addButton("Scratch Balls", "animsAction", { lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch" })
    Menu.addButton("Rock and Roll", "animsAction", { lib = "mp_player_int_upperrock", anim = "mp_player_int_rock" })
    Menu.addButton("Return","animsMenu",nil)

end

function animsAction(animObj)
    RequestAnimDict( animObj.lib )
    while not HasAnimDictLoaded( animObj.lib ) do
        Citizen.Wait(0)
    end
    if HasAnimDictLoaded( animObj.lib ) then
        TaskPlayAnim( GetPlayerPed(-1), animObj.lib , animObj.anim ,8.0, -8.0, -1, 0, 0, false, false, false )
    end
end

function animsActionScenario(animObj)
    local ped = GetPlayerPed(-1);

    if ped then
        local pos = GetEntityCoords(ped);
        local head = GetEntityHeading(ped);
        --TaskStartScenarioAtPosition(ped, animObj.anim, pos['x'], pos['y'], pos['z'] - 1, head, -1, false, false);
        TaskStartScenarioInPlace(ped, animObj.anim, 0, false)
        if IsControlJustPressed(1,188) then
        end

    end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if menuIsOpen ~= 0 then
      if IsControlJustPressed(1, KeyToucheClose) then
        closeGui()
      elseif menuIsOpen == 2 then
        local ply = GetPlayerPed(-1)
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisablePlayerFiring(ply, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 106, true)
        if IsDisabledControlJustReleased(0, 142) then
          SendNUIMessage({method = "clickGui"})
        end
      end
    end
  end
end)

function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

--====================================================================================
--  User Event
--====================================================================================

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

function quitter ()
Menu.hidden = true
end


------------------------------------------------------------------------------------------------------------------------

function getPlayers()
    local playerList = {}
    for i = 0, 32 do
        local player = GetPlayerFromServerId(i)
        if NetworkIsPlayerActive(player) then
            table.insert(playerList, player)
        end
    end
    return playerList
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 170) then --Modifier L'ouverture du Menu Ici ! Touche F3 de base.
            PersonnalMenu()
			-- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
        Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
        if IsEntityDead(PlayerPedId()) then
            PlayerIsDead()
            -- prevent the death check from overloading the server
            playerdead = true
        end
    end
end)
