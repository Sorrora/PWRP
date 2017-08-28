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
	Menu.addButton("Fermer", "quitter", nil)
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
    Menu.addButton("lever les bras", "animsAction", { lib = "ped", anim = "handsup" })
    Menu.addButton("Saluer", "animsSalute", nil)
    Menu.addButton("Humeur", "animsHumor", nil)
    Menu.addButton("Sportives", "animsSportives",nil)
    Menu.addButton("Festives", "animsFestives",nil)
    Menu.addButton("Autres", "animsOthers", nil)
    Menu.addButton("Retour","PersonnalMenu",nil)
end

function animsSportives()
    options.menu_subtitle = "Animations  Sportives"
    ClearMenu()
    Menu.addButton("Faire du Yoga", "animsActionScenario", { anim = "WORLD_HUMAN_YOGA" })
    Menu.addButton("Jogging", "animsActionScenario", { anim = "WORLD_HUMAN_JOG_STANDING" })
    Menu.addButton("Faire des pompes", "animsActionScenario", { anim = "WORLD_HUMAN_PUSH_UPS" })
    Menu.addButton("Retour","animsMenu",nil)
end

function animsFestives()
    options.menu_subtitle = "Animations  Festives"
    ClearMenu()
    Menu.addButton("Boire une biere", "animsActionScenario", { anim = "WORLD_HUMAN_DRINKING" })
    Menu.addButton("Pres du feu", "animsActionScenario", { anim = "WORLD_HUMAN_STAND_FIRE" })
    Menu.addButton("Jouer de la musique", "animsActionScenario", {anim = "WORLD_HUMAN_MUSICIAN" })
    Menu.addButton("Retour","animsMenu",nil)
end

function animsSalute()
    options.menu_subtitle = "Animations  Saluer"
    ClearMenu()
    Menu.addButton("Serrer la main", "animsAction", { lib = "mp_common", anim = "givetake1_a" })
    Menu.addButton("Dire bonjour", "animsAction", { lib = "gestures@m@standing@casual", anim = "gesture_hello" })
    Menu.addButton("Tappes moi en 5", "animsAction", { lib = "mp_ped_interaction", anim = "highfive_guy_a" })
    Menu.addButton("Salut militaire", "animsAction", { lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute" })
    Menu.addButton("Retour","animsMenu",nil)
end

function animsHumor()
    options.menu_subtitle = "Animations  Humeur"
    ClearMenu()
    Menu.addButton("Feliciter", "animsActionScenario", {anim = "WORLD_HUMAN_CHEERING" })
    Menu.addButton("Dammed ", "animsAction", { lib = "gestures@m@standing@casual", anim = "gesture_damn" })
    Menu.addButton("Sans Blague", "animsAction", { lib = "gestures@m@standing@casual", anim = "gesture_no_way" })
    Menu.addButton("Doigt d'honneur", "animsAction", { lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter" })
    Menu.addButton("Enlacer", "animsAction", { lib = "mp_ped_interaction", anim = "kisses_guy_a" })
    Menu.addButton("Retour","animsMenu",nil)
end

function animsOthers()
    options.menu_subtitle = "Animations  Autres"
    ClearMenu()
    Menu.addButton("Prendre des notes", "animsActionScenario", { anim = "WORLD_HUMAN_CLIPBOARD" })
    Menu.addButton("S assoir", "animsActionScenario", { anim = "WORLD_HUMAN_PICNIC" })
    Menu.addButton("Fumer une clope", "animsActionScenario", { anim = "WORLD_HUMAN_SMOKING" })
    Menu.addButton("Se gratter les couille", "animsAction", { lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch" })
    Menu.addButton("Rock and Roll", "animsAction", { lib = "mp_player_int_upperrock", anim = "mp_player_int_rock" })
    Menu.addButton("Retour","animsMenu",nil)

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
