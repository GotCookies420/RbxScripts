-- lol
local ui = Instance.new("ScreenGui")
local btn = Instance.new("TextButton")
local ebtn = Instance.new("TextButton")
local tfbtn = Instance.new("TextButton")
local target = Instance.new("TextBox")
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

tfbtn.Text = "fling target"
tfbtn.Size = UDim2.new(0.25, 0, 0.125, 0)
tfbtn.Position = UDim2.new(0.75, 0, 0, 0)
tfbtn.TextScaled = true

target.PlaceholderText = "fling victim"
target.Text = ""
target.Size = UDim2.new(0.25, 0, 0.125, 0)
target.Position = UDim2.new(0.5, 0, 0, 0)
target.TextScaled = true

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
function flingtarg(c)
  local fip = true
  spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
          if fip then
          c:FindFirstChild("HumanoidRootPart").Position = game.Players:FindFirstChild(target.Text).Character:FindFirstChild("HumanoidRootPart").Position
          end
          end)
   end)

  start()
  task.delay(0.5, function()
    endf()
      fip = false
    end)
end

--start(game.Players.LocalPlayer.Character)

ui.Parent = game.Players.LocalPlayer.PlayerGui
btn.Parent = ui
ebtn.Parent = ui
tfbtn.Parent = ui
target.Parent = ui
btn.Activated:Connect(function()
    start(game.Players.LocalPlayer.Character)
  end)
ebtn.Activated:Connect(function()
  endf()
  end)
tfbtn.Activated:Connect(function()
    flingtarg(game.Players.LocalPlayer.Character)
  end)
