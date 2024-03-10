local Player = {}
Player.__index = Player

function Player.new(playerName: string, role: string)
  local self = setmetatable({}, Player)
  self._Name = playerName
  self._Role = role
  self._Death = false

  return self
end

function Player:GetName()
  return self._Name
end

function Player:GetRole()
  return self._Role
end

function Player:IsDead()
  return self._Death
end

function Player:SetDeath(value: boolean)
  self._Death = value
end

function Player:Die()
  self:SetDeath(true)
end

function Player:CloseEyes()
  print(self:GetName() .. "Fechou os olhos")
end

function Player:OpenEyes()
  print(self:GetName() .. "Abriu os olhos")
end


function Player:Destroy()
end

return Player
