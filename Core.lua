---@diagnostic disable: undefined-field, lowercase-global

local SimpleRareElite = CreateFrame('Frame', 'SimpleRareElite', UIParent)
local TargetFrame

local function SetSimpleRareElite(Texture)
	SimpleRareElite.Texture:SetTexture('Interface\\AddOns\\SimpleRareElite\\Textures\\' .. skin .. '\\' .. Texture)
	SimpleRareElite.Texture:SetTexCoord(0, 1, 0, 1)
	SimpleRareElite:ClearAllPoints()

	if skin == 'blurry' then
		if TargetFrame == _G.ElvUF_Target then
			SimpleRareElite:SetSize(120, 120)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 47, 25)
		elseif TargetFrame == _G.SUFUnittarget then
			SimpleRareElite:SetSize(120, 120)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 47, 25)
		elseif TargetFrame == _G.oUF_TukuiTarget then
			SimpleRareElite:SetSize(128, 128)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 52, 28)
		end
	elseif skin == 'classic' then
		SimpleRareElite:SetSize(256, 128)

		if TargetFrame == _G.ElvUF_Target then
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 100, 15)
		elseif TargetFrame == _G.SUFUnittarget then
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 100, 15)
		elseif TargetFrame == _G.oUF_TukuiTarget then
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 102, 15)
		end
	elseif skin == 'modern' then
		if TargetFrame == _G.ElvUF_Target then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 36, 8)
		elseif TargetFrame == _G.SUFUnittarget then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 36, 8)
		elseif TargetFrame == _G.oUF_TukuiTarget then
			SimpleRareElite:SetSize(110, 110)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 41, 9)
		end
	elseif skin == 'tiny' then
		if TargetFrame == _G.ElvUF_Target then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 33, 8)
		elseif TargetFrame == _G.SUFUnittarget then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 33, 8)
		elseif TargetFrame == _G.oUF_TukuiTarget then
			SimpleRareElite:SetSize(110, 110)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 38, 9)
		end
	end

	SimpleRareElite:Show()
end

local function OnEvent(self, event, arg1)
	self:Hide()

	if event == "ADDON_LOADED" and arg1 == "SimpleRareElite" then
		skin = skin or "modern"
		fl = fl or 12
	end

	if event == 'PLAYER_LOGIN' then
		TargetFrame = _G.ElvUF_Target or _G.oUF_TukuiTarget or _G.SUFUnittarget

		if not TargetFrame then
			return
		end

		SimpleRareElite:SetParent(TargetFrame)
		SimpleRareElite.Texture = SimpleRareElite:CreateTexture(nil, 'ARTWORK')
		SimpleRareElite:SetFrameLevel(fl)
		SimpleRareElite.Texture:SetAllPoints()

		self:RegisterEvent('PLAYER_TARGET_CHANGED')
	elseif event == "PLAYER_TARGET_CHANGED" then
		local class = UnitIsPlayer('target') and select(2, UnitClass('target'))
		local targetClass = class or UnitClassification('target')

		if targetClass == 'worldboss' then
			SetSimpleRareElite('worldboss.tga')
		elseif targetClass == 'elite' then
			SetSimpleRareElite('elite.tga')
		elseif targetClass == 'rare' then
			SetSimpleRareElite('rare.tga')
		elseif targetClass == 'rareelite' then
			SetSimpleRareElite('rareelite.tga')
		end
	end
end

SimpleRareElite:RegisterEvent('PLAYER_LOGIN')
SimpleRareElite:RegisterEvent("ADDON_LOADED")
SimpleRareElite:SetScript("OnEvent", OnEvent)
