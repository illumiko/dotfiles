local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local altmod = "ALT"
local terminal = "kitty"
local desktop = "HDMI-A-1"
local laptop = "eDP-1"
local closeWindowBind = hl.bind(mainMod .. " + x", hl.dsp.window.close())


-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. "+ u", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. "+ SHIFT +p", hl.dsp.exec_cmd("hyprpicker | awk '{print $1}' | wl-copy"))
hl.bind(mainMod .. "+ SHIFT +l", hl.dsp.exec_cmd("hyprlock"))
hl.bind(
	mainMod .. "+ 0",
	hl.dsp.exec_cmd(
		" rofi -modi clipboard:$HOME/dotfiles/wms/rofi/scripts/clipmanager_withimg -show clipboard -show-icons -theme mytheme -no-lazy-grab"
	)
)
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
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- local maps = { "1", "2", "3", "q", "w", "e", "a", "s" }
local maps = { "q", "w", "e", "r", "t", "a", "s" }
for i, key in ipairs(maps) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "+ V", hl.dsp.window.float())
hl.bind(mainMod .. "+ p", hl.dsp.window.pin())

hl.bind(mainMod .. " + z", hl.dsp.focus({ workspace = "previous", on_current_monitor = true }))
-- hl.bind(mainMod .. " + z", function()
-- 	local mons = hl.get_monitors()
--
-- 	local names = {}
-- 	for i, v in ipairs(mons) do
-- 		if i <= 2 then
-- 			names["monitor" .. i] = v.name
-- 		end
-- 	end
--
-- 	hl.dispatch(hl.dsp.workspace.swap_monitors(names))
-- end)
-- hl.bind(mainMod .. "+ z", hl.dsp.workspace.swap_monitors({ monitor1 = laptop, monitor2= desktop }))
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")
-- hl.bind(mainMod .. "+")

