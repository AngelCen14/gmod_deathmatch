local playersPerTeam = MAX_PLAYERS / 2

-- Añade al jugador al equipo con menos jugadores
function autoAssignTeam(ply)
    local team1Players = team.NumPlayers(TEAM_1)
    local team2Players = team.NumPlayers(TEAM_2)

    if team1Players < playersPerTeam 
        and team1Players < team2Players 
        or team1Players < 1 then
            ply:SetTeam(TEAM_1)
    elseif team2Players < playersPerTeam 
        and team2Players < team1Players 
        or team2Players < 1 then
            ply:SetTeam(TEAM_2)
    end
    print("Player "..ply:GetName().." assigned to team "..ply:Team())
end