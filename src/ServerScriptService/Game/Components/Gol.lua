local Knit = require(game:GetService("ReplicatedStorage").Knit)
local Maid = require(Knit.Util.Maid)

local Gol = {}
Gol.__index = Gol

Gol.Tag = "Gol"

function Gol.new(instance)
    local self = setmetatable({}, Gol)
    self._maid = Maid.new()
    print("Gol criado")
    self._maid:GiveTask(function()
        print("Gol destruido")
    end)
    return self
end

function Gol:Destroy()
    self._maid:Destroy()
end

return Gol