local Player = require(game:GetService("ReplicatedStorage").Class.Player)

local Seer = {}
Seer.__index = Seer

function Seer.new(playerName)
  local self = setmetatable(Player.new(playerName, "Seer"), Seer)
  self._hasVoted = false
  return self
end


function Seer:SetHasVoted(value: boolean)
  self._hasVoted = value
end

function Seer:VoteWereWolf(targetWereWolf)
  if not self._hasVoted then
    self:SetHasVoted(true)
    print(targetWereWolf:GetName() .. " Foi votado como lobo")
  end
end

function Seer:Destroy()
    
end

return Seer
