local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

local TukuiBar1 = CreateFrame("Frame", "TukuiBar1", UIParent, "SecureHandlerStateTemplate")
TukuiBar1:CreatePanel("Default", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 24)
TukuiBar1:SetWidth((T.buttonsize * 10) + (T.buttonspacing * 11))
TukuiBar1:SetHeight((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar1:SetFrameStrata("BACKGROUND")
TukuiBar1:SetFrameLevel(1)
TukuiBar1:EnableMouse(1)

local TukuiBar2 = CreateFrame("Frame", "TukuiBar2", UIParent)
TukuiBar2:CreatePanel("Default", 1, 1, "BOTTOM", TukuiBar1, "BOTTOM", 0, 0)
TukuiBar2:SetWidth((T.buttonsize * 10) + (T.buttonspacing * 11))
TukuiBar2:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar2:SetFrameStrata("BACKGROUND")
TukuiBar2:SetFrameLevel(2)
TukuiBar2:EnableMouse(1)

local TukuiBar3L = CreateFrame("Frame", "TukuiBar3Left", UIParent)
TukuiBar3L:CreatePanel("Default", 1, 1, "BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -5, 0)
TukuiBar3L:SetWidth((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar3L:SetHeight((T.buttonsize * 3) + (T.buttonspacing * 4))
TukuiBar3L:SetFrameStrata("BACKGROUND")
TukuiBar3L:SetFrameLevel(2)
TukuiBar3L:EnableMouse(1)

local Bar3Lbg1 = CreateFrame("Frame", "Bar3Lbg1", TukuiBar3L)
Bar3Lbg1:CreatePanel("Transparent", 30, 55, "LEFT", TukuiBar3L, "RIGHT", -5, 0)
Bar3Lbg1:SetParent(TukuiBar3L)
Bar3Lbg1:SetFrameStrata("BACKGROUND")
Bar3Lbg1:SetFrameLevel(0)


local TukuiBar3R = CreateFrame("Frame", "TukuiBar3Right", UIParent)
TukuiBar3R:CreatePanel("Default", 1, 1, "BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 5, 0)
TukuiBar3R:SetWidth((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar3R:SetHeight((T.buttonsize * 3) + (T.buttonspacing * 4))
TukuiBar3R:SetFrameStrata("BACKGROUND")
TukuiBar3R:SetFrameLevel(2)
TukuiBar3R:EnableMouse(1)

local Bar3Rbg1 = CreateFrame("Frame", "Bar3Rbg1", TukuiBar3R)
Bar3Rbg1:CreatePanel("Transparent", 30, 55, "RIGHT", TukuiBar3R, "LEFT", 5, 0)
Bar3Rbg1:SetParent(TukuiBar3R)
Bar3Rbg1:SetFrameStrata("BACKGROUND")
Bar3Rbg1:SetFrameLevel(0)

local TukuiBar4 = CreateFrame("Frame", "TukuiBar4", UIParent)
TukuiBar4:CreatePanel("Default", 1, 1, "RIGHT", UIParent, "RIGHT", -23, -14)
TukuiBar4:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar4:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar4:SetFrameStrata("BACKGROUND")
TukuiBar4:SetFrameLevel(2)

local TukuiBar5 = CreateFrame("Frame", "TukuiBar5", UIParent)
TukuiBar5:CreatePanel("Default", 1, 1, "BOTTOM", TukuiBar1, "BOTTOM", 0, 0)
TukuiBar5:SetWidth((T.buttonsize * 10) + (T.buttonspacing * 11))
TukuiBar5:SetHeight((T.buttonsize * 3) + (T.buttonspacing * 4))
TukuiBar5:SetFrameStrata("BACKGROUND")
TukuiBar5:SetFrameLevel(3)
TukuiBar5:EnableMouse(1)

local petbg = CreateFrame("Frame", "TukuiPetBar", UIParent, "SecureHandlerStateTemplate")
petbg:CreatePanel("Default", (T.petbuttonsize * 10) + (T.petbuttonspacing * 11), T.petbuttonsize + (T.petbuttonspacing * 2), "BOTTOM", TukuiBar5, "TOP", 0, 5)

local ltpetbg1 = CreateFrame("Frame", "TukuiBar5", petbg)
ltpetbg1:CreatePanel("Transparent", 205, 24, "TOP", petbg, "BOTTOM", 0, 5)
ltpetbg1:SetParent(petbg)
ltpetbg1:SetFrameStrata("BACKGROUND")
ltpetbg1:SetFrameLevel(0)


-- INVISIBLE FRAME COVERING BOTTOM ACTIONBARS JUST TO PARENT UF CORRECTLY
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
if T.lowversion then
	invbarbg:SetPoint("TOPLEFT", TukuiBar1)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar1)
	TukuiBar2:Hide()
	TukuiBar3:Hide()
else
	invbarbg:SetPoint("TOPLEFT", TukuiBar3Left)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar3Right)
end
-- LEFT VERTICAL LINE
local ileftlv = CreateFrame("Frame", "TukuiInfoLeftLineVertical", TukuiBar1)
ileftlv:CreatePanel("Default", 2, 130, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 30)

-- RIGHT VERTICAL LINE
local irightlv = CreateFrame("Frame", "TukuiInfoRightLineVertical", TukuiBar1)
irightlv:CreatePanel("Default", 2, 130, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 30)

if C.chat.background then
	-- CUBE AT LEFT, ACT AS A BUTTON (CHAT MENU)
	local cubeleft = CreateFrame("Frame", "TukuiCubeLeft", TukuiBar1)
	cubeleft:CreatePanel("Default", 10, 10, "BOTTOM", ileftlv, "TOP", 0, 0)
	cubeleft:EnableMouse(true)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			if btn == "RightButton" then
				if TukuiInfoLeftBattleGround:IsShown() then
					TukuiInfoLeftBattleGround:Hide()
				else
					TukuiInfoLeftBattleGround:Show()
				end
			end
		end
		
		if btn == "LeftButton" then	
			ToggleFrame(ChatMenu)
		end
	end)

	-- CUBE AT RIGHT, ACT AS A BUTTON (CONFIGUI or BG'S)
--	local cuberight = CreateFrame("Frame", "TukuiCubeRight", TukuiBar1)
--	cuberight:CreatePanel("Default", 10, 10, "BOTTOM", irightlv, "TOP", 0, 0)
--	if C["bags"].enable then
--		cuberight:EnableMouse(true)
--		cuberight:SetScript("OnMouseDown", function(self)
--			ToggleKeyRing()
--		end)
--	end


end

-- HORIZONTAL LINE LEFT
local ltoabl = CreateFrame("Frame", "TukuiLineToABLeft", TukuiBar1)
ltoabl:CreatePanel("Default", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabl:ClearAllPoints()
ltoabl:Point("BOTTOMLEFT", ileftlv, "BOTTOMLEFT", 0, 0)
ltoabl:Point("RIGHT", TukuiBar1, "BOTTOMLEFT", -1, 17)
ltoabl:SetFrameStrata("BACKGROUND")
ltoabl:SetFrameLevel(0)

-- HORIZONTAL LINE RIGHT
local ltoabr = CreateFrame("Frame", "TukuiLineToABRight", TukuiBar1)
ltoabr:CreatePanel("Default", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabr:ClearAllPoints()
ltoabr:Point("LEFT", TukuiBar1, "BOTTOMRIGHT", 1, 17)
ltoabr:Point("BOTTOMRIGHT", irightlv, "BOTTOMRIGHT", 0, 0)
ltoabr:SetFrameStrata("BACKGROUND")
ltoabr:SetFrameLevel(1)

-- MOVE/HIDE SOME ELEMENTS IF CHAT BACKGROUND IS ENABLED
local movechat = 0
--if C.chat.background then movechat = 10 ileftlv:SetAlpha(0) irightlv:SetAlpha(0) end

-- INFO LEFT (FOR STATS)
local ileft = CreateFrame("Frame", "TukuiInfoLeft", TukuiBar1)
ileft:CreatePanel(ileft, T.Scale(237), 14, "LEFT", ltoabl, "LEFT", T.Scale(14), 0)
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")

-- INFO RIGHT (FOR STATS)
local iright = CreateFrame("Frame", "TukuiInfoRight", TukuiBar1)
iright:CreatePanel(iright, T.Scale(375), 14, "RIGHT", ltoabr, "RIGHT", T.Scale(-14), 0)
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")

if C.chat.background then
-- CHAT BG LEFT
local chatleftbg = CreateFrame("Frame", "TukuiChatBackgroundLeft", TukuiInfoLeft)
chatleftbg:CreatePanel("Transparent", 237, 116, "BOTTOMLEFT", TukuiInfoLeft, "TOPLEFT", 0, 3)
chatleftbg:SetFrameStrata("BACKGROUND")
chatleftbg:SetFrameLevel(1)


-- CHATTAB BG LEFT
local chattableftbg = CreateFrame("Frame", "chattableftbg", TukuiInfoLeft)
chattableftbg:CreatePanel("Transparent", 237, 14, "BOTTOMLEFT", TukuiChatBackgroundLeft, "TOPLEFT", 0, 0)
chattableftbg:SetParent(TukuiChatBackgroundLeft)

-- OMEN BG 
local omenbg = CreateFrame("Frame", "OmenBG", TukuiInfoRight)
omenbg:CreatePanel("Transparent", 187, 117, "BOTTOMLEFT", TukuiInfoRight, "TOPLEFT", 0, 3)


-- OMENTAB BG LEFT
local omentabbg = CreateFrame("Frame", "OmenTabBG", TukuiInfoLeft)
omentabbg:CreatePanel("Transparent", 187, 14, "BOTTOMLEFT", OmenBG, "TOPLEFT", 0, 0)
omentabbg:SetParent(OmenBG)

-- RECOUNT BG 
local recountbg = CreateFrame("Frame", "RecountBG", TukuiInfoRight)
recountbg:CreatePanel("Transparent", 187, 117, "BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, 3)


-- RECOUNTTAB BG
local recounttabbg = CreateFrame("Frame", "RecountTabBG", TukuiInfoLeft)
recounttabbg:CreatePanel("Transparent", 187, 14, "BOTTOMLEFT", RecountBG, "TOPLEFT", 0, 0)
recounttabbg:SetParent(RecountBG)

end

local Logbg = CreateFrame("Frame", "Logbg", UIParent)
Logbg:CreatePanel("Default", 375, 131, "BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, 3)
Logbg:SetFrameStrata("BACKGROUND")
Logbg:SetFrameLevel(5)
Logbg:EnableMouse(1)
Logbg:Hide()
T.AnimGroup(Logbg, 550,0,0.4)


if TukuiMinimap then
	local minimapstatsleft = CreateFrame("Frame", "TukuiMinimapStatsLeft", TukuiMinimap)
	minimapstatsleft:CreatePanel("Default", ((TukuiMinimap:GetWidth() + 4) / 2) -3, 14, "TOPLEFT", TukuiMinimap, "BOTTOMLEFT", 0, -3)

	local minimapstatsright = CreateFrame("Frame", "TukuiMinimapStatsRight", TukuiMinimap)
	minimapstatsright:CreatePanel("Default", ((TukuiMinimap:GetWidth() + 4) / 2) -3, 14, "TOPRIGHT", TukuiMinimap, "BOTTOMRIGHT", 0, -3)
end

--BATTLEGROUND STATS FRAME
if C["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiInfoLeftBattleGround", UIParent)
	bgframe:CreatePanel("Default", 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
	bgframe:SetAllPoints(ileft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end
