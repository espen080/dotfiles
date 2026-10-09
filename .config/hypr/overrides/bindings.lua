-- Override default keybinds. Load after config.binds.
local mainMod = "SUPER"
local left = "H"
local down = "J"
local up = "K"
local right = "L"

-- Closing applications
hl.unbind(mainMod .. " + W")
hl.unbind(mainMod .. " + Q")
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Remove bindings that conflict with Vim navigation.
hl.unbind(mainMod .. " + J")
hl.unbind(mainMod .. " + L")
hl.unbind(mainMod .. " + K")

-- Remove default arrow-key navigation.
for _, key in ipairs({ "Left", "Right", "Up", "Down" }) do
    hl.unbind(mainMod .. " + " .. key)
    hl.unbind(mainMod .. " + SHIFT + " .. key)
end

-- Move focus with Super + Vim keys.
hl.bind(mainMod .. " + " .. left,  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. right, hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. up,    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. down,  hl.dsp.focus({ direction = "down" }))

-- Swap the active window with its neighbor.
hl.bind(mainMod .. " + SHIFT + " .. left,  hl.dsp.window.swap({ target = "l" }))
hl.bind(mainMod .. " + SHIFT + " .. right, hl.dsp.window.swap({ target = "r" }))
hl.bind(mainMod .. " + SHIFT + " .. up,    hl.dsp.window.swap({ target = "u" }))
hl.bind(mainMod .. " + SHIFT + " .. down,  hl.dsp.window.swap({ target = "d" }))

-- Resize the active window horizontally by 100 pixels.
hl.unbind(mainMod .. " + minus")
hl.unbind(mainMod .. " + equal")
hl.unbind(mainMod .. " + SHIFT + minus")
hl.unbind(mainMod .. " + SHIFT + equal")
hl.bind(mainMod .. " + ALT + " .. left,  hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + " .. right, hl.dsp.window.resize({ x = 100, y = 0, relative = true }))

-- Unused application shortcuts
hl.unbind(mainMod .. " + SHIFT + G")       -- Signal
hl.unbind(mainMod .. " + SHIFT + O")       -- Obsidian
hl.unbind(mainMod .. " + SHIFT + ALT + G") -- WhatsApp / Google Messages
hl.unbind(mainMod .. " + SHIFT + slash")   -- Passwords
hl.unbind(mainMod .. " + SHIFT + C")       -- Calendar
hl.unbind(mainMod .. " + SHIFT + E")       -- Email
hl.unbind(mainMod .. " + SHIFT + X")       -- X
hl.unbind(mainMod .. " + SHIFT + ALT + X") -- X Post

-- Leave the AI shortcut unbound.
hl.unbind(mainMod .. " + SHIFT + A")
