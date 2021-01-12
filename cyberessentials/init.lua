--UI key, default 0x23 for END
local hotkeyUI = 0x70 --F1

--Start CyberEssentials
dofile("cyberessentials/cyberessentials.lua")
registerForEvent("onInit", function()
    print("[CyberEssentials] : Mod activated Press [F1] to open menu...")
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
		ImGui.SetNextWindowPos(0, 450, ImGuiCond.FirstUseEver)
		ImGui.SetNextWindowSize(265, 175, ImGuiCond.Appearing)

		-- Window Color Scheme
		-- If you add/remove here, remember to set ImGui.PopStyleColor(Int) correctly down towards the bottom of the file if it's being used
		ImGui.PushStyleColor(ImGuiCol.FrameBg, 0.56, 0.06, 0.03, 0.35)
		--ImGui.PushStyleColor(ImGuiCol.WindowBg, 0.56, 0.06, 0.03, 0.35)
		ImGui.PushStyleColor(ImGuiCol.Border, 0.56, 0.06, 0.03, 1)
		ImGui.PushStyleColor(ImGuiCol.TitleBg, 0.56, 0.06, 0.03, 0.5)
		ImGui.PushStyleColor(ImGuiCol.TitleBgActive, 0.56, 0.06, 0.03, 0.75)
		ImGui.PushStyleColor(ImGuiCol.TitleBgCollapsed, 0.56, 0.06, 0.03, 0.25)
		ImGui.PushStyleColor(ImGuiCol.Tab, 1, 0.2, 0.2, 0.5)
		ImGui.PushStyleColor(ImGuiCol.TabHovered, 1, 0.2, 0.2, 0.85)
		ImGui.PushStyleColor(ImGuiCol.TabActive, 1, 0.2, 0.2, 1)
		ImGui.PushStyleColor(ImGuiCol.Button, 0.56, 0.06, 0.03, 0.50)
		ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.56, 0.06, 0.03, 0.75)
		ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.56, 0.06, 0.03, 1)
		ImGui.PushStyleColor(ImGuiCol.ResizeGrip, 0.56, 0.06, 0.03, 0.6)
		ImGui.PushStyleColor(ImGuiCol.ResizeGripHovered, 0.56, 0.06, 0.03, 0.75)
		ImGui.PushStyleColor(ImGuiCol.ResizeGripActive, 0.56, 0.06, 0.03, 1)
		
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
		ImGui.PopStyleColor(14) --Contains the PushStyleColors above to this menu's Window. Remove this line to push this color scheme to all windows
        ImGui.End()
    end
end)
