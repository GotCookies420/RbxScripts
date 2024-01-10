local p = game.Players.LocalPlayer
local life = 1

function refreshESP(target:Player)
	local highlight = Instance.new("Highlight")
	local billboard = Instance.new("BillboardGui")
	local textlabel = Instance.new("TextLabel")
	
	highlight.Parent = target.Character
	billboard.Parent = target.Character
	billboard.Size = UDim2.new({10, 0},{2, 0})
	billboard.StudsOffsetWorldSpace = Vector3.new(0, 5, 0)
	billboard.LightInfluence = 0
	billboard.AlwaysOnTop = true
	billboard.ResetOnSpawn = false
	textlabel.Parent = billboard
	textlabel.Size = UDim2.new({1, 0}, {1, 0})
	textlabel.TextScaled = true
	textlabel.Font = Enum.Font.ArialBold
	textlabel.Text = target.Name
	
	game.Debris:AddItem(highlight, life)
	game.Debris:AddItem(billboard, life)
	game.Debris:AddItem(textlabel, life)
end

while task.wait(life) do
	for _, enemy in pairs(game.Players:GetPlayers()) do
		refreshESP(enemy)
	end
end
