local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
-- This is the file for our action bars settings in game via mouseover buttons around action bars.
-- I really hope you'll understand the code, because I was totally drunk when I wrote this file.
-- At least, it work fine. :P (lol)

local width1 = (T.buttonsize * 1) + (T.buttonspacing * 2)
local width2 = (T.buttonsize * 2) + (T.buttonspacing * 3)

local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar
	
	if bar:IsShown() then
		bar:Hide()
	else
		bar:Show()
	end
end

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar
	
	if button == TukuiBar2Button then
		if bar:IsShown() then
			db.hidebar2 = false
			button:ClearAllPoints()
			button:Point("BOTTOM", TukuiBar2, "TOP", 0, T.buttonspacing)
			button.text:SetText("-")
			
		else
			db.hidebar2 = true
			button:ClearAllPoints()
			button:Point("BOTTOM", TukuiBar1, "TOP", 0, T.buttonspacing)
			button.text:SetText("+")
			
		end
	end
	
	if button == TukuiBar3LeftButton or button == TukuiBar3RightButton then
		if bar:IsShown() then
			db.hidebar3 = false

			TukuiBar3LeftButton:ClearAllPoints()
			TukuiBar3LeftButton:Point("BOTTOMRIGHT", TukuiBar3Left, "BOTTOMLEFT", -T.buttonspacing, 0)
			TukuiBar3LeftButton.text:SetText(">")

			TukuiBar3RightButton:ClearAllPoints()
			TukuiBar3RightButton:Point("BOTTOMLEFT", TukuiBar3Right, "BOTTOMRIGHT", T.buttonspacing, 0)
			TukuiBar3RightButton.text:SetText("<")
		else
			db.hidebar3 = true

			TukuiBar3LeftButton:ClearAllPoints()
			TukuiBar3LeftButton:Point("BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -T.buttonspacing, 0)
			TukuiBar3LeftButton.text:SetText("<")

			TukuiBar3RightButton:ClearAllPoints()
			TukuiBar3RightButton:Point("BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", T.buttonspacing, 0)
			TukuiBar3RightButton.text:SetText(">")
		end
	end
		
	if button == TukuiBar4Button then
		if bar:IsShown() then
			db.hidebar4 = false
			button.text:SetText(">")
			
		else
			db.hidebar4 = true
			button.text:SetText("<")
			
		end
	end
	
	if button == cuberight then
		if bar:IsShown() then
			db.logbg = false
		else
			db.logbg = true
		end
	end
	
	if button == TukuiBar5ButtonTop or button == TukuiBar5ButtonBottom then		
		local buttontop = TukuiBar5ButtonTop
		local buttonbot = TukuiBar5ButtonBottom
		if bar:IsShown() then
			db.hidebar5 = false
			buttontop:ClearAllPoints()
			buttontop:Size(bar:GetWidth(), 17)
			buttontop:Point("BOTTOM", bar, "TOP", 0, 2)
			buttontop.text:SetText(">")
			buttonbot:ClearAllPoints()
			buttonbot:Size(bar:GetWidth(), 17)
			buttonbot:Point("TOP", bar, "BOTTOM", 0, -2)
			buttonbot.text:SetText(">")
				
		else
			db.hidebar5 = true
			buttontop:ClearAllPoints()
			buttontop:Size(TukuiBar4:GetWidth(), 17)
			buttontop:Point("BOTTOM", TukuiBar4, "TOP", 0, 2)
			buttontop.text:SetText("<")
			buttonbot:ClearAllPoints()
			buttonbot:Size(TukuiBar4:GetWidth(), 17)
			buttonbot:Point("TOP", TukuiBar4, "BOTTOM", 0, -2)
			buttonbot.text:SetText("<")			
			
		end	
	end
end

local function DrPepper(self, bar) -- guess what! :P
	-- yep, you cannot drink DrPepper while in combat. :(
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

local TukuiBarlogButton = CreateFrame("Button", "TukuiBarlogButton", UIParent)
TukuiBarlogButton:Width(10)
TukuiBarlogButton:Height(10)
TukuiBarlogButton:Point("RIGHT", UIParent, "RIGHT", -18, -219)
TukuiBarlogButton:SetTemplate("Default")
TukuiBarlogButton:RegisterForClicks("AnyUp")
TukuiBarlogButton:SetAlpha(1)
TukuiBarlogButton:SetScript("OnMouseDown", function(self)

end)


local TukuiBar3LeftButton = CreateFrame("Button", "TukuiBar3LeftButton", UIParent)
TukuiBar3LeftButton:Width(17)
TukuiBar3LeftButton:Height(TukuiBar3Left:GetHeight())
TukuiBar3LeftButton:Point("BOTTOMRIGHT", TukuiBar3Left, "BOTTOMLEFT", -T.buttonspacing, 0)
TukuiBar3LeftButton:SetTemplate("Default")
TukuiBar3LeftButton:RegisterForClicks("AnyUp")
TukuiBar3LeftButton:SetAlpha(0)
TukuiBar3LeftButton:SetScript("OnClick", function(self) DrPepper(self, TukuiBar3Left) end)
TukuiBar3LeftButton:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
TukuiBar3LeftButton:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
TukuiBar3LeftButton.text = T.SetFontString(TukuiBar3LeftButton, C.media.uffont, 20)
TukuiBar3LeftButton.text:Point("CENTER", 0, 0)
TukuiBar3LeftButton.text:SetText(">")
TukuiBar3LeftButton:SetFrameLevel(10)

local TukuiBar3RightButton = CreateFrame("Button", "TukuiBar3RightButton", UIParent)
TukuiBar3RightButton:Width(17)
TukuiBar3RightButton:Height(TukuiBar3Right:GetHeight())
TukuiBar3RightButton:Point("BOTTOMLEFT", TukuiBar3Right, "BOTTOMRIGHT", T.buttonspacing, 0)
TukuiBar3RightButton:SetTemplate("Default")
TukuiBar3RightButton:RegisterForClicks("AnyUp")
TukuiBar3RightButton:SetAlpha(0)
TukuiBar3RightButton:SetScript("OnClick", function(self) DrPepper(self, TukuiBar3Left) end)
TukuiBar3RightButton:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
TukuiBar3RightButton:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
TukuiBar3RightButton.text = T.SetFontString(TukuiBar3RightButton, C.media.uffont, 20)
TukuiBar3RightButton.text:Point("CENTER", 0, 0)
TukuiBar3RightButton.text:SetText("<")
TukuiBar3RightButton:SetFrameLevel(10)

local TukuiBar4Button = CreateFrame("Button", "TukuiBar4Button", UIParent)
TukuiBar4Button:Width(20)
TukuiBar4Button:Height(150)
TukuiBar4Button:Point("RIGHT", UIParent, "RIGHT", 2, -14)
TukuiBar4Button:SetTemplate("Default")
TukuiBar4Button:RegisterForClicks("AnyUp")
TukuiBar4Button:SetAlpha(0)
TukuiBar4Button:SetScript("OnClick", function(self) DrPepper(self, TukuiBar4) end)
TukuiBar4Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
TukuiBar4Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
TukuiBar4Button.text = T.SetFontString(TukuiBar4Button, C.media.uffont, 30)
TukuiBar4Button.text:SetPoint("CENTER", 0, 0)
TukuiBar4Button.text:SetText("<")


-- exit vehicle button on left side of bottom action bar
local vehicleleft = CreateFrame("Button", "TukuiExitVehicleButtonLeft", UIParent, "SecureHandlerClickTemplate")
vehicleleft:SetAllPoints(TukuiBar3LeftButton)
vehicleleft:SetFrameStrata(TukuiBar3LeftButton:GetFrameStrata())
vehicleleft:SetFrameLevel(TukuiBar3LeftButton:GetFrameLevel() + 1)
vehicleleft:SetTemplate("Default")
vehicleleft:RegisterForClicks("AnyUp")
vehicleleft:SetScript("OnClick", function() VehicleExit() end)
vehicleleft.text = T.SetFontString(vehicleleft, C.media.uffont, 20)
vehicleleft.text:Point("CENTER", 1, 1)
vehicleleft.text:SetText("|cff4BAF4CV|r")
RegisterStateDriver(vehicleleft, "visibility", "[target=vehicle,exists] show;hide")

-- exit vehicle button on right side of bottom action bar
local vehicleright = CreateFrame("Button", "TukuiExitVehicleButtonRight", UIParent, "SecureHandlerClickTemplate")
vehicleright:SetAllPoints(TukuiBar3RightButton)
vehicleright:SetTemplate("Default")
vehicleright:SetFrameStrata(TukuiBar3RightButton:GetFrameStrata())
vehicleright:SetFrameLevel(TukuiBar3RightButton:GetFrameLevel() + 1)
vehicleright:RegisterForClicks("AnyUp")
vehicleright:SetScript("OnClick", function() VehicleExit() end)
vehicleright.text = T.SetFontString(vehicleright, C.media.uffont, 20)
vehicleright.text:Point("CENTER", 1, 1)
vehicleright.text:SetText("|cff4BAF4CV|r")
RegisterStateDriver(vehicleright, "visibility", "[target=vehicle,exists] show;hide")

--------------------------------------------------------------
-- DrPepper taste is really good with Vodka. 
--------------------------------------------------------------

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not TukuiDataPerChar then TukuiDataPerChar = {} end
	local db = TukuiDataPerChar
	
	
	if not T.lowversion and db.hidebar3 then
		DrPepper(TukuiBar3LeftButton, TukuiBar3Left)
	end
	
	if db.hidebar4 then
		DrPepper(TukuiBar4Button, TukuiBar4)
	end
		
	if db.hidebar5 then
		DrPepper(TukuiBar5ButtonTop, TukuiBar5)
	end
	
end)