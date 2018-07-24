SRE_VERSION = "|cFF00FF00SimpleRareElite v1.28|r";
local SimpleRareElite = CreateFrame('Frame', 'SimpleRareElite', UIParent)
local TargetFrame

-- Option GUI
function SimpleRareElite_GUI()
	
	SREGui = {};
	SREGui = CreateFrame( "Frame", "SREGui", UIParent );
	SREGui.name = "SimpleRareElite";
	
	InterfaceOptions_AddCategory(SREGui);

	SRETitle = SREGui:CreateFontString("title", "OVERLAY")
	SRETitle:SetFont("Fonts\\MORPHEUS.ttf",25)
	SRETitle:SetTextColor(1, 0.82, 0)
	SRETitle:SetPoint("TOPLEFT", 20, -5)
	SRETitle:SetText("SimpleRareElite")	
	
	SimpleRareElite_GUI_Skin()	
	SimpleRareElite_GUI_Frame_Level()
	SimpleRareElite_GUI_ReloadUI();	

	
end

function SimpleRareElite_GUI_Skin()

	SRETitle1 = SREGui:CreateFontString("title1", "OVERLAY", "GameTooltipText")
	SRETitle1:SetTextColor(1, 0.82, 0)
	SRETitle1:SetPoint("TOPLEFT", 20, -50)
	SRETitle1:SetText("Set Textures")	
	
	if not DDM then
		CreateFrame("Button", "DDM", SREGui, "UIDropDownMenuTemplate")
	end
	 
	DDM:ClearAllPoints()
	DDM:SetPoint("TOPLEFT", 2, -70)
	DDM:Show()	
	 
	local items = {
	   "Blurry",
	   "Classic",
	   "Modern",
	   "Tiny",
	}
	 
	local function OnClick(self)
		UIDropDownMenu_SetSelectedID(DDM, self:GetID())	
		
		if (self:GetID() == 1) then 
		
		--Blurry			
			DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to use Blurry textures");
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Change target to load texture|r");
			skin = "blurry"
				
		elseif (self:GetID() == 2) then 
			
		--Classic			
			DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to use Classic textures");
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Change target to load texture|r");
			skin = "classic"	
						
		elseif (self:GetID() == 3) then 
		
		--Modern		
			DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to use Modern textures");
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Change target to load texture|r");
			skin = "modern"
		
		elseif (self:GetID() == 4) then

		--Tiny		
			DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to use Tiny textures");
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Change target to load texture|r");
			skin = "tiny"
			
		end	
		
	end
	 
	local function initialize(self, level)
	   local info = UIDropDownMenu_CreateInfo()
	   for k,v in pairs(items) do
		  info = UIDropDownMenu_CreateInfo()
		  info.text = v
		  info.value = v
		  info.func = OnClick
		  UIDropDownMenu_AddButton(info, level)
	   end
	end
	 
	 
	UIDropDownMenu_Initialize(DDM, initialize)
	UIDropDownMenu_SetWidth(DDM, 100);
	UIDropDownMenu_SetButtonWidth(DDM, 124)
	UIDropDownMenu_SetSelectedID(DDM, 2)
	UIDropDownMenu_JustifyText(DDM, "LEFT")

end

function SimpleRareElite_GUI_Frame_Level()

	SRETitle2 = SREGui:CreateFontString("title2", "OVERLAY", "GameTooltipText")
	SRETitle2:SetTextColor(1, 0.82, 0)
	SRETitle2:SetPoint("TOPLEFT", 20, -110)
	SRETitle2:SetText("Set Frame Level")	
	
	if not DDM1 then
		CreateFrame("Button", "DDM1", SREGui, "UIDropDownMenuTemplate")
	end
	 
	DDM1:ClearAllPoints()
	DDM1:SetPoint("TOPLEFT", 2, -130)
	DDM1:Show()	
	 
	local items1 = {
	   "Above",
	   "Below",	   
	}
	 
	local function OnClick1(self)
		UIDropDownMenu_SetSelectedID(DDM1, self:GetID())	
		if (self:GetID() == 1) then 
		
		--Above
		
			DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to show textures above buffs and health text");		
			fl = 12
			
			StaticPopup_Hide ("RELOADUI")
			StaticPopup_Show ("RELOADUI")	
		
		elseif (self:GetID() == 2) then 
			
		--Below	
		
			DEFAULT_CHAT_FRAME:AddMessage("SimpleRareElite is now set to show textures below buffs and health text");			
			fl = 1
			
			StaticPopup_Hide ("RELOADUI")
			StaticPopup_Show ("RELOADUI")		
			
		end	
	end
	 
	local function initialize1(self, level)
	   local info1 = UIDropDownMenu_CreateInfo()
	   for k,v in pairs(items1) do
		  info1 = UIDropDownMenu_CreateInfo()
		  info1.text = v
		  info1.value = v
		  info1.func = OnClick1
		  UIDropDownMenu_AddButton(info1, level)
	   end
	end
	 
	 
	UIDropDownMenu_Initialize(DDM1, initialize1)
	UIDropDownMenu_SetWidth(DDM1, 100);
	UIDropDownMenu_SetButtonWidth(DDM1, 124)
	UIDropDownMenu_SetSelectedID(DDM1, 1)
	UIDropDownMenu_JustifyText(DDM1, "LEFT")
	
