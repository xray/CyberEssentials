
--UI key, default 0x72 for F3
local hotkeyUI = 0x72 

--Start CyberEssentials
dofile("cyberessentials/cyberessentials.lua")
registerForEvent("onInit", function()
    print("[CyberEssentials] : Mod activated Press [F3] to open menu...")
end)
registerForEvent("onUpdate", function(deltaTime)
	--UIToggle
	if (ImGui.IsKeyPressed(hotkeyUI, false)) then
		showUI = not showUI
	end
end)

--------
-- UI --
--------
registerForEvent("onDraw", function()
	if (showUI) then
		--Window Sizing
		ImGui.SetNextWindowPos(0, 455, ImGuiCond.FirstUseEver)
		ImGui.SetNextWindowSize(270, 170, ImGuiCond.Appearing)
		
		if (ImGui.Begin("[CyberEssentials]:")) then
            
            --Button Sizes
			local buttonHeight1 = 19
			local buttonHeight2 = 30
			local buttonWidth1 = 120
			local buttonWidth2 = 159
			local buttonWidth3 = 248
			local buttonWidth4 = 492
			
			if (ImGui.BeginTabBar("CETabs")) then
			
				

                    --CyberEssentials GUI Buttons
                if (ImGui.BeginTabItem("CyberEssentials")) then
                    ImGui.Spacing()
					ImGui.Text("CyberEssentials Usage")
					ImGui.Spacing()
					ImGui.PushItemWidth(250)
					if(ImGui.Button("List Warps", buttonWidth1, buttonHeight1)) then
						ListWarps()
					end
					ImGui.SameLine()
					if (ImGui.Button("Where Am I?", buttonWidth1, buttonHeight1)) then
						WhereAmI()
					end
					if(ImGui.Button("Add Warp", buttonWidth1, buttonHeight1)) then
						HelpAdd()
					end
					ImGui.SameLine()
					if(ImGui.Button("Remove Warp", buttonWidth1, buttonHeight1)) then
						HelpRemove()
					end
					if(ImGui.Button("CyberEssentials Commands List", buttonWidth3, buttonHeight2)) then
						Help()
					end
				ImGui.EndTabItem()
                end
            ImGui.EndTabBar()    
            end    
        end
        ImGui.End()
    end
end)
