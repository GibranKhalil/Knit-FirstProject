local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local ArenaService = Knit.CreateService{
    Name = "ArenaService";
    Client = {};
}

ArenaService.BlueScore = 0;
ArenaService.RedScore = 0;

function ArenaService:StartGame()
    self.BlueScore = 0;
    self.RedScore = 0;
end


function ArenaService:KnitInit()
    print("ArenaService Iniciou")
end
--Primeiro o serviço é inicilizado, momento perfeito para configurar as variáveis e outros dados antes de iniciar a conexão com os controllers

function ArenaService:KnitStart()
    self:StartGame()   
end
--Quando elas são 'startadas' pode se começar a fazer a conexão com os controllers

return ArenaService