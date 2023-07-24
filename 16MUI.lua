local RobloxGui = Instance.new("ScreenGui")
local SettingsShield = Instance.new("Frame")
local SettingsShieldContents = Instance.new("Frame")
local HubBar = Instance.new("ImageLabel")
local Players = Instance.new("TextButton")
local Icon = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local TabSelection = Instance.new("ImageLabel")
local Settings = Instance.new("TextButton")
local Icon_2 = Instance.new("ImageLabel")
local Title_2 = Instance.new("TextLabel")
local TabSelection_2 = Instance.new("ImageLabel")
local Report = Instance.new("TextButton")
local Icon_3 = Instance.new("ImageLabel")
local Title_3 = Instance.new("TextLabel")
local TabSelection_3 = Instance.new("ImageLabel")
local Help = Instance.new("TextButton")
local Icon_4 = Instance.new("ImageLabel")
local Title_4 = Instance.new("TextLabel")
local TabSelection_4 = Instance.new("ImageLabel")
local Record = Instance.new("TextButton")
local Icon_5 = Instance.new("ImageLabel")
local Title_5 = Instance.new("TextLabel")
local TabSelection_5 = Instance.new("ImageLabel")
local PageViewClipper = Instance.new("Frame")
local InputCapture = Instance.new("ImageButton")
local PageView = Instance.new("ScrollingFrame")
local Players_2 = Instance.new("Frame")
local Settings_2 = Instance.new("Frame")
local Report_2 = Instance.new("Frame")
local Help_2 = Instance.new("Frame")
local Record_2 = Instance.new("Frame")
local Buttons = Instance.new("Frame")
local LeaveGameButtonButton = Instance.new("ImageButton")
local LeaveGameButtonTextLabel = Instance.new("TextLabel")
local LeaveGameHint = Instance.new("ImageLabel")
local ResetCharacterButtonButton = Instance.new("ImageButton")
local ResetCharacterButtonTextLabel = Instance.new("TextLabel")
local ResetCharacterHint = Instance.new("ImageLabel")
local ResumeButtonButton = Instance.new("ImageButton")
local ResumeButtonTextLabel = Instance.new("TextLabel")
local ResumeHint = Instance.new("ImageLabel")
local LeaveGamePage = Instance.new("Frame")
local LeaveGameText = Instance.new("TextLabel")
local LeaveGameButton = Instance.new("ImageButton")
local LeaveGameTextLabel = Instance.new("TextLabel")
local DontLeaveGameButton = Instance.new("ImageButton")
local DontLeaveGameTextLabel = Instance.new("TextLabel")
local ResetCharacter = Instance.new("Frame")
local ResetCharacterText = Instance.new("TextLabel")
local ResetCharacterButton = Instance.new("ImageButton")
local ResetCharacterTextLabel = Instance.new("TextLabel")
local DontResetCharacterButton = Instance.new("ImageButton")
local DontResetCharacterTextLabel = Instance.new("TextLabel")

RobloxGui.Name = "16MUI"
RobloxGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
RobloxGui.ResetOnSpawn = false
RobloxGui.DisplayOrder = 999999999

ResetCharacter.Name = "ResetCharacter"
ResetCharacter.Parent = PageView
ResetCharacter.BackgroundTransparency = 1.000
ResetCharacter.Size = UDim2.new(1, 0, 0, 220)
ResetCharacter.Visible = false

ResetCharacterText.Name = "ResetCharacterText"
ResetCharacterText.Parent = ResetCharacter
ResetCharacterText.BackgroundTransparency = 1.000
ResetCharacterText.Size = UDim2.new(1, 0, 0, 200)
ResetCharacterText.ZIndex = 2
ResetCharacterText.Font = Enum.Font.SourceSansBold
ResetCharacterText.Text = "Are you sure you want to reset your character?"
ResetCharacterText.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetCharacterText.TextSize = 36.000
ResetCharacterText.TextWrapped = true

ResetCharacterButton.Name = "ResetCharacterButton"
ResetCharacterButton.Parent = ResetCharacterText
ResetCharacterButton.BackgroundTransparency = 1.000
ResetCharacterButton.NextSelectionLeft = ResetCharacterButton
ResetCharacterButton.Position = UDim2.new(0.5, -220, 1, -30)
ResetCharacterButton.Size = UDim2.new(0, 200, 0, 50)
ResetCharacterButton.ZIndex = 2
ResetCharacterButton.AutoButtonColor = false
ResetCharacterButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
ResetCharacterButton.ScaleType = Enum.ScaleType.Slice
ResetCharacterButton.SliceCenter = Rect.new(8, 6, 46, 44)

ResetCharacterTextLabel.Name = "ResetCharacterTextLabel"
ResetCharacterTextLabel.Parent = ResetCharacterButton
ResetCharacterTextLabel.BackgroundTransparency = 1.000
ResetCharacterTextLabel.BorderSizePixel = 0
ResetCharacterTextLabel.Size = UDim2.new(1, 0, 1, -8)
ResetCharacterTextLabel.ZIndex = 2
ResetCharacterTextLabel.Font = Enum.Font.SourceSansBold
ResetCharacterTextLabel.Text = "Reset"
ResetCharacterTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetCharacterTextLabel.TextSize = 24.000
ResetCharacterTextLabel.TextWrapped = true

DontResetCharacterButton.Name = "DontResetCharacterButton"
DontResetCharacterButton.Parent = ResetCharacterText
DontResetCharacterButton.BackgroundTransparency = 1.000
DontResetCharacterButton.NextSelectionRight = DontResetCharacterButton
DontResetCharacterButton.Position = UDim2.new(0.5, 20, 1, -30)
DontResetCharacterButton.Size = UDim2.new(0, 200, 0, 50)
DontResetCharacterButton.ZIndex = 2
DontResetCharacterButton.AutoButtonColor = false
DontResetCharacterButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
DontResetCharacterButton.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
DontResetCharacterButton.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
DontResetCharacterButton.ScaleType = Enum.ScaleType.Slice
DontResetCharacterButton.SliceCenter = Rect.new(8, 6, 46, 44)

DontResetCharacterTextLabel.Name = "DontResetCharacterTextLabel"
DontResetCharacterTextLabel.Parent = DontResetCharacterButton
DontResetCharacterTextLabel.BackgroundTransparency = 1.000
DontResetCharacterTextLabel.BorderSizePixel = 0
DontResetCharacterTextLabel.Size = UDim2.new(1, 0, 1, -8)
DontResetCharacterTextLabel.ZIndex = 2
DontResetCharacterTextLabel.Font = Enum.Font.SourceSansBold
DontResetCharacterTextLabel.Text = "Don't Reset"
DontResetCharacterTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DontResetCharacterTextLabel.TextSize = 24.000
DontResetCharacterTextLabel.TextWrapped = true

LeaveGamePage.Name = "LeaveGamePage"
LeaveGamePage.Parent = PageView
LeaveGamePage.BackgroundTransparency = 1.000
LeaveGamePage.Size = UDim2.new(1, 0, 0, 220)
LeaveGamePage.Visible = false

LeaveGameText.Name = "LeaveGameText"
LeaveGameText.Parent = LeaveGamePage
LeaveGameText.BackgroundTransparency = 1.000
LeaveGameText.Size = UDim2.new(1, 0, 0, 200)
LeaveGameText.ZIndex = 2
LeaveGameText.Font = Enum.Font.SourceSansBold
LeaveGameText.Text = "Are you sure you want to leave the game?"
LeaveGameText.TextColor3 = Color3.fromRGB(255, 255, 255)
LeaveGameText.TextSize = 36.000
LeaveGameText.TextWrapped = true

LeaveGameButton.Name = "LeaveGameButton"
LeaveGameButton.Parent = LeaveGameText
LeaveGameButton.BackgroundTransparency = 1.000
LeaveGameButton.NextSelectionLeft = LeaveGameButton
LeaveGameButton.Position = UDim2.new(0.5, -220, 1, -30)
LeaveGameButton.Size = UDim2.new(0, 200, 0, 50)
LeaveGameButton.ZIndex = 2
LeaveGameButton.AutoButtonColor = false
LeaveGameButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
LeaveGameButton.ScaleType = Enum.ScaleType.Slice
LeaveGameButton.SliceCenter = Rect.new(8, 6, 46, 44)

