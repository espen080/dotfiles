-- Override default keybinds. Load after config.binds.
local mainMod = "SUPER"
local left = "H"
local down = "J"
local up = "K"
local right = "L"
local launchPrefix = "uwsm app -- "

-- Select workspaces 1-10 with Super + number-row keys (0 selects 10).
-- Add Shift to move the active window and follow it to that workspace.
-- Physical keycodes keep these bindings working on AZERTY layouts.
for i = 1, 10 do
	local key = "code:" .. (i == 10 and 19 or (9 + i))
	hl.unbind(mainMod .. " + " .. key)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.unbind(mainMod .. " + SHIFT + " .. key)
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- Application shortcuts.
-- Replace the default window-kill action with Noctalia's session menu.
hl.unbind(mainMod .. " + Escape")
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))
hl.unbind(mainMod .. " + SHIFT + S")
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e sbx tui"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e lazydocker"))

-- Remove the default browser shortcut.
hl.unbind(mainMod .. " + W")

-- Remove bindings that conflict with Vim navigation.
hl.unbind(mainMod .. " + J")
hl.unbind(mainMod .. " + L")

-- Remove default arrow-key navigation.
for _, key in ipairs({ "Left", "Right", "Up", "Down" }) do
	hl.unbind(mainMod .. " + " .. key)
	hl.unbind(mainMod .. " + SHIFT + " .. key)
end

-- Move focus with Super + Vim keys.
hl.bind(mainMod .. " + " .. left, hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. right, hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. up, hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. down, hl.dsp.focus({ direction = "down" }))

-- Swap the active window with its neighbor.
hl.bind(mainMod .. " + SHIFT + " .. left, hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + " .. right, hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + " .. up, hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + " .. down, hl.dsp.window.swap({ direction = "d" }))

-- Swap split sides; focus the full-height window to move it left or right.
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.layout("swapsplit"))

-- Toggle the focused split between horizontal and vertical.
hl.bind(mainMod .. " + CONTROL + Space", hl.dsp.layout("togglesplit"))

-- Resize the active window horizontally by 100 pixels.
hl.unbind(mainMod .. " + Minus")
hl.unbind(mainMod .. " + Plus")
hl.bind(mainMod .. " + ALT + " .. up, hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
hl.bind(mainMod .. " + ALT + " .. left, hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + " .. right, hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + " .. down, hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
