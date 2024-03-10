local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local MainService = Knit.CreateService {
    Name = "MainService",
    Client = {},
}

MainService.ROUNDTIME = 30

local gameConfig = {
    roles = {"Werewolf", "Seer", "Villager"},
    roleClasses = {
      Werewolf = require(ReplicatedStorage.Class.Werewolf),
      Seer = require(ReplicatedStorage.Class.Seer),
      Villager = require(ReplicatedStorage.Class.Villager),
    },
    roleCounts = {
      [4] = {
        Werewolf = 1,
        Seer = 1,
        Villager = 2,
      },
      [8] = {
        Werewolf = 2,
        Seer = 1,
        Villager = 5,
      },
      [10] = {
        Werewolf = 3,
        Seer = 2,
        Villager = 5,
      },
      [12] = {
        Werewolf = 4,
        Seer = 3,
        Villager = 7,
      },
    },
    minPlayers = 4,
    maxPlayers = 12,
}



function MainService:SelectRoles()
    local playerCount = #game:GetService("Players"):GetPlayers()
    
    -- Verifique se há um número válido de jogadores
    if playerCount < gameConfig.minPlayers or playerCount > gameConfig.maxPlayers then
        warn("Número inválido de jogadores")
        return
    end
    
    -- Determine o conjunto de funções disponíveis com base no número de jogadores
    local roleSet = gameConfig.roleCounts[playerCount]
    if not roleSet then
        warn("Número de jogadores não suportado")
        return
    end
    
    -- Crie uma lista de funções disponíveis
    local availableRoles = {}
    for role, count in pairs(roleSet) do
        for i = 1, count do
            table.insert(availableRoles, role)
        end
    end
    
    -- Embaralhe as funções disponíveis
    for i = #availableRoles, 2, -1 do
        local j = math.random(i)
        availableRoles[i], availableRoles[j] = availableRoles[j], availableRoles[i]
    end
    
    -- Atribua as funções aos jogadores
    local players = game:GetService("Players"):GetPlayers()
    for i, player in ipairs(players) do
        local roleIndex = i % #availableRoles + 1
        local role = availableRoles[roleIndex]
        local class = gameConfig.roleClasses[role]
        if class then
            local instance = class.new(player.Name)
            player:SetAttribute("Role", role)
            print("Jogador:", player.Name, "Função:", role)
        else
            warn("Nenhuma função disponível para este jogador")
        end
    end
end



function onPlayerAdded()
    if #game:GetService("Players"):GetPlayers() >= 4 then
        MainService:SelectRoles()
    end
end

function onPlayerRemoved()
    -- MainService.TOTALPLAYERS_NUMBER -= 1
end

game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)
game:GetService("Players").PlayerRemoving:Connect(onPlayerRemoved)

function MainService:SpendTime()
    while self.ROUNDTIME > 0 do
        self.ROUNDTIME -= 1
        wait(1)
    end
end


function MainService:KnitStart()
    print("Mainservice startou")
end


function MainService:KnitInit()
    print("MainService iniciou")
end


return MainService
