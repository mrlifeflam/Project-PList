--MasterControl
local MasterControl = {}

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')

local HasVRAPI = pcall(function() return UserInputService.VREnabled and UserInputService.GetUserCFrame end)


local LocalPlayer = Players.LocalPlayer
LocalPlayer.PlayerScripts.PlayerModule:Destroy()
script.Parent.Parent = game.Players.LocalPlayer.PlayerScripts
script.Parent.Name = "ControlScript"
local CachedHumanoid = nil
local RenderSteppedCon = nil
local SeatedCn = nil
local moveFunc = LocalPlayer.Move

local isJumping = false
local isSeated = false
local myVehicleSeat = nil
local moveValue = Vector3.new(0,0,0)


function MasterControl:GetHumanoid()
	local character = LocalPlayer and LocalPlayer.Character
	if character then
		if CachedHumanoid and CachedHumanoid.Parent == character then
			return CachedHumanoid
		else
			CachedHumanoid = nil
			for _,child in pairs(character:GetChildren()) do
				if child:IsA('Humanoid') then
					CachedHumanoid = child
					return CachedHumanoid
				end
			end
		end
	end
end
function MasterControl:Init()
	
	local renderStepFunc = function()
		if LocalPlayer and LocalPlayer.Character then
			local humanoid = self:GetHumanoid()
			if not humanoid then return end
			
			if humanoid and not humanoid.PlatformStand and isJumping then
				humanoid.Jump = isJumping
			end
			
			local adjustedMoveValue = moveValue
			if HasVRAPI and UserInputService.VREnabled and workspace.CurrentCamera.HeadLocked then
				local vrFrame = UserInputService.UserHeadCFrame
				local lookVector = Vector3.new(vrFrame.lookVector.X, 0, vrFrame.lookVector.Z).unit
				local rotation = CFrame.new(Vector3.new(0, 0, 0), lookVector)
				adjustedMoveValue = rotation:vectorToWorldSpace(adjustedMoveValue)
			end
			
			moveFunc(LocalPlayer, adjustedMoveValue, true)	
			
			
		end
	end
	
	local success = pcall(function() RunService:BindToRenderStep("MasterControlStep", Enum.RenderPriority.Input.Value, renderStepFunc) end)
	
	if not success then
		if RenderSteppedCon then return end
		RenderSteppedCon = RunService.RenderStepped:connect(renderStepFunc)
	end
end

function MasterControl:Disable()
	local success = pcall(function() RunService:UnbindFromRenderStep("MasterControlStep") end)
	if not success then
		if RenderSteppedCon then
			RenderSteppedCon:disconnect()
			RenderSteppedCon = nil
		end
	end
	
	moveValue = Vector3.new(0,0,0)
	isJumping = false
end

function MasterControl:AddToPlayerMovement(playerMoveVector)
	moveValue = Vector3.new(moveValue.X + playerMoveVector.X, moveValue.Y + playerMoveVector.Y, moveValue.Z + playerMoveVector.Z)
end

function MasterControl:GetMoveVector()
	return moveValue
end

function MasterControl:SetIsJumping(jumping)
	isJumping = jumping
end

function MasterControl:DoJump()
	local humanoid = self:GetHumanoid()
	if humanoid then
		humanoid.Jump = true
	end
end
--DPad
local Players = game:GetService('Players')
local GuiService = game:GetService('GuiService')

local DPad = {}


local LocalPlayer = Players.LocalPlayer
local DPadFrame = nil
local TouchObject = nil
local OnInputEnded = nil

local DPAD_SHEET = "rbxasset://textures/ui/DPadSheet.png"
local COMPASS_DIR = {
	Vector3.new(1, 0, 0),
	Vector3.new(1, 0, 1).unit,
	Vector3.new(0, 0, 1),
	Vector3.new(-1, 0, 1).unit,
	Vector3.new(-1, 0, 0),
	Vector3.new(-1, 0, -1).unit,
	Vector3.new(0, 0, -1),
	Vector3.new(1, 0, -1).unit,
}
local ATAN2 = math.atan2
local FLOOR = math.floor
local PI = math.pi

local function createArrowLabel(name, position, size, rectOffset, rectSize)
	local image = Instance.new('ImageLabel')
	image.Name = name
	image.Image = DPAD_SHEET
	image.ImageRectOffset = rectOffset
	image.ImageRectSize = rectSize
	image.BackgroundTransparency = 1
	image.Size = size
	image.Position = position
	image.Parent = DPadFrame
	
	return image
end

local function getCenterPosition()
	return Vector2.new(DPadFrame.AbsolutePosition.x + DPadFrame.AbsoluteSize.x/2, DPadFrame.AbsolutePosition.y + DPadFrame.AbsoluteSize.y/2)
end

function DPad:Enable()
	DPadFrame.Visible = true
end

function DPad:Disable()
	DPadFrame.Visible = false
	OnInputEnded()
end

function DPad:Create(parentFrame)
	if DPadFrame then
		DPadFrame:Destroy()
		DPadFrame = nil
	end
	
	local position = UDim2.new(0, 10, 1, -230)
	DPadFrame = Instance.new('Frame')
	DPadFrame.Name = "DPadFrame"
	DPadFrame.Active = true
	DPadFrame.Visible = false
	DPadFrame.Size = UDim2.new(0, 192, 0, 192)
	DPadFrame.Position = position
	DPadFrame.BackgroundTransparency = 1
	
	local smArrowSize = UDim2.new(0, 23, 0, 23)
	local lgArrowSize = UDim2.new(0, 64, 0, 64)
	local smImgOffset = Vector2.new(46, 46)
	local lgImgOffset = Vector2.new(128, 128)
	
	local bBtn = createArrowLabel("BackButton", UDim2.new(0.5, -32, 1, -64), lgArrowSize, Vector2.new(0, 0), lgImgOffset)
	local fBtn = createArrowLabel("ForwardButton", UDim2.new(0.5, -32, 0, 0), lgArrowSize, Vector2.new(0, 258), lgImgOffset)
	local lBtn = createArrowLabel("LeftButton", UDim2.new(0, 0, 0.5, -32), lgArrowSize, Vector2.new(129, 129), lgImgOffset)
	local rBtn = createArrowLabel("RightButton", UDim2.new(1, -64, 0.5, -32), lgArrowSize, Vector2.new(0, 129), lgImgOffset)
	local jumpBtn = createArrowLabel("JumpButton", UDim2.new(0.5, -32, 0.5, -32), lgArrowSize, Vector2.new(129, 0), lgImgOffset)
	local flBtn = createArrowLabel("ForwardLeftButton", UDim2.new(0, 35, 0, 35), smArrowSize, Vector2.new(129, 258), smImgOffset)
	local frBtn = createArrowLabel("ForwardRightButton", UDim2.new(1, -55, 0, 35), smArrowSize, Vector2.new(176, 258), smImgOffset)
	flBtn.Visible = false
	frBtn.Visible = false
	
	jumpBtn.InputBegan:connect(function(inputObject)
		MasterControl:DoJump()
	end)
	
	local movementVector = Vector3.new(0,0,0)
	local function normalizeDirection(inputPosition)
		local jumpRadius = jumpBtn.AbsoluteSize.x/2
		local centerPosition = getCenterPosition()
		local direction = Vector2.new(inputPosition.x - centerPosition.x, inputPosition.y - centerPosition.y)
		
		if direction.magnitude > jumpRadius then
			local angle = ATAN2(direction.y, direction.x)
			local octant = (FLOOR(8 * angle / (2 * PI) + 8.5)%8) + 1
			movementVector = COMPASS_DIR[octant]
		end
		
		if not flBtn.Visible and movementVector == COMPASS_DIR[7] then
			flBtn.Visible = true
			frBtn.Visible = true
		end
	end
	
	DPadFrame.InputBegan:connect(function(inputObject)
		if TouchObject or inputObject.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		
		MasterControl:AddToPlayerMovement(-movementVector)
		
		TouchObject = inputObject
		normalizeDirection(TouchObject.Position)
		
		MasterControl:AddToPlayerMovement(movementVector)
	end)
	
	DPadFrame.InputChanged:connect(function(inputObject)
		if inputObject == TouchObject then
			MasterControl:AddToPlayerMovement(-movementVector)
			normalizeDirection(TouchObject.Position)
			MasterControl:AddToPlayerMovement(movementVector)
			MasterControl:SetIsJumping(false)
		end
	end)
	
	OnInputEnded = function()
		TouchObject = nil
		flBtn.Visible = false
		frBtn.Visible = false
		
		MasterControl:AddToPlayerMovement(-movementVector)
		movementVector = Vector3.new(0, 0, 0)
	end
	
	DPadFrame.InputEnded:connect(function(inputObject)
		if inputObject == TouchObject then
			OnInputEnded()
		end
	end)
	
	GuiService.MenuOpened:connect(function()
		if TouchObject then
			OnInputEnded()
		end
	end)
	
	DPadFrame.Parent = parentFrame