LeaveGameTextLabel.Name = "LeaveGameTextLabel"
LeaveGameTextLabel.Parent = LeaveGameButton
LeaveGameTextLabel.BackgroundTransparency = 1.000
LeaveGameTextLabel.BorderSizePixel = 0
LeaveGameTextLabel.Size = UDim2.new(1, 0, 1, -8)
LeaveGameTextLabel.ZIndex = 2
LeaveGameTextLabel.Font = Enum.Font.SourceSansBold
LeaveGameTextLabel.Text = "Leave"
LeaveGameTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LeaveGameTextLabel.TextSize = 24.000
LeaveGameTextLabel.TextWrapped = true

DontLeaveGameButton.Name = "DontLeaveGameButton"
DontLeaveGameButton.Parent = LeaveGameText
DontLeaveGameButton.BackgroundTransparency = 1.000
DontLeaveGameButton.NextSelectionRight = DontLeaveGameButton
DontLeaveGameButton.Position = UDim2.new(0.5, 20, 1, -30)
DontLeaveGameButton.Size = UDim2.new(0, 200, 0, 50)
DontLeaveGameButton.ZIndex = 2
DontLeaveGameButton.AutoButtonColor = false
DontLeaveGameButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
DontLeaveGameButton.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
DontLeaveGameButton.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
DontLeaveGameButton.ScaleType = Enum.ScaleType.Slice
DontLeaveGameButton.SliceCenter = Rect.new(8, 6, 46, 44)

DontLeaveGameTextLabel.Name = "DontLeaveGameTextLabel"
DontLeaveGameTextLabel.Parent = DontLeaveGameButton
DontLeaveGameTextLabel.BackgroundTransparency = 1.000
DontLeaveGameTextLabel.BorderSizePixel = 0
DontLeaveGameTextLabel.Size = UDim2.new(1, 0, 1, -8)
DontLeaveGameTextLabel.ZIndex = 2
DontLeaveGameTextLabel.Font = Enum.Font.SourceSansBold
DontLeaveGameTextLabel.Text = "Don't Leave"
DontLeaveGameTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DontLeaveGameTextLabel.TextSize = 24.000
DontLeaveGameTextLabel.TextWrapped = true

SettingsShield.Name = "SettingsShield"
SettingsShield.Parent = RobloxGui
SettingsShield.BackgroundTransparency = 1.000
SettingsShield.BorderSizePixel = 0
SettingsShield.ClipsDescendants = true
SettingsShield.Position = UDim2.new(0, 0, -1.10000002, -36)
SettingsShield.Size = UDim2.new(1, 0, 1, 36)

SettingsShieldContents.Name = "SettingsShield"
SettingsShieldContents.Parent = SettingsShield
SettingsShieldContents.Active = true
SettingsShieldContents.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
SettingsShieldContents.BackgroundTransparency = 0.200
SettingsShieldContents.BorderSizePixel = 0
SettingsShieldContents.Size = UDim2.new(1, 0, 1, 0)

HubBar.Name = "HubBar"
HubBar.Parent = SettingsShieldContents
HubBar.BackgroundColor3 = Color3.fromRGB(78, 84, 96)
HubBar.BackgroundTransparency = 1.000
HubBar.BorderSizePixel = 0
HubBar.Position = UDim2.new(0.5, -400, 0.5, -360)
HubBar.Size = UDim2.new(0, 800, 0, 60)
HubBar.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png"
HubBar.ScaleType = Enum.ScaleType.Slice
HubBar.SliceCenter = Rect.new(4, 4, 6, 6)

Players.Name = "Players"
Players.Parent = HubBar
Players.BackgroundTransparency = 1.000
Players.Position = UDim2.new(0.100000001, -75, 0, 0)
Players.Size = UDim2.new(0, 150, 1, 0)
Players.Text = ""

Icon.Name = "Icon"
Icon.Parent = Players
Icon.BackgroundTransparency = 1.000
Icon.Position = UDim2.new(0, 15, 0.5, -18)
Icon.Size = UDim2.new(0, 44, 0, 37)
Icon.ZIndex = 3
Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon.png"

Title.Name = "Title"
Title.Parent = Icon
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(1.20000005, 0, 0, 0)
Title.Size = UDim2.new(1.04999995, 0, 1, 0)
Title.ZIndex = 3
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Players"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24.000
Title.TextXAlignment = Enum.TextXAlignment.Left

TabSelection.Name = "TabSelection"
TabSelection.Parent = Players
TabSelection.BackgroundTransparency = 1.000
TabSelection.Position = UDim2.new(0, 0, 1, -6)
TabSelection.Size = UDim2.new(1, 0, 0, 6)
TabSelection.ZIndex = 3
TabSelection.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png"
TabSelection.ScaleType = Enum.ScaleType.Slice
TabSelection.SliceCenter = Rect.new(3, 1, 4, 5)

Settings.Name = "Settings"
Settings.Parent = HubBar
Settings.BackgroundTransparency = 1.000
Settings.Position = UDim2.new(0.300000012, -84, 0, 0)
Settings.Size = UDim2.new(0, 169, 1, 0)
Settings.Text = ""

Icon_2.Name = "Icon"
Icon_2.Parent = Settings
Icon_2.BackgroundTransparency = 1.000
Icon_2.Position = UDim2.new(0, 15, 0.5, -22)
Icon_2.Size = UDim2.new(0, 45, 0, 45)
Icon_2.ZIndex = 3
Icon_2.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab.png"
Icon_2.ImageTransparency = 0.500

Title_2.Name = "Title"
Title_2.Parent = Icon_2
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(1.20000005, 0, 0, 0)
Title_2.Size = UDim2.new(1.04999995, 0, 1, 0)
Title_2.ZIndex = 3
Title_2.Font = Enum.Font.SourceSansBold
Title_2.Text = "Settings"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 24.000
Title_2.TextTransparency = 0.500
Title_2.TextXAlignment = Enum.TextXAlignment.Left

TabSelection_2.Name = "TabSelection"
TabSelection_2.Parent = Settings
TabSelection_2.BackgroundTransparency = 1.000
TabSelection_2.Position = UDim2.new(0, 0, 1, -6)
TabSelection_2.Size = UDim2.new(1, 0, 0, 6)
TabSelection_2.Visible = false
TabSelection_2.ZIndex = 3
TabSelection_2.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png"
TabSelection_2.ScaleType = Enum.ScaleType.Slice
TabSelection_2.SliceCenter = Rect.new(3, 1, 4, 5)

Report.Name = "Report"
Report.Parent = HubBar
Report.BackgroundTransparency = 1.000
Report.Position = UDim2.new(0.5, -75, 0, 0)
Report.Size = UDim2.new(0, 150, 1, 0)
Report.Text = ""

Icon_3.Name = "Icon"
Icon_3.Parent = Report
Icon_3.BackgroundTransparency = 1.000
Icon_3.Position = UDim2.new(0, 20, 0.5, -22)
Icon_3.Size = UDim2.new(0, 36, 0, 43)
Icon_3.ZIndex = 3
Icon_3.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/ReportAbuseTab.png"
Icon_3.ImageTransparency = 0.500

Title_3.Name = "Title"
Title_3.Parent = Icon_3
Title_3.BackgroundTransparency = 1.000
Title_3.Position = UDim2.new(1.20000005, 0, 0, 0)
Title_3.Size = UDim2.new(1.04999995, 0, 1, 0)
Title_3.ZIndex = 3
Title_3.Font = Enum.Font.SourceSansBold
Title_3.Text = "Report"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 24.000
Title_3.TextTransparency = 0.500
Title_3.TextXAlignment = Enum.TextXAlignment.Left

