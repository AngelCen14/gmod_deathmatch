AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function GM:PlayerConnect(name, ip)
    print("Player "..name.." connected with IP ("..ip..")")
end

function GM:PlayerInitialSpawn(ply)
    print("Player "..ply:Name().." has spawned")
end