end
--Gamepad
local Gamepad = {}

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local ContextActionService = game:GetService('ContextActionService')
local StarterPlayer = game:GetService('StarterPlayer')
local Settings = UserSettings()
local GameSettings = Settings.GameSettings
local currentMoveVector = Vector3.new(0,0,0)
local activateGamepad = nil

local gamepadConnectedCon = nil
local gamepadDisconnectedCon = nil


local LocalPlayer = Players.LocalPlayer

local thumbstickDeadzone = 0.22

function assignActivateGamepad()
	local connectedGamepads = UserInputService:GetConnectedGamepads()
	if #connectedGamepads > 0 then
		for i = 1, #connectedGamepads do
			if activateGamepad == nil then
				activateGamepad = connectedGamepads[i]
			elseif connectedGamepads[i].Value < activateGamepad.Value then
				activateGamepad = connectedGamepads[i]
			end
		end
	end
	
	if activateGamepad == nil then
		activateGamepad = Enum.UserInputType.Gamepad1
	end
end

function Gamepad:Enable()
	local forwardValue  = 0
	local backwardValue = 0
	local leftValue = 0
	local rightValue = 0
	
	local moveFunc = LocalPlayer.Move
	local gamepadSupports = UserInputService.GamepadSupports
	
	local controlCharacterGamepad = function(actionName, inputState, inputObject)
		if activateGamepad ~= inputObject.UserInputType then return end
		if inputObject.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		
		if inputState == Enum.UserInputState.Cancel then
			MasterControl:AddToPlayerMovement(-currentMoveVector)
			currentMoveVector =  Vector3.new(0,0,0)
			return
		end
		
		if inputObject.Position.magnitude > thumbstickDeadzone then
			MasterControl:AddToPlayerMovement(-currentMoveVector)
			currentMoveVector =  Vector3.new(inputObject.Position.X, 0, -inputObject.Position.Y)
			MasterControl:AddToPlayerMovement(currentMoveVector)
		else
			MasterControl:AddToPlayerMovement(-currentMoveVector)
			currentMoveVector =  Vector3.new(0,0,0)
		end
	end
	
	local jumpCharacterGamepad = function(actionName, inputState, inputObject)
		if activateGamepad ~= inputObject.UserInputType then return end
		if inputObject.KeyCode ~= Enum.KeyCode.ButtonA then return end
		
		if inputState == Enum.UserInputState.Cancel then
			MasterControl:SetIsJumping(false)
			return
		end
		
		MasterControl:SetIsJumping(inputObject.UserInputState == Enum.UserInputState.Begin)
	end
	
	local doDpadMoveUpdate = function(userInputType)
		if not gamepadSupports(UserInputService, userInputType, Enum.KeyCode.Thumbstick1) then
			if LocalPlayer and LocalPlayer.Character then
				MasterControl:AddToPlayerMovement(-currentMoveVector)
				currentMoveVector = Vector3.new(leftValue + rightValue,0,forwardValue + backwardValue)
				MasterControl:AddToPlayerMovement(currentMoveVector)
			end
		end
	end
	
	local moveForwardFunc = function(actionName, inputState, inputObject)
		if inputState == Enum.UserInputState.End then
			forwardValue = -1
		elseif inputState == Enum.UserInputState.Begin or inputState == Enum.UserInputState.Cancel then
			forwardValue = 0
		end
		
		doDpadMoveUpdate(inputObject.UserInputType)
	end
	
	local moveBackwardFunc = function(actionName, inputState, inputObject)	
		if inputState == Enum.UserInputState.End then
			backwardValue = 1
		elseif inputState == Enum.UserInputState.Begin or inputState == Enum.UserInputState.Cancel then
			backwardValue = 0
		end
		
		doDpadMoveUpdate(inputObject.UserInputType)
	end
	
	local moveLeftFunc = function(actionName, inputState, inputObject)	
		if inputState == Enum.UserInputState.End then
			leftValue = -1
		elseif inputState == Enum.UserInputState.Begin or inputState == Enum.UserInputState.Cancel then
			leftValue = 0
		end
		
		doDpadMoveUpdate(inputObject.UserInputType)
	end
	
	local moveRightFunc = function(actionName, inputState, inputObject)	
		if inputState == Enum.UserInputState.End then
			rightValue = 1
		elseif inputState == Enum.UserInputState.Begin or inputState == Enum.UserInputState.Cancel then
			rightValue = 0
		end
		
		doDpadMoveUpdate(inputObject.UserInputType)
	end
	
	local function setActivateGamepad()
		if activateGamepad then
			ContextActionService:UnbindActivate(activateGamepad, Enum.KeyCode.ButtonR2)
		end
		assignActivateGamepad()
		if activateGamepad then
			ContextActionService:BindActivate(activateGamepad, Enum.KeyCode.ButtonR2)
		end
	end
	
	ContextActionService:BindAction("JumpButton",jumpCharacterGamepad, false, Enum.KeyCode.ButtonA)
	ContextActionService:BindAction("MoveThumbstick",controlCharacterGamepad, false, Enum.KeyCode.Thumbstick1)
	
	ContextActionService:BindAction("forwardDpad", moveForwardFunc, false, Enum.KeyCode.DPadUp)
	ContextActionService:BindAction("backwardDpad", moveBackwardFunc, false, Enum.KeyCode.DPadDown)
	ContextActionService:BindAction("leftDpad", moveLeftFunc, false, Enum.KeyCode.DPadLeft)
	ContextActionService:BindAction("rightDpad", moveRightFunc, false, Enum.KeyCode.DPadRight)
	
	setActivateGamepad()
	
	gamepadConnectedCon = UserInputService.GamepadDisconnected:connect(function(gamepadEnum)
		if activateGamepad ~= gamepadEnum then return end
		
		MasterControl:AddToPlayerMovement(-currentMoveVector)
		currentMoveVector = Vector3.new(0,0,0)
		
		activateGamepad = nil
		setActivateGamepad()
	end)

	gamepadDisconnectedCon = UserInputService.GamepadConnected:connect(function(gamepadEnum)
		if activateGamepad == nil then 
			setActivateGamepad()
		end
	end)
end

function Gamepad:Disable()
	
	ContextActionService:UnbindAction("forwardDpad")
	ContextActionService:UnbindAction("backwardDpad")
	ContextActionService:UnbindAction("leftDpad")
	ContextActionService:UnbindAction("rightDpad")
	
	ContextActionService:UnbindAction("MoveThumbstick")
	ContextActionService:UnbindAction("JumpButton")
	ContextActionService:UnbindActivate(activateGamepad, Enum.KeyCode.ButtonR2)
	
	if gamepadConnectedCon then gamepadConnectedCon:disconnect() end
	if gamepadDisconnectedCon then gamepadDisconnectedCon:disconnect() end
	
	activateGamepad = nil
	MasterControl:AddToPlayerMovement(-currentMoveVector)
	currentMoveVector = Vector3.new(0,0,0)
	MasterControl:SetIsJumping(false)
