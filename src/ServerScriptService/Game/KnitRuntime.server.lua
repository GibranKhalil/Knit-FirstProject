local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

for _, v in script.Parent.Services:GetDescendants() do
    if v:IsA("ModuleScript") then
        require(v)
    end
end


Knit.Start():andThen(function()
    print("Knit iniciou")
end):catch(warn)