TabSelection_3.Name = "TabSelection"
TabSelection_3.Parent = Report
TabSelection_3.BackgroundTransparency = 1.000
TabSelection_3.Position = UDim2.new(0, 0, 1, -6)
TabSelection_3.Size = UDim2.new(1, 0, 0, 6)
TabSelection_3.Visible = false
TabSelection_3.ZIndex = 3
TabSelection_3.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png"
TabSelection_3.ScaleType = Enum.ScaleType.Slice
TabSelection_3.SliceCenter = Rect.new(3, 1, 4, 5)

Help.Name = "Help"
Help.Parent = HubBar
Help.BackgroundTransparency = 1.000
Help.Position = UDim2.new(0.699999988, -65, 0, 0)
Help.Size = UDim2.new(0, 130, 1, 0)
Help.Text = ""

Icon_4.Name = "Icon"
Icon_4.Parent = Help
Icon_4.BackgroundTransparency = 1.000
Icon_4.Position = UDim2.new(0, 10, 0.5, -22)
Icon_4.Size = UDim2.new(0, 44, 0, 44)
Icon_4.ZIndex = 3
Icon_4.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png"
Icon_4.ImageTransparency = 0.500

Title_4.Name = "Title"
Title_4.Parent = Icon_4
Title_4.BackgroundTransparency = 1.000
Title_4.Position = UDim2.new(1.20000005, 0, 0, 0)
Title_4.Size = UDim2.new(1.04999995, 0, 1, 0)
Title_4.ZIndex = 3
Title_4.Font = Enum.Font.SourceSansBold
Title_4.Text = "Help"
Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_4.TextSize = 24.000
Title_4.TextTransparency = 0.500
Title_4.TextXAlignment = Enum.TextXAlignment.Left

TabSelection_4.Name = "TabSelection"
TabSelection_4.Parent = Help
TabSelection_4.BackgroundTransparency = 1.000
TabSelection_4.Position = UDim2.new(0, 0, 1, -6)
TabSelection_4.Size = UDim2.new(1, 0, 0, 6)
TabSelection_4.Visible = false
TabSelection_4.ZIndex = 3
TabSelection_4.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png"
TabSelection_4.ScaleType = Enum.ScaleType.Slice
TabSelection_4.SliceCenter = Rect.new(3, 1, 4, 5)

Record.Name = "Record"
Record.Parent = HubBar
Record.BackgroundTransparency = 1.000
Record.Position = UDim2.new(0.899999976, -65, 0, 0)
Record.Size = UDim2.new(0, 130, 1, 0)
Record.Text = ""

Icon_5.Name = "Icon"
Icon_5.Parent = Record
Icon_5.BackgroundTransparency = 1.000
Icon_5.Position = UDim2.new(0, 5, 0.5, -20)
Icon_5.Size = UDim2.new(0, 41, 0, 40)
Icon_5.ZIndex = 3
Icon_5.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/RecordTab.png"
Icon_5.ImageTransparency = 0.500

Title_5.Name = "Title"
Title_5.Parent = Icon_5
Title_5.BackgroundTransparency = 1.000
Title_5.Position = UDim2.new(1.20000005, 0, 0, 0)
Title_5.Size = UDim2.new(1.04999995, 0, 1, 0)
Title_5.ZIndex = 3
Title_5.Font = Enum.Font.SourceSansBold
Title_5.Text = "Record"
Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_5.TextSize = 24.000
Title_5.TextTransparency = 0.500
Title_5.TextXAlignment = Enum.TextXAlignment.Left

TabSelection_5.Name = "TabSelection"
TabSelection_5.Parent = Record
TabSelection_5.BackgroundTransparency = 1.000
TabSelection_5.Position = UDim2.new(0, 0, 1, -6)
TabSelection_5.Size = UDim2.new(1, 0, 0, 6)
TabSelection_5.Visible = false
TabSelection_5.ZIndex = 3
TabSelection_5.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png"
TabSelection_5.ScaleType = Enum.ScaleType.Slice
TabSelection_5.SliceCenter = Rect.new(3, 1, 4, 5)

PageViewClipper.Name = "PageViewClipper"
PageViewClipper.Parent = SettingsShieldContents
PageViewClipper.BackgroundTransparency = 1.000
PageViewClipper.ClipsDescendants = true
PageViewClipper.Position = UDim2.new(0.5, -400, 0.5, -300)
PageViewClipper.Size = UDim2.new(0, 800, 0, 600)

InputCapture.Name = "InputCapture"
InputCapture.Parent = PageViewClipper
InputCapture.BackgroundTransparency = 1.000
InputCapture.Size = UDim2.new(1, 0, 1, 0)

PageView.Name = "PageView"
PageView.Parent = PageViewClipper
PageView.BackgroundTransparency = 1.000
PageView.BorderSizePixel = 0
PageView.Selectable = false
PageView.Size = UDim2.new(1, 0, 1, 0)
PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y
PageView.AutomaticSize = Enum.AutomaticSize.None
PageView.CanvasSize = UDim2.new(0, 0, 0, 0)

Players_2.Name = "Players"
Players_2.Parent = PageView
Players_2.BackgroundTransparency = 1.000
Players_2.Position = UDim2.new(0, 0, 0.0166666675, 0)
Players_2.Size = UDim2.new(1, 0, 0.826666653, 95)

Settings_2.Name = "Settings"
Settings_2.Parent = PageView
Settings_2.BackgroundTransparency = 1.000
Settings_2.Position = UDim2.new(1, 0, 0, 0)
Settings_2.Size = UDim2.new(1, 0, 0, 450)

Report_2.Name = "Report"
Report_2.Parent = PageView
Report_2.BackgroundTransparency = 1.000
Report_2.Position = UDim2.new(2, 0, 0, 0)
Report_2.Size = UDim2.new(1, 0, 0, 313)

Help_2.Name = "Help"
Help_2.Parent = PageView
Help_2.BackgroundTransparency = 1.000
Help_2.Position = UDim2.new(3, 0, 0, 0)
Help_2.Size = UDim2.new(1, 0, 0, 506)

Record_2.Name = "Record"
Record_2.Parent = PageView
Record_2.BackgroundTransparency = 1.000
Record_2.Position = UDim2.new(4, 0, 0, 0)
Record_2.Size = UDim2.new(1, 0, 0, 400)

Buttons.Name = "BottomButtonFrame"
Buttons.Parent = SettingsShieldContents
Buttons.BackgroundTransparency = 1.000
Buttons.Position = UDim2.new(0.5, -400, 0.5, 300)
Buttons.Size = UDim2.new(0, 800, 0, 60)

LeaveGameButtonButton.Name = "LeaveGameButtonButton"
LeaveGameButtonButton.Parent = Buttons
LeaveGameButtonButton.BackgroundTransparency = 1.000
LeaveGameButtonButton.NextSelectionLeft = LeaveGameButtonButton
LeaveGameButtonButton.NextSelectionRight = LeaveGameButtonButton
LeaveGameButtonButton.Position = UDim2.new(0.5, -130, 0.5, -25)
LeaveGameButtonButton.Size = UDim2.new(0, 260, 0, 70)
LeaveGameButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
LeaveGameButtonButton.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
LeaveGameButtonButton.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
LeaveGameButtonButton.ScaleType = Enum.ScaleType.Slice
LeaveGameButtonButton.SliceCenter = Rect.new(8, 6, 46, 44)

LeaveGameButtonTextLabel.Name = "LeaveGameButtonTextLabel"
LeaveGameButtonTextLabel.Parent = LeaveGameButtonButton
LeaveGameButtonTextLabel.BackgroundTransparency = 1.000
LeaveGameButtonTextLabel.BorderSizePixel = 0
LeaveGameButtonTextLabel.Position = UDim2.new(0, 10, 0, -4)
LeaveGameButtonTextLabel.Size = UDim2.new(1, 0, 1, 0)
LeaveGameButtonTextLabel.ZIndex = 2
LeaveGameButtonTextLabel.Font = Enum.Font.SourceSansBold
LeaveGameButtonTextLabel.Text = "Leave Game"
LeaveGameButtonTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LeaveGameButtonTextLabel.TextSize = 24.000
LeaveGameButtonTextLabel.TextWrapped = true

