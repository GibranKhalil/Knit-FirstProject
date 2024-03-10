local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

for _, v in script.Parent.Services:GetDescendants() do
    if v:IsA("ModuleScript") then
        require(v)
    end
end
 --Aqui é buscado cada serviço que é um ModuleScript _->Posicao(não utlizado) v-> Valor

 

 Knit.Start():andThen(function()
    
end):catch(warn)

--Aqui é iniciado o Knit.