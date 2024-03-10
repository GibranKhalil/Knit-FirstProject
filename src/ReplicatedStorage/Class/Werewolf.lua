local Player = require(game:GetService("ReplicatedStorage").Class.Player)

local WereWolf = {}
WereWolf.__index = WereWolf

function WereWolf.new(playerName)
  local self = setmetatable(Player.new(playerName, "WereWolf"), WereWolf)
  self._hasFound = false
  self._hasVoted = false
  return self
end

function WereWolf:SetFound(value: boolean)
    self._hasFound = value
end

function WereWolf:GetHasFound()
    return self._hasFound
end

function WereWolf:SetHasVoted(value: boolean)
    self._hasVoted = value
end

function WereWolf:VoteKill(targetPlayer)
    if not self._hasVoted then
        self:SetHasVoted(true)
        print(targetPlayer:GetName() .. " foi votado para morrer")
    end
end

function WereWolf:Destroy()

end

return WereWolf