LeaveGameHint.Name = "LeaveGameHint"
LeaveGameHint.Parent = LeaveGameButtonButton
LeaveGameHint.BackgroundTransparency = 1.000
LeaveGameHint.Position = UDim2.new(0, 10, 0, 8)
LeaveGameHint.Size = UDim2.new(0, 48, 0, 48)
LeaveGameHint.ZIndex = 4
LeaveGameHint.Image = "rbxasset://textures/ui/Settings/Help/LeaveIcon.png"

ResetCharacterButtonButton.Name = "ResetCharacterButtonButton"
ResetCharacterButtonButton.Parent = Buttons
ResetCharacterButtonButton.BackgroundTransparency = 1.000
ResetCharacterButtonButton.NextSelectionLeft = ResetCharacterButtonButton
ResetCharacterButtonButton.NextSelectionRight = ResetCharacterButtonButton
ResetCharacterButtonButton.Position = UDim2.new(0.5, -400, 0.5, -25)
ResetCharacterButtonButton.Size = UDim2.new(0, 260, 0, 70)
ResetCharacterButtonButton.AutoButtonColor = false
ResetCharacterButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
ResetCharacterButtonButton.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
ResetCharacterButtonButton.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
ResetCharacterButtonButton.ScaleType = Enum.ScaleType.Slice
ResetCharacterButtonButton.SliceCenter = Rect.new(8, 6, 46, 44)

ResetCharacterButtonTextLabel.Name = "ResetCharacterButtonTextLabel"
ResetCharacterButtonTextLabel.Parent = ResetCharacterButtonButton
ResetCharacterButtonTextLabel.BackgroundTransparency = 1.000
ResetCharacterButtonTextLabel.BorderSizePixel = 0
ResetCharacterButtonTextLabel.Position = UDim2.new(0, 10, 0, -4)
ResetCharacterButtonTextLabel.Size = UDim2.new(1, 0, 1, 0)
ResetCharacterButtonTextLabel.ZIndex = 2
ResetCharacterButtonTextLabel.Font = Enum.Font.SourceSansBold
ResetCharacterButtonTextLabel.Text = "    Reset Character"
ResetCharacterButtonTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetCharacterButtonTextLabel.TextSize = 24.000
ResetCharacterButtonTextLabel.TextWrapped = true

ResetCharacterHint.Name = "ResetCharacterHint"
ResetCharacterHint.Parent = ResetCharacterButtonButton
ResetCharacterHint.BackgroundTransparency = 1.000
ResetCharacterHint.Position = UDim2.new(0, 10, 0, 8)
ResetCharacterHint.Size = UDim2.new(0, 48, 0, 48)
ResetCharacterHint.ZIndex = 4
ResetCharacterHint.Image = "rbxasset://textures/ui/Settings/Help/ResetIcon.png"

ResumeButtonButton.Name = "ResumeButtonButton"
ResumeButtonButton.Parent = Buttons
ResumeButtonButton.BackgroundTransparency = 1.000
ResumeButtonButton.NextSelectionLeft = ResumeButtonButton
ResumeButtonButton.NextSelectionRight = ResumeButtonButton
ResumeButtonButton.Position = UDim2.new(0.5, 140, 0.5, -25)
ResumeButtonButton.Size = UDim2.new(0, 260, 0, 70)
ResumeButtonButton.AutoButtonColor = false
ResumeButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
ResumeButtonButton.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
ResumeButtonButton.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
ResumeButtonButton.ScaleType = Enum.ScaleType.Slice
ResumeButtonButton.SliceCenter = Rect.new(8, 6, 46, 44)

ResumeButtonTextLabel.Name = "ResumeButtonTextLabel"
ResumeButtonTextLabel.Parent = ResumeButtonButton
ResumeButtonTextLabel.BackgroundTransparency = 1.000
ResumeButtonTextLabel.BorderSizePixel = 0
ResumeButtonTextLabel.Position = UDim2.new(0, 10, 0, -4)
ResumeButtonTextLabel.Size = UDim2.new(1, 0, 1, 0)
ResumeButtonTextLabel.ZIndex = 2
ResumeButtonTextLabel.Font = Enum.Font.SourceSansBold
ResumeButtonTextLabel.Text = "Resume Game"
ResumeButtonTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResumeButtonTextLabel.TextSize = 24.000
ResumeButtonTextLabel.TextWrapped = true

ResumeHint.Name = "ResumeHint"
ResumeHint.Parent = ResumeButtonButton
ResumeHint.BackgroundTransparency = 1.000
ResumeHint.Position = UDim2.new(0, 10, 0, 8)
ResumeHint.Size = UDim2.new(0, 48, 0, 48)
ResumeHint.ZIndex = 4
ResumeHint.Image = "rbxasset://textures/ui/Settings/Help/EscapeIcon.png"

game:GetService("ContextActionService"):UnbindCoreAction("RBXEscapeMainMenu")
local clone = game.CoreGui.TopBarApp.TopBarFrame.LeftFrame.MenuIcon:Clone()
clone.Parent = game.CoreGui.TopBarApp.TopBarFrame.LeftFrame
clone.Background.AutoButtonColor = true
game.CoreGui.TopBarApp.TopBarFrame.LeftFrame.MenuIcon:Destroy()
--SCRIPTS

local Buttons = SettingsShieldContents.BottomButtonFrame
--PAGES
local HelpT = PageView.Help
local SettingsT = PageView.Settings
local ReportT = PageView.Report
local PlayersT = PageView.Players
local RecordT = PageView.Record
--TABS
local HelpB = HubBar.Help
local SettingsB = HubBar.Settings
local ReportB = HubBar.Report
local PlayersB = HubBar.Players
local RecordB = HubBar.Record

--FUNCTIONS
local PageNames = {
	"Players",
	"Settings",
	"Report",
	"Help",
	"Record"
}

local TabNames = {
	"Players",
	"Settings",
	"Report",
	"Help",
	"Record"
}

local SETTINGS = Instance.new("Folder", game.Players.LocalPlayer)
SETTINGS.Name = "PLIST_Config"
local SwitchSettings = {
    ["Shift Lock Switch"] = {
        Value = true,
    },
    ["Display Names"] = {
        Value = false,
    }
}


local sign = function(n)
	return n > 0 and 1 or n < 0 and -1 or n == 0 and 0
end

function NewTab(name, whichpage, visible)
	local Frame = Instance.new("Frame")
	local Layout = Instance.new("UIListLayout")
	Frame.Name = name or "Tab"
	Frame.Parent = whichpage
	Frame.Visible = true
	Frame.BackgroundTransparency = 1
	Frame.Size = UDim2.new(1, 0, 0, 0)
	Layout.Parent = Frame
	Layout.Padding = UDim.new(0,5)
	Layout.SortOrder = "LayoutOrder"
	Layout.VerticalAlignment = "Top"
	Layout.HorizontalAlignment = "Center"
	Layout.FillDirection = "Vertical"
end
function RemoveTab(name, whichpage)
	if whichpage:FindFirstChild(name) then
		whichpage[name]:Destroy()
		else
		print("Couldnt fetch tab or was already destroyed!")
	end
end
function Button(name, code, whichpage)
	local Button = Instance.new("ImageButton")
	local Text = Instance.new("TextLabel")
	Button.Name = "Button"
	Button.Parent = whichpage
	Button.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
	Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Button.BorderSizePixel = 1
	Button.BackgroundTransparency = 1
	Button.AnchorPoint = Vector2.new(0.5,0.5)
	Button.Position = UDim2.new(0.5, 0, 0.5, 0)
	Button.Size = UDim2.new(0, 182, 0, 46)
	Button.ScaleType = "Slice"
	Button.SliceCenter = Rect.new(8, 6, 46, 44)
	Button.SliceScale = 1
	Button.TileSize = UDim2.new(1, 0, 1, 0)
	Button.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
	Button.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
	Button.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"

	Text.Parent = Button
	Text.Text = name
	Text.Font = Enum.Font.SourceSansBold
	Text.TextWrapped = true
	Text.TextSize = 24
	Text.BackgroundTransparency = 1
	Text.TextColor3 = Color3.fromRGB(255, 255, 255)
	Text.Position = UDim2.new(0, 0, 0, 1)
	Text.Size = UDim2.new(1, 0, 1, -8)
	Text.Visible = true

	Button.MouseButton1Down:Connect(function()
		loadstring(code)()
	end)
