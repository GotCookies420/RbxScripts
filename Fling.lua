-- lol
local ui = Instance.new("ScreenGui")
local btn = Instance.new("TextButton")
local ebtn = Instance.new("TextButton")
local angular = nil
print("byfron is dogshit")

ui.Name = "fling ui thing"
ui.ResetOnSpawn = false
btn.Text = "start fling"
btn.Size = UDim2.new(0.25, 0, 0.125, 0)
btn.TextScaled = true

ebtn.Text = "end fling"
ebtn.Size = UDim2.new(0.25, 0, 0.125, 0)
ebtn.Position = UDim2.new(0.25, 0, 0, 0)
ebtn.TextScaled = true

function start(c)
  angular = Instance.new("AngularVelocity", c:FindFirstChild("HumanoidRootPart"))

      angular.AngularVelocity = Vector3.new(999999999, 999999999, 999999999)
      angular.MaxTorque = math.huge
angular.Attachment0 = c:FindFirstChild("HumanoidRootPart").RootAttachment
  angular.Visible = true
  angular.Parent = c:FindFirstChild("HumanoidRootPart")
      
  print("began woosh")
end
  function endf()
    if angular ~= nil then
      angular:Destroy()
      angular = nil
    end
  end

--start(game.Players.LocalPlayer.Character)

ui.Parent = game.Players.LocalPlayer.PlayerGui
btn.Parent = ui
ebtn.Parent = ui
btn.Activated:Connect(function()
    start(game.Players.LocalPlayer.Character)
  end)
ebtn.Activated:Connect(function()
  endf()
  end)
