AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("team_manager/sv_team_manager.lua")

local activePlayers = 0

function GM:PlayerConnect(name, ip)
    print("Player "..name.." connected with IP ("..ip..")")
end

-- Se llama la primera vez que el jugador spawnea
function GM:PlayerInitialSpawn(ply)
    if (activePlayers < MAX_PLAYERS) then
        activePlayers = activePlayers + 1
        autoAssignTeam(ply) -- Añadir al jugador a un equipo
        ply:SetModel()
    else
        -- Poner al jugador como espectador cuando el server esta lleno
        ply:SetTeam(TEAM_SPECTATOR)
        ply:Spectate(OBS_MODE_ROAMING)
        ply:ChatPrint("Server is full, you are in spectator mode")
    end

    print("Player "..ply:Name().." has spawned")
end

-- Se llama cada vez que el jugador spawnea (respawns incluidos)
function GM:PlayerSpawn(ply, transition)
    if ply:Team() == TEAM_SPECTATOR then
        ply:Spectate(OBS_MODE_ROAMING)
    else
        ply:Give("weapon_pistol")  
        ply:GiveAmmo(255, "Pistol", true)  
    end
end

function GM:PlayerDisconnected(ply)
    -- Si el jugador que se desconecta no es espectador, se disminuye el contador
    if (activePlayers > 0 and ply:Team() != TEAM_SPECTATOR) then
        activePlayers = activePlayers - 1
    end
end

function GM:PlayerDeath(victim, inflictor, attacker)
    if IsValid(attacker) and attacker:IsPlayer() and victim != attacker then
        attacker:AddFrags(1)  -- Añade una muerte al contador del atacante
    end
end