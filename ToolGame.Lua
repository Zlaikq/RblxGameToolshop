game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder", plr)
	leaderstats.Name = "leaderstats"
	local coins = Instance.new("IntValue", leaderstats)
	coins.Name = "Coins"
	coins.Value = 50
	
end)

local addCoins = game.ReplicatedStorage.AddCoins
local addSword = game.ReplicatedStorage.AddSword
local addShield = game.ReplicatedStorage.AddShield
local addGun = game.ReplicatedStorage.AddGun
local sword = game.ReplicatedStorage.Sword
local shield = game.ReplicatedStorage.Shield
local gun = game.ReplicatedStorage.Gun


addCoins.OnServerEvent:Connect(function(player)
	local leaderstats = player.leaderstats
	local coins = leaderstats.Coins
	coins.Value += 10
end)

addSword.OnServerInvoke = function(player)
	local inventory = player:FindFirstChild("Backpack")
	local boughtSword = false
	local leaderstats = player.leaderstats
	local coins = leaderstats.Coins
	
	if coins.Value >= 10 then
		boughtSword = true
		coins.Value -= 10
		local swordClone = sword:Clone()
		swordClone.Parent = inventory
		
	end
	
	return boughtSword
	
end

addGun.OnServerInvoke = function(player)
	local inventory = player:FindFirstChild("Backpack")
	local boughtGun = false
	local leaderstats = player.leaderstats
	local coins = leaderstats.Coins
	
	if coins.Value >= 20 then
		boughtGun = true
		coins.Value -= 20
		local gunClone = gun:Clone()
		gunClone.Parent = inventory

	end
	
	return boughtGun
	
end

addShield.OnServerInvoke = function(player)
	local inventory = player:FindFirstChild("Backpack")
	local boughtShield = false
	local leaderstats = player.leaderstats
	local coins = leaderstats.Coins
	
	if coins.Value >= 15 then
		boughtShield = true
		coins.Value -= 20
		local shieldClone = shield:Clone()
		shieldClone.Parent = inventory

	end

	return boughtShield
	
end





#script 2
local screenGui = script.Parent
local intro = screenGui.Intro
local sword = screenGui.Sword
local gun = screenGui.Gun
local shield = screenGui.Shield
local coinButton = screenGui.Coins

local addCoins = game.ReplicatedStorage.AddCoins
local addSword = game.ReplicatedStorage.AddSword
local addGun = game.ReplicatedStorage.AddGun
local addShield = game.ReplicatedStorage.AddShield

local Players = game.Players
local player = Players.LocalPlayer

local leaderstats = player:FindFirstChild("leaderstats")
local coins = leaderstats:FindFirstChild("Coins")


coinButton.MouseButton1Click:Connect(function()
	addCoins:FireServer()
end)

sword.MouseButton1Click:Connect(function()
	local boughtSword = addSword:InvokeServer()
	local notEnough = 10 - coins.Value
	if boughtSword == true then
		intro.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		intro.Text = "You bought a "..sword.Name.."!"
	else
		intro.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		intro.Text = "You need "..notEnough.." more coins!"
	end
	
end)

gun.MouseButton1Click:Connect(function()
	local boughtGun = addGun:InvokeServer()
	local notEnough = 20 - coins.Value
	
	if boughtGun == true then
		intro.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		intro.Text = "You bought a "..gun.Name.."!"
	else
		intro.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		intro.Text = "You need "..notEnough.." more coins!"
	end
end)

shield.MouseButton1Click:Connect(function()
	local boughtShield = addShield:InvokeServer()
	local notEnough = 15 - coins.Value
	
	if boughtShield == true then
		intro.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		intro.Text = "You bought a "..shield.Name.."!"
	else
		intro.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		intro.Text = "You need "..notEnough.." more coins!"
	end
end)