end

function Slider(Text, Default, Minimum, Maximum, Callback)
        local Default = Default or 1
        local Minimum = Minimum or 0
        local Maximum = Maximum or 10

        local function lerp(a, b, t)
            return a + (b - a) * t
        end
        
        local LeftButton = Instance.new("ImageButton")
        local LeftButton_2 = Instance.new("ImageLabel")
        local RightButton = Instance.new("ImageButton")
        local RightButton_2 = Instance.new("ImageLabel")

        local SliderFrame = Instance.new("ImageButton", Frame)
        SliderFrame.Name = "Slide"
        SliderFrame.LayoutOrder = #Frame:GetChildren()
        SliderFrame.Active = false
        SliderFrame.BackgroundTransparency = 1.000
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Position = UDim2.new(0, 0, 0, 250)
        SliderFrame.Selectable = falsew
        SliderFrame.Size = UDim2.new(1, 0, 0, 50)
        SliderFrame.ZIndex = 2
        SliderFrame.AutoButtonColor = false
        SliderFrame.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
        SliderFrame.ImageColor3 = Color3.fromRGB(163, 162, 165)
        SliderFrame.ImageTransparency = 1.000
        SliderFrame.ScaleType = Enum.ScaleType.Slice
        SliderFrame.SliceCenter = Rect.new(2, 2, 18, 18)

        local SliderLabel = Instance.new("TextLabel", SliderFrame)
        SliderLabel.Name = "Label"
        SliderLabel.BackgroundTransparency = 1.000
        SliderLabel.Position = UDim2.new(0, 10, 0, 0)
        SliderLabel.Size = UDim2.new(0, 200, 1, 0)
        SliderLabel.ZIndex = 2
        SliderLabel.Font = Enum.Font.SourceSansBold
        SliderLabel.Text = Text
        SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderLabel.TextSize = 24.000
        SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

        local Slider = Instance.new("ImageButton", SliderFrame)
        Slider.Name = "Slider"
        Slider.AnchorPoint = Vector2.new(1, 0.5)
        Slider.BackgroundTransparency = 1.000
        Slider.Position = UDim2.new(1, 0, 0.5, 0)
        Slider.Size = UDim2.new(0.600000024, 0, 0, 50)
        Slider.ZIndex = 2
        Slider.AutoButtonColor = false

        SliderFrame.MouseEnter:Connect(function()
            SliderFrame.ImageTransparency = 0.5
        end)

        SliderFrame.MouseLeave:Connect(function()
            SliderFrame.ImageTransparency = 1
        end)

        local StepsContainer = Instance.new("Frame", Slider)
        StepsContainer.Name = "StepsContainer"
        StepsContainer.AnchorPoint = Vector2.new(0.5, 0.5)
        StepsContainer.BackgroundTransparency = 1.000
        StepsContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
        StepsContainer.Size = UDim2.new(1, -100, 1, 0)

        local Steps = {}

        for i = 1, 10 do
            local Step = Instance.new("ImageButton", StepsContainer)
            Step.Name = string.format("Step%d", i)
            Step.Active = false
            Step.AnchorPoint = Vector2.new(0, 0.5)
            Step.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
            Step.BackgroundTransparency = 0.36
            Step.BorderSizePixel = 0
            Step.Position = UDim2.new(0.1 * (i - 1), 2, 0.5, 0)
            Step.Size = UDim2.new(0.1, -4, 0.47999, 0)
            Step.ZIndex = 3
            Step.AutoButtonColor = false
            Step.ImageTransparency = 0.36

            Step.MouseButton1Down:Connect(function()
                Default = i
                Callback(lerp(Minimum, Maximum, Default / 10))

                for v = 1, 10 do
                    if v > Default then
                        Steps[v].BackgroundColor3 = Color3.fromRGB(78, 84, 96)
                    else
                        Steps[v].BackgroundColor3 = Color3.fromRGB(0, 162, 255)
                    end
                end
            end)

            table.insert(Steps, Step)
        end

        for v = 1, 10 do
            if v > 1 / (Maximum / Default) * 10 then
                Steps[v].BackgroundColor3 = Color3.fromRGB(78, 84, 96)
            else
                Steps[v].BackgroundColor3 = Color3.fromRGB(0, 162, 255)
            end
        end

        LeftButton.Name = "LeftButton"
        LeftButton.Parent = Slider
        LeftButton.AnchorPoint = Vector2.new(0, 0.5)
        LeftButton.BackgroundTransparency = 1.000
        LeftButton.Position = UDim2.new(0, 0, 0.5, 0)
        LeftButton.Selectable = false
        LeftButton.Size = UDim2.new(0, 50, 0, 50)
        LeftButton.ZIndex = 3

        LeftButton_2.Name = "LeftButton"
        LeftButton_2.Parent = LeftButton
        LeftButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
        LeftButton_2.BackgroundTransparency = 1.000
        LeftButton_2.Position = UDim2.new(0.5, 0, 0.5, 0)
        LeftButton_2.Size = UDim2.new(0, 30, 0, 30)
        LeftButton_2.ZIndex = 4
        LeftButton_2.Image = "rbxasset://textures/ui/Settings/Slider/Less.png"
        LeftButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)

        RightButton.Name = "RightButton"
        RightButton.Parent = Slider
        RightButton.AnchorPoint = Vector2.new(1, 0.5)
        RightButton.BackgroundTransparency = 1.000
        RightButton.Position = UDim2.new(1, 0, 0.5, 0)
        RightButton.Selectable = false
        RightButton.Size = UDim2.new(0, 50, 0, 50)
        RightButton.ZIndex = 3

        RightButton_2.Name = "RightButton"
        RightButton_2.Parent = RightButton
        RightButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
        RightButton_2.BackgroundTransparency = 1.000
        RightButton_2.Position = UDim2.new(0.5, 0, 0.5, 0)
        RightButton_2.Size = UDim2.new(0, 30, 0, 30)
        RightButton_2.ZIndex = 4
        RightButton_2.Image = "rbxasset://textures/ui/Settings/Slider/More.png"
        RightButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)

        RightButton_2.MouseEnter:Connect(function()
            RightButton_2.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end)
        RightButton_2.MouseLeave:Connect(function()
            RightButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)
        end)

        LeftButton_2.MouseEnter:Connect(function()
            LeftButton_2.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end)
        LeftButton_2.MouseLeave:Connect(function()
            LeftButton_2.ImageColor3 = Color3.fromRGB(204, 204, 204)
        end)

        LeftButton.MouseButton1Down:Connect(function()
            if Default - 1 < 0 then return end
            Default = Default - 1
            Callback(lerp(Minimum, Maximum, Default / 10))

            for v = 1, 10 do
                if v > Default then
                    Steps[v].BackgroundColor3 = Color3.fromRGB(78, 84, 96)
                else
                    Steps[v].BackgroundColor3 = Color3.fromRGB(0, 162, 255)
                end
            end
        end)

        RightButton.MouseButton1Down:Connect(function()
            if Default + 1 > 10 then return end

            Default = Default + 1
            Callback(lerp(Minimum, Maximum, Default / 10))

            for v = 1, 10 do
                if v > Default then
                    Steps[v].BackgroundColor3 = Color3.fromRGB(78, 84, 96)
                else
                    Steps[v].BackgroundColor3 = Color3.fromRGB(0, 162, 255)
                end
            end
        end)
    end


