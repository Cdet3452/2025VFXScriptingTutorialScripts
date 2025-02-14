--Get all player related references
local player = game.Players.LocalPlayer
local character = script.Parent
local humanoid = character.Humanoid

--Get all service related references, UIS is for your input for example q to start the effect
--rs for replicated storage where all effects, meshes, and sounds are stored
local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")

--This simply is the button you want to press you can change the Q to anything on your keyboard-
local KEY = Enum.KeyCode.Q


local function ColorCorrectionEffect()
	local ColorCorrection = Instance.new('ColorCorrectionEffect')
	ColorCorrection.Contrast = 30
	ColorCorrection.Parent = game:GetService('Lighting')
	ColorCorrection.TintColor = Color3.new(1, 0.54902, 0)
	
	
	task.delay(0.04, function()
		ColorCorrection.Saturation = -1
		ColorCorrection.Contrast = 3

		task.wait(0.02)
		ColorCorrection:Destroy()
	end)
end



local function enableParticles(youreffect, enabled)
	for _, Particle in pairs(youreffect:GetDescendants()) do
		if Particle:IsA("ParticleEmitter") then
			Particle.Enabled = enabled
		end
		if Particle:IsA("Beam") then
			Particle.Enabled = enabled
		end
		if Particle:IsA("Trail") then
			Particle.Enabled = enabled
		end
		if Particle:IsA("PointLight") then
			Particle.Enabled = enabled
		end
	end
end

local function emitParticles(youreffect)
	for _,Particles in pairs(youreffect:GetDescendants()) do
		if Particles:IsA("ParticleEmitter") then
			Particles:Emit(Particles:GetAttribute("EmitCount"))
		end
	end
end

local camera = workspace.CurrentCamera
local CameraShanker = require(rs.Modules.CameraShaker)

local camShake = CameraShanker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame)
	camera.CFrame = camera.CFrame * shakeCFrame
end)
camShake:Start()


local rockModule = require(rs.Modules.RockModule)

--this is what causes the effect to play, gpe is the input and it needs it for inputbegan to even work im sure--
uis.InputBegan:Connect(function(input, v)
	if v then return end
	if input.KeyCode == KEY then
		--like stated above this clones the Sphere, then positions it on Main, then sizes it, then puts it in the -fx folder to fix up clutter

		local Sphere = rs.VFX.TutorialEffectEnabled:Clone()
		Sphere.CFrame = workspace.Main.CFrame
		Sphere.Size = Vector3.new(5, 5, 5)
		Sphere.Parent = workspace.Fx
		
		local SphereEmit = rs.VFX.TutorialEffectEmit:Clone()
		SphereEmit.CFrame = workspace.Main.CFrame
		SphereEmit.Size = Vector3.new(5, 5, 5)
		SphereEmit.Parent = workspace.Fx
		
		rs.SFX.VFXTutorialAudio:Play()
		
		camShake:ShakeOnce(4, 10, .2, .4)
		
		ColorCorrectionEffect()
		
		rockModule.Crater(workspace.Main.CFrame, 5, 30, 60, true)
		rockModule.CraterRows(workspace.Main.CFrame, 15, 3, 5, 20, 40, true)
		rockModule.Explosion(workspace.Main.CFrame, 30, 1, 1.5, true)
		
		emitParticles(SphereEmit)
		enableParticles(Sphere, true)
		
		task.wait(2)
		
		enableParticles(Sphere)
	end
end)
