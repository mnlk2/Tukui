local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales	

------------------------------------------------------------------------
-- Chat Animation Functions
------------------------------------------------------------------------
T.ToggleSlideChatL = function()
	if T.ChatLIn == true then
		for i = 1, NUM_CHAT_WINDOWS do
			local chat = ChatFrame2
			local tab = ChatFrame2Tab
			chat:SetParent(Logbg,5,0)
			tab:SetParent(ChatFrame2)
		end
		T.SlideOut(Logbg)	
		T.ChatLIn = false

	else
		T.SlideIn(Logbg)
		
		T.ChatLIn = true

	end
end

--Bindings For Chat Sliders
function ChatLeft_HotkeyPressed(keystate)
	if keystate == "up" then return end
	if T.ChatLIn == true then
		for i = 1, NUM_CHAT_WINDOWS do
			local chat = ChatFrame2
			local tab = ChatFrame2Tab
			chat:SetParent(Logbg,5,0)
			tab:SetParent(ChatFrame2)
		end
		T.ToggleSlideChatL()
	else
		T.ToggleSlideChatL()
	end		
end


function ChatBoth_HotkeyPressed(keystate)
	if keystate == "up" then return end
	if T.ChatLIn == true then

		T.ToggleSlideChatL()
	else

		T.ToggleSlideChatL()
	end
end

--Fixes chat windows not displaying
Logbg.anim_o:HookScript("OnFinished", function()
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = ChatFrame2
		local tab = ChatFrame2Tab
		local id = chat:GetID()
		local point = GetChatWindowSavedPosition(id)
		local _, _, _, _, _, _, _, _, docked, _ = GetChatWindowInfo(id)
			chat:SetParent(Logbg,5,0)
			tab:SetParent(ChatFrame2)
	end
end)

Logbg.anim_o:HookScript("OnPlay", function()
	if T.ChatLIn == true then
		for i = 1, NUM_CHAT_WINDOWS do
			local chat = ChatFrame2
			local tab = ChatFrame2Tab
			chat:SetParent(Logbg,5,0)
			tab:SetParent(ChatFrame2)
		end		
	end
end)

Logbg.anim:HookScript("OnFinished", function()
	if T.RightChat ~= true then return end
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = ChatFrame2
		local id = chat:GetID()
		local point = GetChatWindowSavedPosition(id)
		local _, _, _, _, _, _, _, _, docked, _ = GetChatWindowInfo(id)
		chat:SetParent(UIParent)
		tab:SetParent(UIParent)

		if i == T.RightChatWindowID then
			chat:SetParent(ChatFrame2Tab)
			tab:SetParent(UIParent)
		else
			chat:SetParent(UIParent)
			tab:SetParent(UIParent)
	
		end
	end
	--ElvuiInfoLeft.shadow:SetBackdropBorderColor(0,0,0,1)
	--ElvuiInfoLeft:SetScript("OnUpdate", function() end)
	--T.StopFlash(ElvuiInfoLeft.shadow)
end)



--Setup Button Scripts
TukuiBarlogButton:SetScript("OnMouseDown", function(self, btn)
	if btn == "LeftButton" then
		if T.ChatLIn == true then
			for i = 1, NUM_CHAT_WINDOWS do
				local chat = ChatFrame2
				local tab = ChatFrame2Tab
				chat:SetParent(Logbg,5,0)
				tab:SetParent(ChatFrame2)
			end
			T.ToggleSlideChatL()
		else
			T.ToggleSlideChatL()
		end	
	else
		if T.ChatLIn == true then
			for i = 1, NUM_CHAT_WINDOWS do
				local chat = ChatFrame2
				local tab = ChatFrame2Tab
				chat:SetParent(Logbg,5,0)
				tab:SetParent(ChatFrame2)
			end
			T.ToggleSlideChatL()
		else
			T.ToggleSlideChatL()
		end		
	end
end)

TukuiBarlogButton:SetScript("OnMouseDown", function(self, btn)
if btn == "LeftButton" then
		if T.ChatLIn == true then
			for i = 1, NUM_CHAT_WINDOWS do
				local chat = ChatFrame2
				local tab = ChatFrame2Tab
				chat:SetParent(Logbg,5,0)
				tab:SetParent(ChatFrame2)
			end
			T.ToggleSlideChatL()

		else
			T.ToggleSlideChatL()
		end	
	else
		if T.ChatLIn == true then
			for i = 1, NUM_CHAT_WINDOWS do
				local chat = ChatFrame2
				local tab = ChatFrame2Tab
				chat:SetParent(Logbg,5,0)
				tab:SetParent(ChatFrame2)
			end
			T.ToggleSlideChatL()
		else
			T.ToggleSlideChatL()
		end		
	end
end)