end
--ComputerMovementKeyboardMovement
local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local ContextActionService = game:GetService('ContextActionService')
local StarterPlayer = game:GetService('StarterPlayer')
local Settings = UserSettings()
local GameSettings = Settings.GameSettings

local KeyboardMovement = {}


local LocalPlayer = Players.LocalPlayer
local CachedHumanoid = nil
local SeatJumpCn = nil
local TextFocusReleasedCn = nil
local TextFocusGainedCn = nil
local WindowFocusReleasedCn = nil

local currentMoveVector = Vector3.new(0,0,0)

local function getHumanoid()
	local character = LocalPlayer and LocalPlayer.Character
	if character then
		if CachedHumanoid and CachedHumanoid.Parent == character then
			return CachedHumanoid
		else
			CachedHumanoid = nil
			for _,child in pairs(character:GetChildren()) do
				if child:IsA('Humanoid') then
					CachedHumanoid = child
					return CachedHumanoid
				end
			end
		end
	end
end

function KeyboardMovement:Enable()
	if not UserInputService.KeyboardEnabled then
		return
	end
	
	local forwardValue  = 0
	local backwardValue = 0
	local leftValue = 0
	local rightValue = 0
	
	local updateMovement = function(inputState)
		if inputState == Enum.UserInputState.Cancel then
			MasterControl:AddToPlayerMovement(-currentMoveVector)
			currentMoveVector = Vector3.new(0, 0, 0)
		else
			MasterControl:AddToPlayerMovement(-currentMoveVector)
			currentMoveVector = Vector3.new(leftValue + rightValue,0,forwardValue + backwardValue)
			MasterControl:AddToPlayerMovement(currentMoveVector)	
		end
	end
	
	local moveForwardFunc = function(actionName, inputState, inputObject)			
		if inputState == Enum.UserInputState.Begin then
			forwardValue = -1
		elseif inputState == Enum.UserInputState.End then
			forwardValue = 0
		end
		updateMovement(inputState)
	end
	
	local moveBackwardFunc = function(actionName, inputState, inputObject)	
		if inputState == Enum.UserInputState.Begin then
			backwardValue = 1
		elseif inputState == Enum.UserInputState.End then
			backwardValue = 0
		end
		updateMovement(inputState)
	end
	
	local moveLeftFunc = function(actionName, inputState, inputObject)	
		if inputState == Enum.UserInputState.Begin then
			leftValue = -1
		elseif inputState == Enum.UserInputState.End then
			leftValue = 0
		end
		updateMovement(inputState)
	end
	
	local moveRightFunc = function(actionName, inputState, inputObject)	
		if inputState == Enum.UserInputState.Begin then
			rightValue = 1
		elseif inputState == Enum.UserInputState.End then
			rightValue = 0
		end
		updateMovement(inputState)
	end
	
	local jumpFunc = function(actionName, inputState, inputObject)
		MasterControl:SetIsJumping(inputState == Enum.UserInputState.Begin)
	end
	
	ContextActionService:BindActionToInputTypes("forwardMovement", moveForwardFunc, false, Enum.PlayerActions.CharacterForward)
	ContextActionService:BindActionToInputTypes("backwardMovement", moveBackwardFunc, false, Enum.PlayerActions.CharacterBackward)
	ContextActionService:BindActionToInputTypes("leftMovement", moveLeftFunc, false, Enum.PlayerActions.CharacterLeft)
	ContextActionService:BindActionToInputTypes("rightMovement", moveRightFunc, false, Enum.PlayerActions.CharacterRight)
	ContextActionService:BindActionToInputTypes("jumpAction", jumpFunc, false, Enum.PlayerActions.CharacterJump)
	
	local function onFocusReleased()
		local humanoid = getHumanoid()
		if humanoid then
			MasterControl:AddToPlayerMovement(-currentMoveVector)
			currentMoveVector = Vector3.new(0, 0, 0)
			forwardValue, backwardValue, leftValue, rightValue = 0, 0, 0, 0
			MasterControl:SetIsJumping(false)
		end
	end
	
	local function onTextFocusGained(textboxFocused)
		MasterControl:SetIsJumping(false)
	end
	
	SeatJumpCn = UserInputService.InputBegan:connect(function(inputObject, isProcessed)
		if inputObject.KeyCode == Enum.KeyCode.Backspace and not isProcessed then
			local humanoid = getHumanoid()
			if humanoid and (humanoid.Sit or humanoid.PlatformStand) then
				MasterControl:DoJump()
			end
		end
	end)
	
	TextFocusReleasedCn = UserInputService.TextBoxFocusReleased:connect(onFocusReleased)
	TextFocusGainedCn = UserInputService.TextBoxFocused:connect(onTextFocusGained)
	WindowFocusReleasedCn = UserInputService.WindowFocused:connect(onFocusReleased)
end

function KeyboardMovement:Disable()
	ContextActionService:UnbindAction("forwardMovement")
	ContextActionService:UnbindAction("backwardMovement")
	ContextActionService:UnbindAction("leftMovement")
	ContextActionService:UnbindAction("rightMovement")
	ContextActionService:UnbindAction("jumpAction")
	
	if SeatJumpCn then
		SeatJumpCn:disconnect()
		SeatJumpCn = nil
	end
	if TextFocusReleasedCn then
		TextFocusReleasedCn:disconnect()
		TextFocusReleasedCn = nil
	end
	if TextFocusGainedCn then
		TextFocusGainedCn:disconnect()
		TextFocusGainedCn = nil
	end
	if WindowFocusReleasedCn then
		WindowFocusReleasedCn:disconnect()
		WindowFocusReleasedCn = nil
	end
	
	MasterControl:AddToPlayerMovement(-currentMoveVector)
	currentMoveVector = Vector3.new(0,0,0)
	MasterControl:SetIsJumping(false)
end
--Thumbpad
local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local GuiService = game:GetService('GuiService')

local Thumbpad = {}


local LocalPlayer = Players.LocalPlayer
local ThumbpadFrame = nil
local TouchObject = nil
local OnInputEnded = nil
local OnTouchChangedCn = nil
local OnTouchEndedCn = nil
local currentMoveVector = Vector3.new(0,0,0)

local DPAD_SHEET = "rbxasset://textures/ui/DPadSheet.png"
local TOUCH_CONTROL_SHEET = "rbxasset://textures/ui/TouchControlsSheet.png"
local function createArrowLabel(name, parent, position, size, rectOffset, rectSize)
	local image = Instance.new('ImageLabel')
	image.Name = name
	image.Image = DPAD_SHEET
	image.ImageRectOffset = rectOffset
	image.ImageRectSize = rectSize
	image.BackgroundTransparency = 1
	image.ImageColor3 = Color3.new(190/255, 190/255, 190/255)
	image.Size = size
	image.Position = position
	image.Parent = parent
	
	return image
end
function Thumbpad:Enable()
	ThumbpadFrame.Visible = true
end

function Thumbpad:Disable()
	ThumbpadFrame.Visible = false
	OnInputEnded()
end

