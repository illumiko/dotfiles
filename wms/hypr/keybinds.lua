local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local altmod = "ALT"

local terminal = "kitty"
local desktop = "HDMI-A-1"
local laptop = "eDP-1"
local closeWindowBind = hl.bind(mainMod .. " + x", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. "+ SHIFT +l", hl.dsp.exec_cmd("hyprlock"))
hl.bind(
	mainMod .. "+ M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(mainMod .. "+ c", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy -t image/png'))
hl.bind(
	mainMod .. "+ SHIFT +c",
	hl.dsp.exec_cmd(
		'grim -g "$(slurp)" ~/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png ; notify-send "screenshot saved" -t 1000'
	)
)
-- hl.bind(
-- 	mainMod .. "+ ctrl + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("bash $HOME/dotfiles/wms/hypr/scripts/rofi_run.sh"))
hl.bind(mainMod .. " + code:36", hl.dsp.exec_cmd(terminal))
-- hl.bind(mainMod .. "+ SHIFT + C", hl.dsp.exec_cmd("~/dotfiles/hypr/scripts/screenshot selection"))
hl.bind(mainMod .. "+ TAB", hl.dsp.exec_cmd("rofi -show recursivebrowser"))
-- hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
local maps = { "1", "2", "3", "q", "w", "e", "a", "s" }
for i, key in ipairs(maps) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "+ V", hl.dsp.window.float())

hl.bind(mainMod .. " + z", function()
	local mons = hl.get_monitors()

	local names = {}
	for i, v in ipairs(mons) do
		if i <= 2 then
			names["monitor" .. i] = v.name
		end
	end

	hl.dispatch(hl.dsp.workspace.swap_monitors(names))
end)
-- hl.bind(mainMod .. "+ z", hl.dsp.workspace.swap_monitors({ monitor1 = laptop, monitor2= desktop }))
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")

-- Example special workspace (scratchpad)
-- hl.bind(altmod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(altmod .. " + 1", hl.dsp.workspace.toggle_special("music"))
hl.bind(altmod .. " + 2", hl.dsp.workspace.toggle_special("pulsemixer"))
hl.bind(altmod .. " + 3", hl.dsp.workspace.toggle_special("terminal"))
hl.bind(altmod .. " + q", hl.dsp.workspace.toggle_special("emacs"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- submap
hl.bind("ALT + f", hl.dsp.submap("system"))

-- Start a submap called "resize".
hl.define_submap("system", function()
	hl.bind("d", hl.dsp.exec_cmd("brightnessctl s +10%"))
	hl.bind("a", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })
	hl.bind("w", hl.dsp.exec_cmd("ddcutil setvcp 10 + 10"), { repeating = true })
	hl.bind("s", hl.dsp.exec_cmd("ddcutil setvcp 10 - 10"), { repeating = true })
	hl.bind("q", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
	hl.bind("e", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
	-- Set repeating binds for resizing the active window.
	-- hl.bind("d", hl.dsp.exec_cmd("kitty"), { repeating = true })
	-- hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	-- hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	-- hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)