end

function SimpleRareElite_GUI_ReloadUI()
	
	StaticPopupDialogs["RELOADUI"] = {
	text = "Changing this setting requires that you reload your User Interface",
	button1 = "Accept",
	button2 = "Cancel",
	OnAccept = function()
	  ReloadUI();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
	}
end

-- Set Textures 
local function SetSimpleRareElite(Texture)
		
	SimpleRareElite.Texture:SetTexture('Interface\\AddOns\\SimpleRareElite\\Textures\\'.. skin ..'\\'..Texture)
	SimpleRareElite.Texture:SetTexCoord(0, 1, 0, 1)
	SimpleRareElite:ClearAllPoints()	
	
	if skin == 'blurry' then
	
		--Blurry		
		
		if TargetFrame == ElvUF_Target then
			SimpleRareElite:SetSize(120, 120)	
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 47, 25)
		elseif TargetFrame == SUFUnittarget then
			SimpleRareElite:SetSize(120, 120)	
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 47, 25)
		elseif TargetFrame == oUF_TukuiTarget then
			SimpleRareElite:SetSize(128, 128)	
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 52, 28)
		end			
			
	elseif skin == 'classic' then
	
		--Classic
		
		SimpleRareElite:SetSize(256, 128)		
		
		if TargetFrame == ElvUF_Target then
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 100, 15)
		elseif TargetFrame == SUFUnittarget then
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 100, 15)
		elseif TargetFrame == oUF_TukuiTarget then
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 102, 15)
		end				
	
	
	elseif skin == 'modern' then
	
		--Modern		
		
		if TargetFrame == ElvUF_Target then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 36, 8)
		elseif TargetFrame == SUFUnittarget then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 36, 8)			
		elseif TargetFrame == oUF_TukuiTarget then
			SimpleRareElite:SetSize(110, 110)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 41, 9)
		end

	elseif skin == 'tiny' then
	
		--Tiny	
		
		if TargetFrame == ElvUF_Target then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 33, 8)	
		elseif TargetFrame == SUFUnittarget then
			SimpleRareElite:SetSize(100, 100)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 33, 8)			
		elseif TargetFrame == oUF_TukuiTarget then
			SimpleRareElite:SetSize(110, 110)
			SimpleRareElite:SetPoint('TOPRIGHT', TargetFrame, 'TOPRIGHT', 38, 9)
		end					
		
	end
	
	SimpleRareElite:Show()	
	
	
end

-- Load and Show Textures
local function CreateSimpleRareElite()	
	
	SimpleRareElite:RegisterEvent('PLAYER_LOGIN')
	SimpleRareElite:RegisterEvent("ADDON_LOADED")
	
	SimpleRareElite:SetScript('OnEvent', function(self, event, arg1)		
		self:Hide()
		
		if event == "ADDON_LOADED" and arg1 =="SimpleRareElite" then
			skin = skin or "modern"
			fl = fl or 12
		end
		
		if event == 'PLAYER_LOGIN' then	
						
			TargetFrame = ElvUF_Target or oUF_TukuiTarget or SUFUnittarget
			
			if not TargetFrame then 
				return 
			end					
		
			SimpleRareElite:SetParent(TargetFrame)
			SimpleRareElite.Texture = SimpleRareElite:CreateTexture('ARTWORK')				
			SimpleRareElite:SetFrameLevel(fl)
			SimpleRareElite.Texture:SetAllPoints()					
			
			self:RegisterEvent('PLAYER_TARGET_CHANGED')
			
		elseif event == "PLAYER_TARGET_CHANGED" then
		
			local TargetClass = UnitIsPlayer('target') and select(2, UnitClass('target')) or UnitClassification('target')
			
			if TargetClass == 'worldboss' then
				SetSimpleRareElite('worldboss.tga')			
			elseif TargetClass == 'elite' then
				SetSimpleRareElite('elite.tga')						
			elseif TargetClass == 'rare' then
				SetSimpleRareElite('rare.tga')			
			elseif TargetClass == 'rareelite' then
				SetSimpleRareElite('rareelite.tga')
			end
		end
	end)	
end

-- Commands Function
local function InitSlashCommands()

	SLASH_SRE1,  SLASH_SRE2 = '/sre', '/simplerareelite';
	
	function SlashCmdList.SRE(msg, editbox)
		
		InterfaceOptionsFrame_Show() 
		InterfaceOptionsFrame_OpenToCategory(SREGui);
	
	end
	
end

CreateSimpleRareElite();
InitSlashCommands();
SimpleRareElite_GUI();












