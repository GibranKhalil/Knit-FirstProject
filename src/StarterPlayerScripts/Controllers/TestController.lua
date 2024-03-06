local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local TestController = Knit.CreateService{
    Name = "TestController";
    Client = {};
}
function TestController:KnitInit()
    print("TestController Iniciou")
end
--Primeiro o serviço é inicilizado, momento perfeito para configurar as variáveis e outros dados antes de iniciar a conexão com os controllers

function TestController:KnitStart()
    print("TestController start")    
end
--Quando elas são 'startadas' pode se começar a fazer a conexão com os controllers

return TestController