local p = game.Players.LocalPlayer
local life = 1
local extra = .1

function refreshESP(target:Player)
	local highlight = Instance.new("Highlight")
	local billboard = Instance.new("BillboardGui")
	local textlabel = Instance.new("TextLabel")

	highlight.Parent = target.Character
	highlight.OutlineTransparency = 0
	
	if target.Neutral == false then
		highlight.FillColor = target.Team.TeamColor.Color
		highlight.OutlineColor = target.Team.TeamColor.Color
	else
		highlight.FillColor = Color3.fromRGB(143, 143, 143)
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	end
	
	billboard.Adornee = target.Character
	billboard.Parent = p.PlayerGui
	
	textlabel.Visible = true
	textlabel.BackgroundTransparency = 1
	textlabel.Parent = billboard
	textlabel.Size = UDim2.new({1, 0}, {1, 0})
	textlabel.TextScaled = true
	textlabel.Font = Enum.Font.ArialBold
	textlabel.Text = target.Name.." ("..target.Character:FindFirstChildOfClass("Humanoid").Health.." Health)"

	game.Debris:AddItem(highlight, life + extra)
	game.Debris:AddItem(billboard, life + extra)
end

while task.wait(life) do
	for _, enemy in pairs(game.Players:GetPlayers()) do
		refreshESP(enemy)
	end
end
