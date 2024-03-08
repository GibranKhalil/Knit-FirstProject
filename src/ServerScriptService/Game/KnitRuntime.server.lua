local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local Component = require(Knit.Util.Component)


for _, v in script.Parent.Services:GetDescendants() do
    if v:IsA("ModuleScript") then
        require(v)
    end
end
 --Aqui é buscado cada serviço que é um ModuleScript _->Posicao(não utlizado) v-> Valor

 

Knit.Start():andThen(function()
    Component.Auto(script.Parent.Components)
end):catch(warn)

--Aqui é iniciado o Knit.