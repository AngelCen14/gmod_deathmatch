-- Función para contar jugadores en un equipo específico
function countPlayersInTeam(teamId)
    local count = 0
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) and ply:Team() == teamId then
            count = count + 1
        end
    end
    return count
end