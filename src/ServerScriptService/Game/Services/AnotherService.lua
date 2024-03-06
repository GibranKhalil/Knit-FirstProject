local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local AnotherService = Knit.CreateService{
    Name = "AnotherService";
    Client = {};
}
function AnotherService:KnitInit()
    print("AnotherService Iniciou")
end
--Primeiro o serviço é inicilizado, momento perfeito para configurar as variáveis e outros dados antes de iniciar a conexão com os controllers

function AnotherService:KnitStart()
    print("AnotherService start")    
end
--Quando elas são 'startadas' pode se começar a fazer a conexão com os controllers

return AnotherService