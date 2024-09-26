set source=deathmatch
set gmodGamemodesDir=D:\SteamLibrary\steamapps\common\GarrysMod\garrysmod\gamemodes
set destination=%gmodGamemodesDir%\deathmatch

xcopy /E /I /Y "%source%" "%destination%"