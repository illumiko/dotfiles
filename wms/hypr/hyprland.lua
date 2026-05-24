require("autostart")
require("keybinds")
require("animations")

local desktop = "HDMI-A-1"
local laptop = "eDP-1"

hl.monitor({
	output = laptop,
	mode = "1920x1080",
	position = "0x1080",
	scale = 1,
})
hl.monitor({
	output = desktop,
	mode = "1920x1080",
	position = "0x0",
	scale = 1,
})

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "scrolling",
	},

	decoration = {
		dim_inactive = true,
		-- inactive_opacity = 0.8,
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.config({
	scrolling = { column_width = 0.9 },
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		repeat_delay = 450,
		repeat_rate = 30,
		follow_mouse = 2,
		mouse_refocus = false,
		accel_profile = "adaptive",

		sensitivity = 0.4, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
			-- gnome like touchpad goodness
			clickfinger_behavior = true,
		},
	},
})
hl.gesture({
	workspace_swipe_distace = 100,
	fingers = 3,
	direction = "vertical",
	action = "workspace",
})
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })
hl.gesture({
	workspace_swipe_distace = 100,

	fingers = 3,
	direction = "horizontal",
	action = "scroll_move",
	-- action = function()
	-- 	hl.focus({ direction = "left" })
	-- 	hl.notification.create({ text = "I just swiped on my trackpad!", duration = 5000, icon = "ok" })
	-- end,
})
