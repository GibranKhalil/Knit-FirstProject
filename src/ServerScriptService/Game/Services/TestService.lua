local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local TestService = Knit.CreateService{
    Name = "TestService";
    Client = {};
}
function TestService:KnitInit()
    print("Testservice Iniciou")
end
--Primeiro o serviço é inicilizado, momento perfeito para configurar as variáveis e outros dados antes de iniciar a conexão com os controllers

function TestService:KnitStart()
    print("TestService start")    
end
--Quando elas são 'startadas' pode se começar a fazer a conexão com os controllers

return TestService