function PlayerEntry(text, whichpage, player)
	local TextFrame = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local FriendStatus = Instance.new("ImageButton")
	local FriendStatusText = Instance.new("TextLabel")
	local ImageIcon = Instance.new("ImageLabel")

	TextFrame.Name = "PlayerLabel"..player.Name
	TextFrame.Parent = whichpage
	TextFrame.Active = false
	TextFrame.BackgroundTransparency = 0.85
	TextFrame.BorderSizePixel = 0
	TextFrame.LayoutOrder = 5
	TextFrame.Position = UDim2.new(0, 0, 0, 250)
	TextFrame.Selectable = false
	TextFrame.Size = UDim2.new(1, 0, 0, 60)
	TextFrame.ZIndex = 2
	TextFrame.Image = "rbxasset://textures/ui/dialog_white.png"
	TextFrame.ImageColor3 = Color3.fromRGB(163, 162, 165)
	TextFrame.ImageTransparency = 0.85
	TextFrame.ScaleType = Enum.ScaleType.Slice
	TextFrame.SliceCenter = Rect.new(2, 2, 18, 18)

	TextLabel.Name = "NameLabel"
	TextLabel.Parent = TextFrame
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0, 65, 0, 0)
	TextLabel.Size = UDim2.new(0, 200, 1, 0)
	TextLabel.ZIndex = 2
	TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	game.RunService.RenderStepped:Connect(function()
	if SwitchSettings["Display Names"].Value and whichpage:FindFirstChild("PlayerLabel"..player.Name) then
		TextLabel.Text = player.DisplayName or "Insert Text Here"
	elseif not SwitchSettings["Display Names"].Value and whichpage:FindFirstChild("PlayerLabel"..player.Name) then
		TextLabel.Text = player.Name or "Insert Text Here"
	end
	end)
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 24.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	ImageIcon.Name = "ImageIcon"
	ImageIcon.Parent = TextFrame
	ImageIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageIcon.BackgroundTransparency = 1.000
	ImageIcon.Position = UDim2.new(0, 30, 0, 30)
	ImageIcon.Size = UDim2.new(0, 48, 0, 48)
	ImageIcon.ZIndex = 2
	ImageIcon.Image = game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size48x48)

	FriendStatus.Name = "FriendStatus"
	FriendStatus.Parent = TextFrame
	FriendStatus.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
	FriendStatus.BorderColor3 = Color3.fromRGB(27, 42, 53)
	FriendStatus.BorderSizePixel = 1
	FriendStatus.BackgroundTransparency = 1
	FriendStatus.AnchorPoint = Vector2.new(0.5,0.5)
	FriendStatus.Position = UDim2.new(0.85, 0, 0.5, 0)
	FriendStatus.Size = UDim2.new(0, 182, 0, 46)
	FriendStatus.ScaleType = "Slice"
	FriendStatus.SliceCenter = Rect.new(8, 6, 46, 44)
	FriendStatus.SliceScale = 1
	FriendStatus.ZIndex = 2
	FriendStatus.TileSize = UDim2.new(1, 0, 1, 0)
	FriendStatus.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
	FriendStatus.HoverImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
	FriendStatus.PressedImage = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
	FriendStatusText.Parent = FriendStatus
	
	FriendStatusText.Font = Enum.Font.SourceSansBold
	FriendStatusText.TextWrapped = true
	FriendStatusText.TextSize = 24
	FriendStatusText.ZIndex = 2
	FriendStatusText.BackgroundTransparency = 1
	FriendStatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
	FriendStatusText.Position = UDim2.new(0, 0, 0, 1)
	FriendStatusText.Size = UDim2.new(1, 0, 1, -8)
	FriendStatusText.Visible = true

	TextFrame.MouseEnter:Connect(function()
		TextFrame.ImageTransparency = 0.65
	end)
	TextFrame.MouseLeave:Connect(function()
		TextFrame.ImageTransparency = 0.85
	end)
	if game.Players.LocalPlayer ~= player and not game.Players.LocalPlayer:IsFriendsWith(player.UserId) then 
		FriendStatusText.Text = "Add Friend"
		FriendStatus.Visible = true
	elseif game.Players.LocalPlayer == player then
		FriendStatus.Visible = false
	end
	FriendStatus.MouseButton1Down:Connect(function()
		game.Players.LocalPlayer:RequestFriendship(player)
		FriendStatus:Destroy()
	end)
	if game.Players.LocalPlayer:IsFriendsWith(player.UserId) then 
		FriendStatusText.Size = UDim2.new(0, 182, 0, 46)
		FriendStatusText.Position = UDim2.new(0.74, 0, 0.1, 0)
		FriendStatusText.Text = "Friends"
		FriendStatusText.Parent = TextFrame
		FriendStatusText.Font = Enum.Font.SourceSansLight
		FriendStatus:Destroy()
	end
end

function RemovePlayerEntry(text, whichpage)
	for _,v in pairs(whichpage:GetDescendants()) do
		if v.Name == "PlayerLabel"..text then
			v:Destroy()
		end
	end
end


