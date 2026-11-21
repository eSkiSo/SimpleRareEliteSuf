---@diagnostic disable: undefined-field, lowercase-global

-- Reload UI dialog
StaticPopupDialogs["RELOADUI"] = {
	text = "Changing this setting requires that you reload your User Interface",
	button1 = "Accept",
	button2 = "Cancel",
	OnAccept = ReloadUI,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}

-- Proxy get/set for skin (SavedVariablesPerCharacter global)
local function GetSkin()
	return skin or "modern"
end

local function SetSkin(value)
	skin = value
	DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to use " .. value .. " textures")
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Change target to load texture|r")
end

-- Proxy get/set for fl (SavedVariablesPerCharacter global)
local function GetFrameLevel()
	return fl or 12
end

local function SetFrameLevel(value)
	fl = value
	DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to show textures " .. (value == 1 and "below" or "above") .. " buffs and health text")
	StaticPopup_Hide("RELOADUI")
	StaticPopup_Show("RELOADUI")
end

-- Create vertical layout category (modern Settings API)
local category, _ = Settings.RegisterVerticalLayoutCategory("|cFF1ABC9CSimpleRareElite|r")

-- Skin dropdown setting
local skinSetting = Settings.RegisterProxySetting(category, "SRE_SKIN", Settings.VarType.String, "Texture Style", "modern", GetSkin, SetSkin)

local skinOptions = Settings.CreateControlTextContainer()
skinOptions:Add("blurry", "Blurry", "Soft, blurred texture style")
skinOptions:Add("classic", "Classic", "Original style texture")
skinOptions:Add("modern", "Modern", "Clean, sharp modern texture (default)")
skinOptions:Add("tiny", "Tiny", "Compact small texture")

local skinData = skinOptions:GetData()
Settings.CreateDropdown(category, skinSetting, function() return skinData end, "Choose the visual style for elite/rare indicators")

-- Frame level dropdown setting
local flSetting = Settings.RegisterProxySetting(category, "SRE_FL", Settings.VarType.Number, "Frame Level", 12, GetFrameLevel, SetFrameLevel)

local flOptions = Settings.CreateControlTextContainer()
flOptions:Add(12, "Above", "Show textures above buffs and health text")
flOptions:Add(1, "Below", "Show textures below buffs and health text")

local flData = flOptions:GetData()
Settings.CreateDropdown(category, flSetting, function() return flData end, "Show textures above or below buffs and health text")

-- Register the category
Settings.RegisterAddOnCategory(category)

-- Slash Commands
SLASH_SRE1 = '/sre'
SLASH_SRE2 = '/simplerareelite'
SlashCmdList['SRE'] = function()
	Settings.OpenToCategory(category:GetID())
end