-- Example special workspace (scratchpad)
-- hl.bind(altmod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(altmod .. " + q", hl.dsp.workspace.toggle_special("music"))
hl.bind(altmod .. " + w", hl.dsp.workspace.toggle_special("pulsemixer"))
hl.bind(altmod .. " + e", hl.dsp.workspace.toggle_special("terminal"))
hl.bind(altmod .. " + a", hl.dsp.workspace.toggle_special("emacs"))

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
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Start a submap called "resize".
hl.bind("ALT + t", hl.dsp.submap("timer"))
hl.define_submap("timer", function()
	-- hl.bind("1", hl.dsp.exec_cmd([[echo "pause" > /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd && sleep 1 && echo "pause" > /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd]]))
	hl.bind("1", hl.dsp.exec_cmd([[echo "pause" >> /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd]]))
	hl.bind("1", hl.dsp.submap("reset"))
	-- hl.bind("2", hl.dsp.exec_cmd([[echo "55" > /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd && sleep 1 && echo "55" > /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd]]))
	hl.bind("2", hl.dsp.exec_cmd([[echo "55" >> /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd]]))
	hl.bind("2", hl.dsp.submap("reset"))
	-- hl.bind("3", hl.dsp.exec_cmd([[echo "25" >> /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd && sleep 1 && echo "25" >> /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd]]))
	hl.bind("3", hl.dsp.exec_cmd([[echo "20" >> /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd]]))
	hl.bind("3", hl.dsp.submap("reset"))

	hl.bind("4", hl.dsp.exec_cmd([[echo "10" >> /home/illumiko/dotfiles/wms/waybar/scripts/go_timer/cmd]]))
	hl.bind("4", hl.dsp.submap("reset"))
	-- Set repeating binds for resizing the active window.
	-- hl.bind("d", hl.dsp.exec_cmd("kitty"), { repeating = true })
	-- hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	-- hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	-- hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- this whole thing works and well its simple.
-- a better solution to this is: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Uncommon-tips-and-tricks/#per-layout-bindings
local function layout_bind(bind_table)
    return function ()
        local workspace = hl.get_active_workspace() or hl.get_active_special_workspace()
        if not workspace then
            return
        end
        local layout = workspace.tiled_layout
        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end

end
hl.bind(mainMod .. " + h ", layout_bind({
    monocle = hl.dsp.layout("cyclenext"),
    dwindle = hl.dsp.focus({ direction = "left" }),
    scrolling = hl.dsp.focus({ direction = "left" }),
    master = hl.dsp.focus({ direction = "left" }),
}))

hl.bind(mainMod .. " + l ", layout_bind({
    monocle = hl.dsp.layout("cycleprev"),
    dwindle = hl.dsp.focus({ direction = "right" }),
    scrolling = hl.dsp.focus({ direction = "right" }),
    master = hl.dsp.focus({ direction = "right" }),
}))
hl.bind(mainMod .. " + k ", layout_bind({
    monocle = hl.dsp.focus({ direction = "up" }),
    dwindle = hl.dsp.focus({ direction = "up" }),
    scrolling = hl.dsp.focus({ direction = "up" }),
    master = hl.dsp.focus({ direction = "up" }),
}))
hl.bind(mainMod .. " + j ", layout_bind({
    monocle = hl.dsp.focus({ direction = "down" }),
    dwindle = hl.dsp.focus({ direction = "down" }),
    scrolling = hl.dsp.focus({ direction = "down" }),
    master = hl.dsp.focus({ direction = "down" }),
}))
hl.bind(mainMod .. "+SHIFT + j ", layout_bind({
    scrolling = hl.dsp.layout("consume_or_expel prev"),
    master = hl.dsp.layout("swapwithmaster master"),
}))
hl.bind(mainMod .. "+ semicolon", layout_bind({
    scrolling = hl.dsp.layout("colresize -0.200"),
    -- master = hl.dsp.layout("swapwithmaster master"),
}))
hl.bind(mainMod .. "+ apostrophe", layout_bind({
    scrolling = hl.dsp.layout("colresize +0.200"),
    -- master = hl.dsp.layout("swapwithmaster master"),
}))
hl.bind(mainMod .. " + b", function()
	local ws = hl.get_active_workspace()
	local layouts = { "dwindle", "master", "monocle", "scrolling" }
	local current = ws.tiled_layout
	ws = hl.get_active_workspace()
	if not ws then
		return
	end
	current = ws.tiled_layout
	local next_layout = layouts[1]
	for i, name in ipairs(layouts) do
		if current == name then
			next_layout = layouts[(i % #layouts) + 1]
	        hl.workspace_rule({ workspace = ws.id, layout = next_layout })
			break
		end
	end
	current = next_layout
	-- hl.config({ general = { layout = layouts[0] } })
	hl.dispatch(hl.dsp.exec_cmd("notify-send -t 2000 'Layout: " .. next_layout .. "'"))
	hl.workspace_rule({ workspace = ws.id, layout = next_layout })

end)
-- hl.on("workspace.active", function(w)
--     hl.notification.create({text=w.tiled_layout,timeout=1000})
--     local current = w.tiled_layout
--     set_navbinds(current)
-- 	-- hl.dispatch(hl.dsp.exec_cmd("notify-send -t 1000 'Layout: " .. current .. "'"))
-- end)
-- local layouts = { "dwindle", "master", "scrolling", "monocle" }
-- hl.bind(mainMod .. " + b", function()
-- 	local current = hl.get_config("general.layout")
-- 	for i, name in ipairs(layouts) do
-- 		if current == name then
-- 			local next_layout = layouts[(i % #layouts) + 1]
-- 			hl.config({ general = { layout = next_layout } })
-- 			hl.dispatch(hl.dsp.exec_cmd("notify-send -t 2000 'Layout: " .. next_layout .. "'"))
-- 			return
-- 		end
-- 	end
-- 	hl.config({ general = { layout = layouts[1] } })
-- 	hl.dispatch(hl.dsp.exec_cmd("notify-send -t 2000 'Layout: " .. layouts[1] .. "'"))
-- end)