function UpdateProperty(object, propertyPath, newValue)
    local currentObject = object

    -- Split the propertyPath into individual keys
    local keys = {}
    for key in string.gmatch(propertyPath, "[^.]+") do
        table.insert(keys, key)
    end

    -- Traverse the keys to access the target property
    for i = 1, #keys - 1 do
        currentObject = currentObject[keys[i]]
        if not currentObject then
            warn("Object or property not found in the hierarchy.")
            return
        end
    end

    -- Set the new value for the property
    local lastKey = keys[#keys]
    if currentObject[lastKey] ~= nil then
        currentObject[lastKey] = newValue
    end
end


function UpdateSetting(settingName, newValue)
    local setting = SwitchSettings[settingName]
    if setting then
        setting.Value = newValue
    else
        warn("Setting '" .. settingName .. "' not found.")
    end
end

for i,v in pairs(SwitchSettings) do
	if not SETTINGS:FindFirstChild(i) then
		m = Instance.new("BoolValue", SETTINGS)
		m.Name = i
        m.Value = v
	end
end
function Switch(name, callback, default, whichpage)
	local SwitchFrame = Instance.new("ImageButton", whichpage)
	SwitchFrame.Name = "Switch"
	SwitchFrame.LayoutOrder = #whichpage:GetChildren()
	SwitchFrame.Active = false
	SwitchFrame.BackgroundTransparency = 1.000
	SwitchFrame.BorderSizePixel = 0
	SwitchFrame.Selectable = false
	SwitchFrame.Size = UDim2.new(1, 0, 0, 50)
	SwitchFrame.ZIndex = 2
	SwitchFrame.AutoButtonColor = false
	SwitchFrame.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
	SwitchFrame.ImageColor3 = Color3.fromRGB(163, 162, 165)
	SwitchFrame.ImageTransparency = 1.000
	SwitchFrame.ScaleType = Enum.ScaleType.Slice
	SwitchFrame.SliceCenter = Rect.new(2, 2, 18, 18)
	game["Run Service"].RenderStepped:Connect(function()
        UpdateProperty(callback[1], callback[2], SwitchSettings[name].Value)
	end)
	SwitchFrame.MouseEnter:Connect(function()
		SwitchFrame.ImageTransparency = 0.5
	end)

	SwitchFrame.MouseLeave:Connect(function()
		SwitchFrame.ImageTransparency = 1
	end)

	local SwitchLabel = Instance.new("TextLabel", SwitchFrame)
	SwitchLabel.Name = "SwitchLabel"
	SwitchLabel.BackgroundTransparency = 1.000
	SwitchLabel.Position = UDim2.new(0, 10, 0, 0)
	SwitchLabel.Size = UDim2.new(0, 200, 1, 0)
	SwitchLabel.ZIndex = 2
	SwitchLabel.Font = Enum.Font.SourceSansBold
	SwitchLabel.Text = name
	SwitchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	SwitchLabel.TextSize = 24.000
	SwitchLabel.TextXAlignment = Enum.TextXAlignment.Left

	local Selector = Instance.new("ImageButton", SwitchFrame)
	Selector.Name = "Selector"
	Selector.AnchorPoint = Vector2.new(1, 0.5)
	Selector.BackgroundTransparency = 1.000
	Selector.Position = UDim2.new(1, 0, 0.5, 0)
	Selector.Size = UDim2.new(0.600000024, 0, 0, 50)
	Selector.ZIndex = 2
	Selector.AutoButtonColor = false

	local LeftButton = Instance.new("ImageButton", Selector)
	LeftButton.Name = "LeftButton"
	LeftButton.AnchorPoint = Vector2.new(0, 0.5)
	LeftButton.BackgroundTransparency = 1.000
	LeftButton.Position = UDim2.new(0, 0, 0.5, 0)
	LeftButton.Selectable = false
	LeftButton.Size = UDim2.new(0, 50, 0, 50)
	LeftButton.ZIndex = 3

	local LeftButtonIcon = Instance.new("ImageLabel", LeftButton)
	LeftButtonIcon.Name = "LeftButton"
	LeftButtonIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	LeftButtonIcon.BackgroundTransparency = 1.000
	LeftButtonIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	LeftButtonIcon.Size = UDim2.new(0, 18, 0, 30)
	LeftButtonIcon.ZIndex = 4
	LeftButtonIcon.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
	LeftButtonIcon.ImageColor3 = Color3.fromRGB(204, 204, 204)

	LeftButtonIcon.MouseEnter:Connect(function()
		LeftButtonIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end)

	LeftButtonIcon.MouseLeave:Connect(function()
		LeftButtonIcon.ImageColor3 = Color3.fromRGB(204, 204, 204)
	end)

	local RightButton = Instance.new("ImageButton", Selector)
	RightButton.Name = "RightButton"
	RightButton.AnchorPoint = Vector2.new(1, 0.5)
	RightButton.BackgroundTransparency = 1.000
	RightButton.Position = UDim2.new(1, 0, 0.5, 0)
	RightButton.Selectable = false
	RightButton.Size = UDim2.new(0, 50, 0, 50)
	RightButton.ZIndex = 3

	local RightButtonIcon = Instance.new("ImageLabel", RightButton)
	RightButtonIcon.Name = "RightButton"
	RightButtonIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	RightButtonIcon.BackgroundTransparency = 1.000
	RightButtonIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	RightButtonIcon.Size = UDim2.new(0, 18, 0, 30)
	RightButtonIcon.ZIndex = 4
	RightButtonIcon.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
	RightButtonIcon.ImageColor3 = Color3.fromRGB(204, 204, 204)

	RightButtonIcon.MouseEnter:Connect(function()
		RightButtonIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end)

	RightButtonIcon.MouseLeave:Connect(function()
		RightButtonIcon.ImageColor3 = Color3.fromRGB(204, 204, 204)
	end)

	local AutoSelectButton = Instance.new("ImageButton", Selector)
	AutoSelectButton.Name = "AutoSelectButton"
	AutoSelectButton.BackgroundTransparency = 1.000
	AutoSelectButton.Position = UDim2.new(0, 50, 0, 0)
	AutoSelectButton.Selectable = false
	AutoSelectButton.Size = UDim2.new(1, -100, 1, 0)
	AutoSelectButton.ZIndex = 2

	local Selection1 = Instance.new("TextLabel", Selector)
	Selection1.Name = "Selection"
	Selection1.BackgroundTransparency = 1.000
	Selection1.BorderSizePixel = 0
	Selection1.Position = UDim2.new(0, 50, 0, 0)
	Selection1.Size = UDim2.new(1, -100, 1, 0)
	Selection1.ZIndex = 2
	Selection1.Font = Enum.Font.SourceSans
	Selection1.Text = "On"
	Selection1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Selection1.TextSize = 24.000
	Selection1.TextTransparency = 0.500

	local Selection2 = Instance.new("TextLabel", Selector)
	Selection2.Name = "Selection"
	Selection2.BackgroundTransparency = 1.000
	Selection2.BorderSizePixel = 0
	Selection2.Position = UDim2.new(0, -54, 0, 0)
	Selection2.Size = UDim2.new(1, -100, 1, 0)
	Selection2.ZIndex = 2
	Selection2.Font = Enum.Font.SourceSans
	Selection2.Text = "Off"
	Selection2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Selection2.TextSize = 24.000
	Selection2.TextTransparency = 1.000

	Selection1.Visible = default
	Selection2.Visible = not default

	SwitchFrame.MouseEnter:Connect(function()
		Selection1.TextTransparency = 0
		Selection2.TextTransparency = 0
	end)

	SwitchFrame.MouseLeave:Connect(function()
		Selection1.TextTransparency = 0.500
		Selection2.TextTransparency = 0.500
	end)

	if default then
        UpdateSetting(name, true)
		Selection1.Visible = true
		Selection2.Visible = false
	else
        UpdateSetting(name, false)
		Selection1.Visible = false
		Selection2.Visible = true
		Selection2.Position = UDim2.new(0.1, 0, 0, 0)
		Selection2.TextTransparency = 0.5
		Selection1.Position = UDim2.new(0.5, 0, 0, 0)
		Selection1.TextTransparency = 1
	end

	local Debounce = 0
	RightButton.MouseButton1Down:Connect(function()
		if Debounce + 0.1 > os.clock() then return end
		default = not default

		local Visible, Hidden
		if default then
			Visible = Selection1
			Hidden = Selection2
		else
			Visible = Selection2
			Hidden = Selection1
		end

		Hidden:TweenPosition(UDim2.new(0.25, 0, 0, 0), "Out", "Sine", 0.2)

		game:GetService("TweenService"):Create(Hidden, TweenInfo.new(0.2), {
			TextTransparency = 1
		}):Play()

		UpdateSetting(name, default)

		Visible.Position = UDim2.new(-0.05, 0, 0, 0)
		Visible.Visible = true

		game:GetService("TweenService"):Create(Visible, TweenInfo.new(0.2), {
			TextTransparency = 0
		}):Play()

		Visible:TweenPosition(UDim2.new(0.1, 0, 0, 0), "Out", "Sine", 0.2)

		wait(0.1)

		Hidden.Visible = false
		Debounce = os.clock()
	end)

	LeftButton.MouseButton1Down:Connect(function()
		if Debounce + 0.1 > os.clock() then return end
		default = not default

		local Visible, Hidden
		if default then
			Visible = Selection1
			Hidden = Selection2
		else
			Visible = Selection2
			Hidden = Selection1
		end

		Hidden:TweenPosition(UDim2.new(-0.05, 0, 0, 0), "Out", "Sine", 0.2)

		game:GetService("TweenService"):Create(Hidden, TweenInfo.new(0.2), {
			TextTransparency = 1
		}):Play()

		UpdateSetting(name, default)

		Visible.Position = UDim2.new(0.25, 0, 0, 0)
		Visible.Visible = true

		game:GetService("TweenService"):Create(Visible, TweenInfo.new(0.2), {
			TextTransparency = 0
		}):Play()

		Visible:TweenPosition(UDim2.new(0.1, 0, 0, 0), "Out", "Sine", 0.2)

		wait(0.1)

		Hidden.Visible = false
		Debounce = os.clock()
	end)
end

local sign = function(n)
	return n > 0 and 1 or n < 0 and -1 or n == 0 and 0
end

local current = 1

function switchTabSelection(tab)
	for _,v in HubBar:GetChildren() do
		if v == tab then
			v.TabSelection.Visible = true
			v.Icon.ImageTransparency = 0
			v.Icon.Title.TextTransparency = 0
		else
			v.TabSelection.Visible = false
			v.Icon.ImageTransparency = 0.5
			v.Icon.Title.TextTransparency = 0.5
		end
	end
end

--MAIN
local Current = 1
local Open = false
local firsttime = true
local leavePage = false
local resetPage = false
local noOpFunc = function() end
function createSettings()
	game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    game:GetService("ContextActionService"):BindCoreAction("RbxSettingsHubStopCharacter", noOpFunc, false, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
    require(game.Players.LocalPlayer.PlayerScripts.PlayerModule):GetControls():Disable()
	NewTab("Players", PlayersT, true)
	NewTab("Settings", SettingsT, false)
	NewTab("Report", ReportT, false)
	NewTab("Help", HelpT, false)
	NewTab("Record", RecordT, false)
	NewTab("Leave", RecordT, false)
	NewTab("Reset", RecordT, false)

	switchTabSelection(PlayersB)
	
	for i = 1, 5 do
		HubBar[TabNames[i]].MouseButton1Click:Connect(function()
			if Open then
				local sign = sign(Current - i)
				local NewPage = PageView[PageNames[i]]
				local OldPage = PageView[PageNames[Current]]

				switchTabSelection(HubBar[TabNames[i]])

				NewPage:TweenPosition(UDim2.new(0, 0, 0.017, 0), "Out", "Linear", 0.07)
				OldPage:TweenPosition(UDim2.new(sign, 0, 0.017, 0), "Out", "Linear", 0.07)	
				OldPage.Visible = false
				NewPage.Visible = true

				Current = i 
			end
		end)
	end
	
	Switch("Shift Lock Switch", {game.Players.LocalPlayer["PLIST_Config"]["Shift Lock Switch"], "Value"}, SwitchSettings["Shift Lock Switch"].Value, SettingsT.Settings)
	Switch("Display Names", {game.Players.LocalPlayer["PLIST_Config"]["Display Names"], "Value"}, SwitchSettings["Display Names"].Value, SettingsT.Settings)


	for _,v in pairs(game.Players:GetChildren()) do
		if PlayersT:FindFirstChild("Players") and not PlayersT.Players:FindFirstChild("PlayerLabel"..v.name) then
			PlayerEntry(v.Name, PlayersT.Players, v)
        end
	end
	
	game.Players.PlayerAdded:Connect(function(p)
        if PlayersT:FindFirstChild("Players") and not PlayersT.Players:FindFirstChild("PlayerLabel"..p.name) then
            PlayerEntry(p.Name, PlayersT.Players, p)
        end
    end)
    game.Players.PlayerRemoving:Connect(function(p)
    	if PlayersT:FindFirstChild("Players") then
        	RemovePlayerEntry(p.Name, PlayersT.Players)
        end
    end)
    
end

function Leave()
    if resetPage == false then
        leavePage = true
        LeaveGamePage.Visible = true
        Buttons.Visible = false
        HubBar.Visible = false
        for _,v in PageView:GetChildren() do
            if v.Name ~= "LeaveGamePage" and v.Name ~= "ResetCharacter" then
                v.Visible = false
            end
        end  
    end  
end

function dontLeave()
    leavePage = false
    LeaveGamePage.Visible = false
	Buttons.Visible = true
	HubBar.Visible = true
	for _,v in PageView:GetChildren() do
		if v.Name ~= "LeaveGamePage" and v.Name ~= "ResetCharacter" then
			v.Visible = true
		end
	end   
end

function Reset()
    if leavePage == false then
        resetPage = true
        ResetCharacter.Visible = true
        Buttons.Visible = false
        HubBar.Visible = false
        for _,v in PageView:GetChildren() do
            if v.Name ~= "LeaveGamePage" and v.Name ~= "ResetCharacter" then
                v.Visible = false
            end
        end  
    end
end
function dontReset()
    resetPage = false
    ResetCharacter.Visible = false
	Buttons.Visible = true
	HubBar.Visible = true
	for _,v in PageView:GetChildren() do
		if v.Name ~= "LeaveGamePage" and v.Name ~= "ResetCharacter" then
			v.Visible = true
		end
	end  
end

function resume()
    game:GetService("ContextActionService"):UnbindCoreAction("RbxSettingsHubStopCharacter")
	removeSettings()
	Open = false
	SettingsShield:TweenPosition(UDim2.new(0, 0, -1.1, -36), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.4, true)
end

function removeSettings()
	RemoveTab("Players", PlayersT)
	RemoveTab("Settings", SettingsT)
	RemoveTab("Report", ReportT)
	RemoveTab("Help", HelpT)
	RemoveTab("Record", RecordT)
	RemoveTab("Leave", RecordT)
	RemoveTab("Reset", RecordT)
    require(game.Players.LocalPlayer.PlayerScripts.PlayerModule):GetControls():Enable()
    game:GetService("ContextActionService"):UnbindCoreAction("RbxSettingsHubStopCharacter")
	game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
	if Current ~= 1 then
		local sign = sign(Current - 5)
		local NewPage = PlayersT
		local OldPage = PageView[PageNames[Current]]
		NewPage.Position = UDim2.new(0, 0, 0.017, 0)
		OldPage.Position = UDim2.new(sign, 0, 0.017, 0)
		Current = 1
	end
	for _,v in HubBar:GetChildren() do
		v.TabSelection.Visible = false
		v.Icon.ImageTransparency = 0.5
		v.Icon.Title.TextTransparency = 0.5
	end
end

function openorclose()
    if not Open then
        Open = true
        SettingsShield:TweenPosition(UDim2.new(0, 0, 0, -36), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.4, true)
        if firsttime then
            firsttime = false
        else
            game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
            createSettings()
        end
    elseif Open then
		removeSettings()
		Open = false
		SettingsShield:TweenPosition(UDim2.new(0, 0, -1.1, -36), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.4, true)
    end
end

game.CoreGui.TopBarApp.TopBarFrame.LeftFrame.MenuIcon.Background.MouseButton1Down:Connect(function()
    if not Open then
        openorclose()
    elseif Open then
        openorclose()
    end
end)
game.CoreGui.RobloxGui.SettingsShield:Destroy()
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Escape and not Open then
        openorclose()
	elseif input.KeyCode == Enum.KeyCode.Escape and Open and leavePage == false and resetPage == false then
        openorclose()
	end
    if input.KeyCode == Enum.KeyCode.L and Open and leavePage == false then
        Leave()
    end
    if input.KeyCode == Enum.KeyCode.R and Open and resetPage == false then
        Reset()
    end
    if input.KeyCode == Enum.KeyCode.Escape and leavePage == true then
        dontLeave()
    end
    if input.KeyCode == Enum.KeyCode.Escape and resetPage == true then
        dontReset()
    end
    if input.KeyCode == Enum.KeyCode.Return and resetPage == true and Open then
        game.Players.LocalPlayer.Character:BreakJoints()
        resume()
    end
    if input.KeyCode == Enum.KeyCode.Return and leavePage == true and Open then
        game:Shutdown()
    end
end)

ResumeButtonButton.MouseButton1Down:Connect(function()
	removeSettings()
	Open = false
	SettingsShield:TweenPosition(UDim2.new(0, 0, -1.1, -36), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.4, true)
end)

LeaveGameButtonButton.MouseButton1Down:Connect(function()
    Leave()
end)
DontLeaveGameButton.MouseButton1Down:Connect(function()
    dontLeave()
end)
ResetCharacterButtonButton.MouseButton1Down:Connect(function()
    Reset()
end)
DontResetCharacterButton.MouseButton1Down:Connect(function()
    dontReset()
end)
LeaveGameButton.MouseButton1Down:Connect(function()
    game:Shutdown()
end)
ResetCharacterButton.MouseButton1Down:Connect(function()
    game.Players.LocalPlayer.Character:BreakJoints()
    resume()
end)

function make()
	removeSettings()
	wait(0.1)
    createSettings()
end
createSettings()
game.Players.LocalPlayer.CharacterAdded:Connect(function()
wait(0.5)
make()
end)
--[[
PlayersB.MouseButton1Down:Connect(function()
	switchTab(PlayersB)
end)
SettingsB.MouseButton1Down:Connect(function()
	switchTab(SettingsB)
end)
ReportB.MouseButton1Down:Connect(function()
	switchTab(ReportB)
end)
HelpB.MouseButton1Down:Connect(function()
	switchTab(HelpB)
end)
RecordB.MouseButton1Down:Connect(function()
	switchTab(RecordB)
end)
]]
