local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
-- Accessing PlayerGui from a LocalScript:

 --Aqui é buscado cada serviço que é um ModuleScript _->Posicao(não utlizado) v-> Valor

 for _, v in script.Parent.Controllers:GetDescendants() do
    if v:IsA("ModuleScript") then
        require(v)
    end
end

 --Aqui é buscado cada serviço que é um ModuleScript _->Posicao(não utlizado) v-> Valor

Knit.Start():andThen(function()    
    for _, component in script.Parent.Components:GetDescendants()do
        if component:IsA("ModuleScript")then
            require(component)
        end
    end    
end):catch(warn)

--Aqui é iniciado o Knit.