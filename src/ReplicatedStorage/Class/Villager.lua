local Player = require(game:GetService("ReplicatedStorage").Class.Player)

local Villager = {}
Villager.__index = Villager

function Villager.new(playerName)
  local self = setmetatable(Player.new(playerName, "Villager"), Villager)
  return self
end

function Villager:Destroy()
    
end

return Villager
