local p = game.Players.LocalPlayer
local espItems = {}

function refreshESP()
	if espItems ~= {} then
	for _, EI in pairs(espItems) do
		EI:Destroy()
	end
	end

	espItems = {}

	for _, target in pairs(game.Players:GetPlayers()) do
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
		billboard.Parent = target.Character

		textlabel.Visible = true
		textlabel.BackgroundTransparency = 1
		textlabel.Parent = billboard
		textlabel.Size = UDim2.new({1, 0}, {1, 0})
		textlabel.TextScaled = true
		textlabel.Font = Enum.Font.ArialBold
		textlabel.Text = target.Name.." | "..target.Character:FindFirstChildOfClass("Humanoid").Health.." | "..tostring((target.Character:FindFirstChild("HumanoidRootPart").Position - p.Character.HumanoidRootPart.Position).magnitude or nil).." studs"

		table.insert(espItems, highlight)
		table.insert(espItems, billboard)
	end
end

refreshESP()

for _, p2 in pairs(game.Players:GetPlayers()) do
	p2.CharacterAdded:Connect(function()
		refreshESP()
	end)

	p2.Changed:Connect(function()
		if p
	end)
end

game.Players.PlayerAdded:Connect(function(p2)
	local team = p2.Team
			
	p2.CharacterAdded:Connect(function()
		refreshESP()
	end)

	p2.Changed:Connect(function()
		if p2.Team ~= team then
			team = p2.Team
			refreshESP()
		end
	end)
end