function Thumbpad:Create(parentFrame)
	if ThumbpadFrame then
		ThumbpadFrame:Destroy()
		ThumbpadFrame = nil
		if OnTouchChangedCn then
			OnTouchChangedCn:disconnect()
			OnTouchChangedCn = nil
		end
		if OnTouchEndedCn then
			OnTouchEndedCn:disconnect()
			OnTouchEndedCn = nil
		end
	end
	
	local isSmallScreen = parentFrame.AbsoluteSize.y <= 500
	local thumbpadSize = isSmallScreen and 70 or 120
	local position = isSmallScreen and UDim2.new(0, thumbpadSize * 1.25, 1, -thumbpadSize - 20) or
		UDim2.new(0, thumbpadSize/2 - 10, 1, -thumbpadSize * 1.75 - 10)
	
	ThumbpadFrame = Instance.new('Frame')
	ThumbpadFrame.Name = "ThumbpadFrame"
	ThumbpadFrame.Visible = false
	ThumbpadFrame.Active = true
	ThumbpadFrame.Size = UDim2.new(0, thumbpadSize + 20, 0, thumbpadSize + 20)
	ThumbpadFrame.Position = position
	ThumbpadFrame.BackgroundTransparency = 1
	
	local outerImage = Instance.new('ImageLabel')
	outerImage.Name = "OuterImage"
	outerImage.Image = TOUCH_CONTROL_SHEET
	outerImage.ImageRectOffset = Vector2.new(0, 0)
	outerImage.ImageRectSize = Vector2.new(220, 220)
	outerImage.BackgroundTransparency = 1
	outerImage.Size = UDim2.new(0, thumbpadSize, 0, thumbpadSize)
	outerImage.Position = UDim2.new(0, 10, 0, 10)
	outerImage.Parent = ThumbpadFrame
	
	local smArrowSize = isSmallScreen and UDim2.new(0, 32, 0, 32) or UDim2.new(0, 64, 0, 64)
	local lgArrowSize = UDim2.new(0, smArrowSize.X.Offset * 2, 0, smArrowSize.Y.Offset * 2)
	local imgRectSize = Vector2.new(110, 110)
	local smImgOffset = isSmallScreen and -4 or -9
	local lgImgOffset = isSmallScreen and -28 or -55
	
	local dArrow = createArrowLabel("DownArrow", outerImage, UDim2.new(0.5, -smArrowSize.X.Offset/2, 1, lgImgOffset), smArrowSize, Vector2.new(8, 8), imgRectSize)
	local uArrow = createArrowLabel("UpArrow", outerImage, UDim2.new(0.5, -smArrowSize.X.Offset/2, 0, smImgOffset), smArrowSize, Vector2.new(8, 266), imgRectSize)
	local lArrow = createArrowLabel("LeftArrow", outerImage, UDim2.new(0, smImgOffset, 0.5, -smArrowSize.Y.Offset/2), smArrowSize, Vector2.new(137, 137), imgRectSize)
	local rArrow = createArrowLabel("RightArrow", outerImage, UDim2.new(1, lgImgOffset, 0.5, -smArrowSize.Y.Offset/2), smArrowSize, Vector2.new(8, 137), imgRectSize)
	
	local function doTween(guiObject, endSize, endPosition)
		guiObject:TweenSizeAndPosition(endSize, endPosition, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.15, true)
	end
	
	local padOrigin = nil
	local deadZone = 0.1
	local isRight, isLeft, isUp, isDown = false, false, false, false
	local vForward = Vector3.new(0, 0, -1)
	local vRight = Vector3.new(1, 0, 0)
	local function doMove(pos)
		MasterControl:AddToPlayerMovement(-currentMoveVector)
		
		local delta = Vector2.new(pos.x, pos.y) - padOrigin
		currentMoveVector = delta / (thumbpadSize/2)
		
		local inputAxisMagnitude = currentMoveVector.magnitude
		if inputAxisMagnitude < deadZone then
			currentMoveVector = Vector3.new(0, 0, 0)
		else
			currentMoveVector = currentMoveVector.unit * ((inputAxisMagnitude - deadZone) / (1 - deadZone))
			if currentMoveVector.magnitude == 0 then
				currentMoveVector = Vector3.new(0, 0, 0)
			else
				currentMoveVector = Vector3.new(currentMoveVector.x, 0, currentMoveVector.y).unit
			end
		end
		
		MasterControl:AddToPlayerMovement(currentMoveVector)
		
		local forwardDot = currentMoveVector:Dot(vForward)
		local rightDot = currentMoveVector:Dot(vRight)
		if forwardDot > 0.5 then
			if not isUp then
				isUp, isDown = true, false
				doTween(uArrow, lgArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset, 0, smImgOffset - smArrowSize.Y.Offset * 1.5))
				doTween(dArrow, smArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset/2, 1, lgImgOffset))
			end
		elseif forwardDot < -0.5 then
			if not isDown then
				isDown, isUp = true, false
				doTween(dArrow, lgArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset, 1, lgImgOffset + smArrowSize.Y.Offset/2))
				doTween(uArrow, smArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset/2, 0, smImgOffset))
			end
		else
			isUp, isDown = false, false
			doTween(dArrow, smArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset/2, 1, lgImgOffset))
			doTween(uArrow, smArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset/2, 0, smImgOffset))
		end
		
		if rightDot > 0.5 then
			if not isRight then
				isRight, isLeft = true, false
				doTween(rArrow, lgArrowSize, UDim2.new(1, lgImgOffset + smArrowSize.X.Offset/2, 0.5, -smArrowSize.Y.Offset))
				doTween(lArrow, smArrowSize, UDim2.new(0, smImgOffset, 0.5, -smArrowSize.Y.Offset/2))
			end
		elseif rightDot < -0.5 then
			if not isLeft then
				isLeft, isRight = true, false
				doTween(lArrow, lgArrowSize, UDim2.new(0, smImgOffset - smArrowSize.X.Offset * 1.5, 0.5, -smArrowSize.Y.Offset))
				doTween(rArrow, smArrowSize, UDim2.new(1, lgImgOffset, 0.5, -smArrowSize.Y.Offset/2))
			end
		else
			isRight, isLeft = false, false
			doTween(lArrow, smArrowSize, UDim2.new(0, smImgOffset, 0.5, -smArrowSize.Y.Offset/2))
			doTween(rArrow, smArrowSize, UDim2.new(1, lgImgOffset, 0.5, -smArrowSize.Y.Offset/2))
		end
	end
	
	ThumbpadFrame.InputBegan:connect(function(inputObject)
		if TouchObject or inputObject.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		
		ThumbpadFrame.Position = UDim2.new(0, inputObject.Position.x - ThumbpadFrame.AbsoluteSize.x/2, 0, inputObject.Position.y - ThumbpadFrame.Size.Y.Offset/2)
		padOrigin = Vector2.new(ThumbpadFrame.AbsolutePosition.x + ThumbpadFrame.AbsoluteSize.x/2,
			ThumbpadFrame.AbsolutePosition.y + ThumbpadFrame.AbsoluteSize.y/2)
		doMove(inputObject.Position)
		TouchObject = inputObject
	end)
	
	OnTouchChangedCn = UserInputService.TouchMoved:connect(function(inputObject, isProcessed)
		if inputObject == TouchObject then
			doMove(TouchObject.Position)
		end
	end)
	
	OnInputEnded = function()
		MasterControl:AddToPlayerMovement(-currentMoveVector)
		currentMoveVector = Vector3.new(0,0,0)
		MasterControl:SetIsJumping(false)

		ThumbpadFrame.Position = position
		TouchObject = nil
		isUp, isDown, isLeft, isRight = false, false, false, false
		doTween(dArrow, smArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset/2, 1, lgImgOffset))
		doTween(uArrow, smArrowSize, UDim2.new(0.5, -smArrowSize.X.Offset/2, 0, smImgOffset))
		doTween(lArrow, smArrowSize, UDim2.new(0, smImgOffset, 0.5, -smArrowSize.Y.Offset/2))
		doTween(rArrow, smArrowSize, UDim2.new(1, lgImgOffset, 0.5, -smArrowSize.Y.Offset/2))
	end
	
	OnTouchEndedCn = UserInputService.TouchEnded:connect(function(inputObject)
		if inputObject == TouchObject then
			OnInputEnded()
		end
	end)
	
	GuiService.MenuOpened:connect(function()
		if TouchObject then
			OnInputEnded()
		end
	end)	
	
	ThumbpadFrame.Parent = parentFrame
end
--Thumbstick
local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local GuiService = game:GetService('GuiService')

local Thumbstick = {}

local LocalPlayer = Players.LocalPlayer
local IsFollowStick = false
local ThumbstickFrame = nil
local MoveTouchObject = nil
local OnTouchEnded = nil
local OnTouchMovedCn = nil
local OnTouchEndedCn = nil
local currentMoveVector = Vector3.new(0,0,0)

