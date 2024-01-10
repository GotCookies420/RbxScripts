local plrService = game.Players

function newESP(char)
local esphl = Instance.new("Highlight")

esphl.Parent = char
end)

for _, p in pairs(plrService:GetPlayers()) do
newESP(p.Character)
end

plrService.PlayerAdded:Connect(function(p)
  p.CharacterAdded:Connect(function(c)
      newESP(c)
    end)
end)
