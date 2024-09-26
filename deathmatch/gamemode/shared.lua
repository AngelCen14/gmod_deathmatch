GM.Name = "Deathmatch"

MAX_PLAYERS = 16

-- Equipos
TEAM_1 = 1
TEAM_2 = 2

function GM:Initialize()
    self.BaseClass.Initialize(self)
end

function GM:CreateTeams()
    team.SetUp(TEAM_1, "Team 1", Color(8, 58, 224))
    team.SetUp(TEAM_2, "Team 2", Color(240, 65, 11))
    team.SetUp(TEAM_SPECTATOR, "Spectator", Color(255, 255, 255))
end