local TOUCH_CONTROL_SHEET = "rbxasset://textures/ui/TouchControlsSheet.png"

function Thumbstick:Enable()
	ThumbstickFrame.Visible = true
end

function Thumbstick:Disable()
	ThumbstickFrame.Visible = false
	OnTouchEnded()
end

function Thumbstick:Create(parentFrame)
	if ThumbstickFrame then
		ThumbstickFrame:Destroy()
		ThumbstickFrame = nil
		if OnTouchMovedCn then
			OnTouchMovedCn:disconnect()
			OnTouchMovedCn = nil
		end
		if OnTouchEndedCn then
			OnTouchEndedCn:disconnect()
			OnTouchEndedCn = nil
		end
	end
		
	local isSmallScreen = parentFrame.AbsoluteSize.y <= 500
	local thumbstickSize = isSmallScreen and 70 or 120
	local position = isSmallScreen and UDim2.new(0, (thumbstickSize/2) - 10, 1, -thumbstickSize - 20) or
		UDim2.new(0, thumbstickSize/2, 1, -thumbstickSize * 1.75)
		
	ThumbstickFrame = Instance.new('Frame')
	ThumbstickFrame.Name = "ThumbstickFrame"
	ThumbstickFrame.Active = true
	ThumbstickFrame.Visible = false
	ThumbstickFrame.Size = UDim2.new(0, thumbstickSize, 0, thumbstickSize)
	ThumbstickFrame.Position = position
	ThumbstickFrame.BackgroundTransparency = 1
	
	local outerImage = Instance.new('ImageLabel')
	outerImage.Name = "OuterImage"
	outerImage.Image = TOUCH_CONTROL_SHEET
	outerImage.ImageRectOffset = Vector2.new()
	outerImage.ImageRectSize = Vector2.new(220, 220)
	outerImage.BackgroundTransparency = 1
	outerImage.Size = UDim2.new(0, thumbstickSize, 0, thumbstickSize)
	outerImage.Position = UDim2.new(0, 0, 0, 0)
	outerImage.Parent = ThumbstickFrame
	
	StickImage = Instance.new('ImageLabel')
	StickImage.Name = "StickImage"
	StickImage.Image = TOUCH_CONTROL_SHEET
	StickImage.ImageRectOffset = Vector2.new(220, 0)
	StickImage.ImageRectSize = Vector2.new(111, 111)
	StickImage.BackgroundTransparency = 1
	StickImage.Size = UDim2.new(0, thumbstickSize/2, 0, thumbstickSize/2)
	StickImage.Position = UDim2.new(0, thumbstickSize/2 - thumbstickSize/4, 0, thumbstickSize/2 - thumbstickSize/4)
	StickImage.ZIndex = 2
	StickImage.Parent = ThumbstickFrame
	
	local centerPosition = nil
	local deadZone = 0.05
	local function doMove(direction)
		MasterControl:AddToPlayerMovement(-currentMoveVector)
		
		currentMoveVector = direction / (thumbstickSize/2)
		
		local inputAxisMagnitude = currentMoveVector.magnitude
		if inputAxisMagnitude < deadZone then
			currentMoveVector = Vector3.new()
		else
			currentMoveVector = currentMoveVector.unit * ((inputAxisMagnitude - deadZone) / (1 - deadZone))
			currentMoveVector = Vector3.new(currentMoveVector.x, 0, currentMoveVector.y)
		end
		
		MasterControl:AddToPlayerMovement(currentMoveVector)
	end
	
	local function moveStick(pos)
		local relativePosition = Vector2.new(pos.x - centerPosition.x, pos.y - centerPosition.y)
		local length = relativePosition.magnitude
		local maxLength = ThumbstickFrame.AbsoluteSize.x/2
		if IsFollowStick and length > maxLength then
			local offset = relativePosition.unit * maxLength
			ThumbstickFrame.Position = UDim2.new(
				0, pos.x - ThumbstickFrame.AbsoluteSize.x/2 - offset.x,
				0, pos.y - ThumbstickFrame.AbsoluteSize.y/2 - offset.y)
		else
			length = math.min(length, maxLength)
			relativePosition = relativePosition.unit * length
		end
		StickImage.Position = UDim2.new(0, relativePosition.x + StickImage.AbsoluteSize.x/2, 0, relativePosition.y + StickImage.AbsoluteSize.y/2)
	end
	
	ThumbstickFrame.InputBegan:connect(function(inputObject)
		if MoveTouchObject or inputObject.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		
		MoveTouchObject = inputObject
		ThumbstickFrame.Position = UDim2.new(0, inputObject.Position.x - ThumbstickFrame.Size.X.Offset/2, 0, inputObject.Position.y - ThumbstickFrame.Size.Y.Offset/2)
		centerPosition = Vector2.new(ThumbstickFrame.AbsolutePosition.x + ThumbstickFrame.AbsoluteSize.x/2,
			ThumbstickFrame.AbsolutePosition.y + ThumbstickFrame.AbsoluteSize.y/2)
		local direction = Vector2.new(inputObject.Position.x - centerPosition.x, inputObject.Position.y - centerPosition.y)
	end)
	
	OnTouchMovedCn = UserInputService.TouchMoved:connect(function(inputObject, isProcessed)
		if inputObject == MoveTouchObject then
			centerPosition = Vector2.new(ThumbstickFrame.AbsolutePosition.x + ThumbstickFrame.AbsoluteSize.x/2,
				ThumbstickFrame.AbsolutePosition.y + ThumbstickFrame.AbsoluteSize.y/2)
			local direction = Vector2.new(inputObject.Position.x - centerPosition.x, inputObject.Position.y - centerPosition.y)
			doMove(direction)
			moveStick(inputObject.Position)
		end
	end)
	
	OnTouchEnded = function()
		ThumbstickFrame.Position = position
		StickImage.Position = UDim2.new(0, ThumbstickFrame.Size.X.Offset/2 - thumbstickSize/4, 0, ThumbstickFrame.Size.Y.Offset/2 - thumbstickSize/4)
		MoveTouchObject = nil
		
		MasterControl:AddToPlayerMovement(-currentMoveVector)
		currentMoveVector = Vector3.new(0,0,0)
		MasterControl:SetIsJumping(false)
	end
	
	OnTouchEndedCn = UserInputService.TouchEnded:connect(function(inputObject, isProcessed)
		if inputObject == MoveTouchObject then
			OnTouchEnded()
		end
	end)
	
	GuiService.MenuOpened:connect(function()
		if MoveTouchObject then
			OnTouchEnded()
		end
	end)	
	
	ThumbstickFrame.Parent = parentFrame
end
--TouchJump

local Players = game:GetService('Players')
local GuiService = game:GetService('GuiService')

local jumpButtonChangeFlagSuccess, jumpButtonChangeFlagValue = pcall(function() return UserSettings():IsUserFeatureEnabled("UserJumpButtonPositionChange") end)
local repositionJumpButton = (jumpButtonChangeFlagSuccess and jumpButtonChangeFlagValue)

local TouchJump = {}


local LocalPlayer = Players.LocalPlayer
local Humanoid = MasterControl:GetHumanoid()
local JumpButton = nil
local OnInputEnded = nil
local CharacterAddedConnection = nil
local HumStateConnection = nil
local HumChangeConnection = nil
local ExternallyEnabled = false

local JumpPower = 0
local JumpStateEnabled = true

local TOUCH_CONTROL_SHEET = "rbxasset://textures/ui/TouchControlsSheet.png"

local function updateEnabled()
	if JumpPower > 0 and JumpStateEnabled then
		TouchJump:Enable()
	else
		TouchJump:Disable()
	end
end

local function humanoidChanged(prop)
	if prop == "JumpPower" then
		JumpPower =  Humanoid.JumpPower
		updateEnabled()
	elseif prop == "Parent" then
		if not Humanoid.Parent then
			HumChangeConnection:disconnect()
		end
	end
