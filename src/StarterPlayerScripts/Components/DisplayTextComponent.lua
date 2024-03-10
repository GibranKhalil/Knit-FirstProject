local Component = require(game:GetService("ReplicatedStorage").Packages.component)
local Trove = require(game:GetService("ReplicatedStorage").Packages.Trove)


local DisplayTextComponent = Component.new({ Tag = "DisplayText" })

function DisplayTextComponent:Construct()
  self.MyText = "Esperando jogadores..."
  self._Trove = Trove.new()
  print("Componente construido")

  -- Conexão aos eventos PlayerAdded e PlayerRemoving
  self._Trove:Add(game.Players.PlayerAdded:Connect(function()
    self:UpdateText(#game:GetService("Players"):GetChildren())
  end))

  self._Trove:Add(game.Players.PlayerRemoving:Connect(function()
    self:UpdateText(#game:GetService("Players"):GetChildren())
  end))

end

function DisplayTextComponent:Start()
    self:UpdateText(#game:GetService("Players"):GetChildren())
end

function DisplayTextComponent:WaitForInstance()

end

function DisplayTextComponent:UpdateText(number)
  self.MyText = tostring(number) .. "/4 Jogadores"
  self.Instance.Text = self.MyText

  if number >= 4 then
    local clock = 5
    while clock > 0 do
      clock -= 1
      self.MyText = clock .. " segundos para começar a partida"
      self.Instance.Text = self.MyText
      wait(1)
    end
  end
end

return DisplayTextComponent
