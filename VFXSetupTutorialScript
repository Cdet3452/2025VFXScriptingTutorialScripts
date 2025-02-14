--This will be ordered from how the video starts, This is the best spot to start if your following along.

Cloning:

--Get all player related references
local player = game.Players.LocalPlayer
local character = script.Parent
local humanoid = character.Humanoid

--Get all service related references, UIS is for your input for example q to start the effect
--rs for replicated storage where all effects, meshes, and sounds are stored
local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")

--This simply is the button you want to press you can change the Q to anything on your keyboard
local KEY = Enum.KeyCode.Q

--this is what causes the effect to play, gpe is the input and it needs it for inputbegan to even work im sure
--this all spawns the mesh "Sphere" on your character humanoid root part cframe and spawns it with 0 size but it also instantiates it in the workspace
uis.InputBegan:Connect(function(input, v)
	if v then return end
	if input.KeyCode == KEY then
		--like stated above this clones the Sphere, then positions it on you, then sizes it, then puts it in the fx folder to fix up clutter
		
		local Sphere = rs.Fx.Sphere:Clone()
		Sphere.CFrame = workspace.Week14Progress.Day2.Start.CFrame
		Sphere.Size = Vector3.new(0, 0, 0)
		Sphere.Parent = workspace.Fx
		
	end
end)

--Emitting Particles Function:

local function emitParticles(youreffect)
	for _,Particles in pairs(youreffect:GetDescendants()) do
		if Particles:IsA("ParticleEmitter") then
			Particles:Emit(Particles:GetAttribute("EmitCount"))
		end
	end
end

--Playing Sound Through Code Line:

rs.SFX.VFXTutorialAudio:Play()

--Enabling Effect Function:

local function enableParticles(youreffect, enabled)
	for _, Particle in pairs(youreffect:GetDescendants()) do
		if Particle:IsA("ParticleEmitter") then
			Particle.Enabled = enabled
		end
end

--And this is the lights, beams, and trails you can add into the code above:

    if Particle:IsA("Beam") then
			Particle.Enabled = enabled
		end
		if Particle:IsA("Trail") then
			Particle.Enabled = enabled
		end
		if Particle:IsA("PointLight") then
			Particle.Enabled = enabled
		end

--Rock Module Require code

local rockModule = require(rs.Modules.RockModule)


--Camera Shake Setup/Require Code:

local camera = workspace.CurrentCamera
local CameraShanker = require(rs.Modules.CameraShaker)

local camShake = CameraShanker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame)
	camera.CFrame = camera.CFrame * shakeCFrame
end)
camShake:Start()

--This is the camshake code:

camShake:ShakeOnce(4, 10, .2, .4)

--This is the ColorCorrection Function:

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


	