end

local function humandoidStateEnabledChanged(state, isEnabled)
	if state == Enum.HumanoidStateType.Jumping then
		JumpStateEnabled = isEnabled
		updateEnabled()
	end
end

local function disableButton()
	JumpButton.Visible = false
	OnInputEnded()
end

local function enableButton()
	if Humanoid and ExternallyEnabled then
		if Humanoid.JumpPower > 0 then
			JumpButton.Visible = true
		end
	end
end

local function characterAdded(newCharacter)
	if HumChangeConnection then
		HumChangeConnection:disconnect()
	end
	Humanoid = nil
	repeat
		Humanoid = MasterControl:GetHumanoid()
		wait()
	until Humanoid and Humanoid.Parent == newCharacter
	HumChangeConnection = Humanoid.Changed:connect(humanoidChanged)
	HumStateConnection = Humanoid.StateEnabledChanged:connect(humandoidStateEnabledChanged)
	JumpPower = Humanoid.JumpPower
	JumpStateEnabled = Humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)
	updateEnabled()
end

local function setupCharacterAddedFunction()
	CharacterAddedConnection = LocalPlayer.CharacterAdded:connect(characterAdded)
	if LocalPlayer.Character then
		characterAdded(LocalPlayer.Character)
	end
end
function TouchJump:Enable()
	ExternallyEnabled = true
	enableButton()
end

function TouchJump:Disable()
	ExternallyEnabled = false
	disableButton()
end

function TouchJump:Create(parentFrame)
	if JumpButton then
		JumpButton:Destroy()
		JumpButton = nil
	end
	
	local isSmallScreen = parentFrame.AbsoluteSize.y <= 500
	local jumpButtonSize = isSmallScreen and 70 or 120
	
	JumpButton = Instance.new('ImageButton')
	JumpButton.Name = "JumpButton"
	JumpButton.Visible = false
	JumpButton.BackgroundTransparency = 1
	JumpButton.Image = TOUCH_CONTROL_SHEET
	JumpButton.ImageRectOffset = Vector2.new(176, 222)
	JumpButton.ImageRectSize = Vector2.new(174, 174)
	JumpButton.Size = UDim2.new(0, jumpButtonSize, 0, jumpButtonSize)
	
	if not repositionJumpButton then
		JumpButton.Position = isSmallScreen and UDim2.new(1, jumpButtonSize * -2.25, 1, -jumpButtonSize - 20) or
			UDim2.new(1, jumpButtonSize * -2.75, 1, -jumpButtonSize - 120)
	else
		JumpButton.Position = isSmallScreen and UDim2.new(1, -(jumpButtonSize*1.5-10), 1, -jumpButtonSize - 20) or
			UDim2.new(1, -(jumpButtonSize*1.5-10), 1, -jumpButtonSize * 1.75)
	end
	
	local touchObject = nil	
	JumpButton.InputBegan:connect(function(inputObject)
		if touchObject or inputObject.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		
		touchObject = inputObject
		JumpButton.ImageRectOffset = Vector2.new(0, 222)
		MasterControl:SetIsJumping(true)
	end)
	
	OnInputEnded = function()
		touchObject = nil
		MasterControl:SetIsJumping(false)
		JumpButton.ImageRectOffset = Vector2.new(176, 222)
	end
	
	JumpButton.InputEnded:connect(function(inputObject)
		if inputObject == touchObject then
			OnInputEnded()
		end
	end)
	
	GuiService.MenuOpened:connect(function()
		if touchObject then
			OnInputEnded()
		end
	end)
	
	if not CharacterAddedConnection then
		setupCharacterAddedFunction()
	end
	
	JumpButton.Parent = parentFrame
end
--VehicleControl

local VehicleController = {}

local ContextActionService = game:GetService('ContextActionService')
local Players = game:GetService('Players')
local RunService = game:GetService('RunService')


local LocalPlayer = Players.LocalPlayer
local CurrentVehicleSeat = nil
local CurrentThrottle = 0
local CurrentSteer = 0
local HumanoidSeatedCn = nil
local RenderSteppedCn = nil
local Accelerating = false
local Deccelerating = false
local TurningRight = false
local TurningLeft = false
local useTriggersForThrottle = true
local onlyTriggersForThrottle = false

local function onThrottleAccel(actionName, inputState, inputObject)
	MasterControl:AddToPlayerMovement(Vector3.new(0, 0, -CurrentThrottle))
	CurrentThrottle = (inputState == Enum.UserInputState.End or Deccelerating) and 0 or -1
	MasterControl:AddToPlayerMovement(Vector3.new(0, 0, CurrentThrottle))
	Accelerating = not (inputState == Enum.UserInputState.End)
	if (inputState == Enum.UserInputState.End) and Deccelerating then
		CurrentThrottle = 1
		MasterControl:AddToPlayerMovement(Vector3.new(0, 0, CurrentThrottle))
	end
end

local function onThrottleDeccel(actionName, inputState, inputObject)
	MasterControl:AddToPlayerMovement(Vector3.new(0, 0, -CurrentThrottle))
	CurrentThrottle = (inputState == Enum.UserInputState.End or Accelerating) and 0 or 1
	MasterControl:AddToPlayerMovement(Vector3.new(0, 0, CurrentThrottle))
	Deccelerating = not (inputState == Enum.UserInputState.End)
	if (inputState == Enum.UserInputState.End) and Accelerating then
		CurrentThrottle = -1
		MasterControl:AddToPlayerMovement(Vector3.new(0, 0, CurrentThrottle))
	end
end

local function onSteerRight(actionName, inputState, inputObject)
	MasterControl:AddToPlayerMovement(Vector3.new(-CurrentSteer, 0, 0))
	CurrentSteer = (inputState == Enum.UserInputState.End or TurningLeft) and 0 or 1
	MasterControl:AddToPlayerMovement(Vector3.new(CurrentSteer, 0, 0))
	TurningRight = not (inputState == Enum.UserInputState.End)
	if (inputState == Enum.UserInputState.End) and TurningLeft then
		CurrentSteer = -1
		MasterControl:AddToPlayerMovement(Vector3.new(CurrentSteer, 0, 0))
	end
end

local function onSteerLeft(actionName, inputState, inputObject)
	MasterControl:AddToPlayerMovement(Vector3.new(-CurrentSteer, 0, 0))
	CurrentSteer = (inputState == Enum.UserInputState.End or TurningRight) and 0 or -1
	MasterControl:AddToPlayerMovement(Vector3.new(CurrentSteer, 0, 0))
	TurningLeft = not (inputState == Enum.UserInputState.End)
	if (inputState == Enum.UserInputState.End) and TurningRight then
		CurrentSteer = 1
		MasterControl:AddToPlayerMovement(Vector3.new(CurrentSteer, 0, 0))
	end
end

local function getHumanoid()
	local character = LocalPlayer and LocalPlayer.Character
	if character then
		for _,child in pairs(character:GetChildren()) do
			if child:IsA('Humanoid') then
				return child
			end
		end
	end
end

local function getClosestFittingValue(value)
	if value > 0.5 then
		return 1
	elseif value < -0.5 then
		return -1
	end
	return 0 
end

local function onRenderStepped()
	if CurrentVehicleSeat then
		local moveValue = MasterControl:GetMoveVector()
		if game:GetService("UserInputService"):GetGamepadConnected(Enum.UserInputType.Gamepad1) and onlyTriggersForThrottle and useTriggersForThrottle then
			CurrentVehicleSeat.Throttle = -CurrentThrottle
		else
			CurrentVehicleSeat.Throttle = getClosestFittingValue(-moveValue.z)
		end
		CurrentVehicleSeat.Steer = getClosestFittingValue(moveValue.x)
	end
end

