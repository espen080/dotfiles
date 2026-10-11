-- Disable the HDMI display by default when Hyprland starts.
hl.on("hyprland.start", function()
	hl.exec_cmd("monitors main")
end)
