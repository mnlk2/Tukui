local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- setup MultiBarLeft as bar #3 
---------------------------------------------------------------------------

local barL = TukuiBar3Left
local barR = TukuiBar3Right
barR:SetParent(barL)
MultiBarBottomRight:SetParent(barL)

for i= 1, 12 do
	local b = _G["MultiBarBottomRightButton"..i]
	local b2 = _G["MultiBarBottomRightButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
		if i == 1 then
			b:SetPoint("TOPLEFT", barL, "TOPLEFT", T.buttonspacing, -T.buttonspacing)
		elseif i == 3 then
			b:SetPoint("TOP", _G["MultiBarBottomRightButton"..i-2], "BOTTOM", 0, -T.buttonspacing)
		elseif i == 5 then
			b:SetPoint("TOP", _G["MultiBarBottomRightButton"..i-2], "BOTTOM", 0, -T.buttonspacing)
		elseif i == 7 then
			b:SetPoint("TOPLEFT", barR, "TOPLEFT", T.buttonspacing, -T.buttonspacing)
		elseif i == 9 then
			b:SetPoint("TOP", _G["MultiBarBottomRightButton"..i-2], "BOTTOM", 0, -T.buttonspacing)
		elseif i == 11 then
			b:SetPoint("TOP", _G["MultiBarBottomRightButton"..i-2], "BOTTOM", 0, -T.buttonspacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end 		
end