local function onSeated(active, currentSeatPart)
	if active then
		if currentSeatPart and currentSeatPart:IsA('VehicleSeat') then
			CurrentVehicleSeat = currentSeatPart
			if useTriggersForThrottle then
				ContextActionService:BindAction("throttleAccel", onThrottleAccel, false, Enum.KeyCode.ButtonR2)
				ContextActionService:BindAction("throttleDeccel", onThrottleDeccel, false, Enum.KeyCode.ButtonL2)
			end
			ContextActionService:BindAction("arrowSteerRight", onSteerRight, false, Enum.KeyCode.Right)
			ContextActionService:BindAction("arrowSteerLeft", onSteerLeft, false, Enum.KeyCode.Left)
			local success = pcall(function() RunService:BindToRenderStep("VehicleControlStep", Enum.RenderPriority.Input.Value, onRenderStepped) end)

			if not success then
				if RenderSteppedCn then return end
				RenderSteppedCn = RunService.RenderStepped:connect(onRenderStepped)
			end
		end
	else
		CurrentVehicleSeat = nil
		if useTriggersForThrottle then
			ContextActionService:UnbindAction("throttleAccel")
			ContextActionService:UnbindAction("throttleDeccel")
		end
		ContextActionService:UnbindAction("arrowSteerRight")
		ContextActionService:UnbindAction("arrowSteerLeft")
		MasterControl:AddToPlayerMovement(Vector3.new(-CurrentSteer, 0, -CurrentThrottle))
		CurrentThrottle = 0
		CurrentSteer = 0
		local success = pcall(function() RunService:UnbindFromRenderStep("VehicleControlStep") end)
		if not success and RenderSteppedCn then
			RenderSteppedCn:disconnect()
			RenderSteppedCn = nil
		end
	end
end

local function CharacterAdded(character)
	local humanoid = getHumanoid()
	while not humanoid do
		wait()
		humanoid = getHumanoid()
	end
	if HumanoidSeatedCn then
		HumanoidSeatedCn:disconnect()
		HumanoidSeatedCn = nil
	end
	HumanoidSeatedCn = humanoid.Seated:connect(onSeated)
end

