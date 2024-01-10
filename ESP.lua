local p = game.Players.LocalPlayer
local life = 1
local extra = .1
local espItems = {}

function refreshESP()
	for _, EI in pairs(espItems) do
		EI:Destroy()
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
		billboard.Parent = p.PlayerGui

		textlabel.Visible = true
		textlabel.BackgroundTransparency = 1
		textlabel.Parent = billboard
		textlabel.Size = UDim2.new({1, 0}, {1, 0})
		textlabel.TextScaled = true
		textlabel.Font = Enum.Font.ArialBold
		textlabel.Text = target.Name.." ("..target.Character:FindFirstChildOfClass("Humanoid").Health.." Health)"
		
		table.insert(espItems, highlight)
		table.insert(espItems, billboard)
	end
end

refreshESP()

game.Players.PlayerAdded:Connect(function(p2)
	p2.CharacterAdded:Connect(function()
		refreshESP()
	end)
end)

game.Players.PlayerRemoving:Connect(function()
	refreshESP()
end)