if LocalPlayer.Character then
	CharacterAdded(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:connect(CharacterAdded)

--ControlScript

local ContextActionService = game:GetService('ContextActionService')
local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local Settings = UserSettings()
local GameSettings = Settings.GameSettings

while not UserInputService.KeyboardEnabled and not UserInputService.TouchEnabled and not UserInputService.GamepadEnabled do
	wait()
end

local lastInputType = nil
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild('PlayerGui')
local IsTouchDevice = UserInputService.TouchEnabled
local UserMovementMode = IsTouchDevice and GameSettings.TouchMovementMode or GameSettings.ComputerMovementMode
local DevMovementMode = IsTouchDevice and LocalPlayer.DevTouchMovementMode or LocalPlayer.DevComputerMovementMode
local IsUserChoice = (IsTouchDevice and DevMovementMode == Enum.DevTouchMovementMode.UserChoice) or (DevMovementMode == Enum.DevComputerMovementMode.UserChoice)
local TouchGui = nil
local TouchControlFrame = nil
local IsModalEnabled = UserInputService.ModalEnabled
local BindableEvent_OnFailStateChanged = nil
local isJumpEnabled = false

local ControlState = {}
ControlState.Current = nil
function ControlState:SwitchTo(newControl)
	if ControlState.Current == newControl then return end
	
	if ControlState.Current then
		ControlState.Current:Disable()
	end
	
	ControlState.Current = newControl
	
	if ControlState.Current then
		ControlState.Current:Enable()
	end
end
local ClickToMoveTouchControls = nil
local ControlModules = {}

local ThumbstickModule = Thumbstick
local ThumbpadModule = Thumbpad
local DPadModule = DPad
local DefaultModule = ControlModules.Thumbstick
local TouchJumpModule = TouchJump

local keyboardModule = KeyboardMovement
ControlModules.Gamepad = Gamepad

function getTouchModule()
	local module = nil
	if not IsUserChoice then
		if DevMovementMode == Enum.DevTouchMovementMode.Thumbstick then
			module = ThumbstickModule
			isJumpEnabled = true
		elseif DevMovementMode == Enum.DevTouchMovementMode.Thumbpad then
			module = ThumbpadModule
			isJumpEnabled = true
		elseif DevMovementMode == Enum.DevTouchMovementMode.DPad then
			module = DPadModule
			isJumpEnabled = false
		elseif DevMovementMode == Enum.DevTouchMovementMode.ClickToMove then
			module = nil
		elseif DevMovementMode == Enum.DevTouchMovementMode.Scriptable then
			module = nil
		end
	else
		if UserMovementMode == Enum.TouchMovementMode.Default or UserMovementMode == Enum.TouchMovementMode.Thumbstick then
			module = ThumbstickModule
			isJumpEnabled = true
		elseif UserMovementMode == Enum.TouchMovementMode.Thumbpad then
			module = ThumbpadModule
			isJumpEnabled = true
		elseif UserMovementMode == Enum.TouchMovementMode.DPad then
			module = DPadModule
			isJumpEnabled = false
		elseif UserMovementMode == Enum.TouchMovementMode.ClickToMove then
			module = nil
		end
	end
	
	return module
end

function setJumpModule(isEnabled)
	if not isEnabled then
		TouchJumpModule:Disable()
	elseif ControlState.Current == ControlModules.Touch then
		TouchJumpModule:Enable()
	end
end

function setClickToMove()
	if DevMovementMode == Enum.DevTouchMovementMode.ClickToMove or DevMovementMode == Enum.DevComputerMovementMode.ClickToMove or
		UserMovementMode == Enum.ComputerMovementMode.ClickToMove or UserMovementMode == Enum.TouchMovementMode.ClickToMove then
		if lastInputType == Enum.UserInputType.Touch then
			ClickToMoveTouchControls = ControlState.Current
		end
	elseif ClickToMoveTouchControls then
		ClickToMoveTouchControls:Disable()
		ClickToMoveTouchControls = nil
	end
end

ControlModules.Touch = {}
ControlModules.Touch.Current = nil
ControlModules.Touch.LocalPlayerChangedCon = nil
ControlModules.Touch.GameSettingsChangedCon = nil

function ControlModules.Touch:RefreshControlStyle()
	if ControlModules.Touch.Current then
		ControlModules.Touch.Current:Disable()
	end
	setJumpModule(false)
	TouchJumpModule:Disable()
	ControlModules.Touch:Enable()
end
function ControlModules.Touch:DisconnectEvents()
	if ControlModules.Touch.LocalPlayerChangedCon then
		ControlModules.Touch.LocalPlayerChangedCon:disconnect()
		ControlModules.Touch.LocalPlayerChangedCon = nil
	end
	if ControlModules.Touch.GameSettingsChangedCon then
		ControlModules.Touch.GameSettingsChangedCon:disconnect()
		ControlModules.Touch.GameSettingsChangedCon = nil
	end
end
function ControlModules.Touch:Enable()
	DevMovementMode = LocalPlayer.DevTouchMovementMode
	IsUserChoice = DevMovementMode == Enum.DevTouchMovementMode.UserChoice
	if IsUserChoice then
		UserMovementMode = GameSettings.TouchMovementMode
	end
		
	local newModuleToEnable = getTouchModule()
	if newModuleToEnable then
		setClickToMove()
		setJumpModule(isJumpEnabled)
		
		newModuleToEnable:Enable()
		ControlModules.Touch.Current = newModuleToEnable
				
		if isJumpEnabled then TouchJumpModule:Enable() end
	end
	
	ControlModules.Touch:DisconnectEvents()
	ControlModules.Touch.LocalPlayerChangedCon = LocalPlayer.Changed:connect(function(property)
		if property == 'DevTouchMovementMode' then
			ControlModules.Touch:RefreshControlStyle()
		end
	end)
	
	ControlModules.Touch.GameSettingsChangedCon = GameSettings.Changed:connect(function(property)
		if property == 'TouchMovementMode' then
			ControlModules.Touch:RefreshControlStyle()
		end
	end)
end
function ControlModules.Touch:Disable()
	ControlModules.Touch:DisconnectEvents()
	
	local newModuleToDisable = getTouchModule()
	
	if newModuleToDisable == ThumbstickModule or
		newModuleToDisable == DPadModule or
		newModuleToDisable == ThumbpadModule then
			newModuleToDisable:Disable()
			setJumpModule(false)
			TouchJumpModule:Disable()
	end
end

local function getKeyboardModule()
	local whichModule = nil
	if not IsUserChoice then
		if DevMovementMode == Enum.DevComputerMovementMode.KeyboardMouse then
			whichModule = keyboardModule
		elseif DevMovementMode == Enum.DevComputerMovementMode.ClickToMove then
			whichModule = keyboardModule
		end 
	else
		if UserMovementMode == Enum.ComputerMovementMode.KeyboardMouse or UserMovementMode == Enum.ComputerMovementMode.Default then
			whichModule = keyboardModule
		elseif UserMovementMode == Enum.ComputerMovementMode.ClickToMove then
			whichModule = keyboardModule
		end
	end

	return whichModule
end

ControlModules.Keyboard = {}
function ControlModules.Keyboard:RefreshControlStyle()
	ControlModules.Keyboard:Disable()
	ControlModules.Keyboard:Enable()
end
function ControlModules.Keyboard:Enable()
	DevMovementMode = LocalPlayer.DevComputerMovementMode
	IsUserChoice = DevMovementMode == Enum.DevComputerMovementMode.UserChoice
	if IsUserChoice then
		UserMovementMode = GameSettings.ComputerMovementMode
	end
		
	local newModuleToEnable = getKeyboardModule()
	if newModuleToEnable then
		newModuleToEnable:Enable()
	end
	
	ControlModules.Keyboard:DisconnectEvents()
	ControlModules.Keyboard.LocalPlayerChangedCon = LocalPlayer.Changed:connect(function(property)
		if property == 'DevComputerMovementMode' then
			ControlModules.Keyboard:RefreshControlStyle()
		end
	end)
	
	ControlModules.Keyboard.GameSettingsChangedCon = GameSettings.Changed:connect(function(property)
		if property == 'ComputerMovementMode' then
			ControlModules.Keyboard:RefreshControlStyle()
		end
	end)
end
function ControlModules.Keyboard:DisconnectEvents()
	if ControlModules.Keyboard.LocalPlayerChangedCon then
		ControlModules.Keyboard.LocalPlayerChangedCon:disconnect()
		ControlModules.Keyboard.LocalPlayerChangedCon = nil
	end
	if ControlModules.Keyboard.GameSettingsChangedCon then
		ControlModules.Keyboard.GameSettingsChangedCon:disconnect()
		ControlModules.Keyboard.GameSettingsChangedCon = nil
	end
end
function ControlModules.Keyboard:Disable()
	ControlModules.Keyboard:DisconnectEvents()
	local newModuleToDisable = getKeyboardModule()
	if newModuleToDisable then
		newModuleToDisable:Disable()
	end
end

if IsTouchDevice then
	BindableEvent_OnFailStateChanged = script.Parent:WaitForChild('OnClickToMoveFailStateChange')
end

local VehicleController = VehicleController


local function createTouchGuiContainer()
	if TouchGui then TouchGui:Destroy() end
	
	TouchGui = Instance.new('ScreenGui')
	TouchGui.Name = "TouchGui"
	TouchGui.Parent = PlayerGui
	
	TouchControlFrame = Instance.new('Frame')
	TouchControlFrame.Name = "TouchControlFrame"
	TouchControlFrame.Size = UDim2.new(1, 0, 1, 0)
	TouchControlFrame.BackgroundTransparency = 1
	TouchControlFrame.Parent = TouchGui
	
	ThumbstickModule:Create(TouchControlFrame)
	DPadModule:Create(TouchControlFrame)
	ThumbpadModule:Create(TouchControlFrame)
	TouchJumpModule:Create(TouchControlFrame)
end

LocalPlayer.Changed:connect(function(property)
	if lastInputType == Enum.UserInputType.Touch and property == 'DevTouchMovementMode' then
		ControlState:SwitchTo(ControlModules.Touch)
	elseif UserInputService.KeyboardEnabled and property == 'DevComputerMovementMode' then
		ControlState:SwitchTo(ControlModules.Keyboard)
	end
end)

GameSettings.Changed:connect(function(property)
	if not IsUserChoice then return end
	if property == 'TouchMovementMode' or property == 'ComputerMovementMode' then
		UserMovementMode = GameSettings[property]
		if property == 'TouchMovementMode' then
			ControlState:SwitchTo(ControlModules.Touch)
		elseif property == 'ComputerMovementMode' then
			ControlState:SwitchTo(ControlModules.Keyboard)
		end
	end
end)

local lastControlState = nil
LocalPlayer.CharacterAdded:connect(function(character)
	if ControlState.Current then
		lastControlState = ControlState.Current
		ControlState:SwitchTo(nil)
	end
	
	if UserInputService.TouchEnabled then
		createTouchGuiContainer()
	end
	
	if ControlState.Current == nil then
		ControlState:SwitchTo(lastControlState)
	end
end)

LocalPlayer.CharacterRemoving:connect(function()
	lastControlState = ControlState.Current
	ControlState:SwitchTo(nil)
end)
	
UserInputService.Changed:connect(function(property)
	if property == 'ModalEnabled' then
		IsModalEnabled = UserInputService.ModalEnabled

		if lastInputType == Enum.UserInputType.Touch then
			if ControlState.Current == ControlModules.Touch and IsModalEnabled then
				ControlState:SwitchTo(nil)
			elseif ControlState.Current == nil and not IsModalEnabled then
				ControlState:SwitchTo(ControlModules.Touch)
			end
		end
	end
end)

if BindableEvent_OnFailStateChanged then
	BindableEvent_OnFailStateChanged.Event:connect(function(isOn)
		if lastInputType == Enum.UserInputType.Touch and ClickToMoveTouchControls then
			if isOn then
				ControlState:SwitchTo(ClickToMoveTouchControls)
			else
				ControlState:SwitchTo(nil)
			end
		end
	end)
end

local switchToInputType = function(newLastInputType)
	lastInputType = newLastInputType
	
	if lastInputType == Enum.UserInputType.Touch then
				ControlState:SwitchTo(ControlModules.Touch)
	elseif lastInputType == Enum.UserInputType.Keyboard or
			lastInputType == Enum.UserInputType.MouseButton1 or
			lastInputType == Enum.UserInputType.MouseButton2 or
			lastInputType == Enum.UserInputType.MouseButton3 or
			lastInputType == Enum.UserInputType.MouseWheel or
			lastInputType == Enum.UserInputType.MouseMovement  then
				ControlState:SwitchTo(ControlModules.Keyboard)
	elseif lastInputType == Enum.UserInputType.Gamepad1 or
			lastInputType == Enum.UserInputType.Gamepad2 or
			lastInputType == Enum.UserInputType.Gamepad3 or
			lastInputType == Enum.UserInputType.Gamepad4 then
				ControlState:SwitchTo(ControlModules.Gamepad)
	end
end

if IsTouchDevice then
	createTouchGuiContainer()
end

MasterControl:Init()

UserInputService.GamepadDisconnected:connect(function(gamepadEnum)
	local connectedGamepads = UserInputService:GetConnectedGamepads()
	if #connectedGamepads > 0 then return end
	
	if UserInputService.KeyboardEnabled then
		ControlState:SwitchTo(ControlModules.Keyboard)
	elseif IsTouchDevice then
		ControlState:SwitchTo(ControlModules.Touch)
	end
end)

UserInputService.GamepadConnected:connect(function(gamepadEnum)
	ControlState:SwitchTo(ControlModules.Gamepad)
end)

switchToInputType(UserInputService:GetLastInputType())
UserInputService.LastInputTypeChanged:connect(switchToInputType)
