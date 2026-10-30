require("autostart")
require("keybinds")
-- require("animations")
require("events")
require("scratchpads")
local desktop = "HDMI-A-1"
local laptop = "eDP-1"

local positions = { left = "-1920x0", right = "1920x0", bottom = "0x1080" , top = "0x-1080"}
local modes={vertical = "1920x0",}

hl.monitor({
	output = laptop,
	-- mode = "1920x1200",
	position = "0x0",
	scale = 1,
})
hl.monitor({
    -- transform = 3,
	output = desktop,
	-- mode = modes.vertical,
	position = "auto-up",
	scale = 1,
})

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 0,

		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			active_border = {colors={"rgba(255,0,0,1)"}},
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
        dim_special = 0.8,
		-- inactive_opacity = 0.8,
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 5,
			vibrancy = 0.1696,
		},
	},

	animations = {
        -- workspace_wraparound = true,
		-- enabled = true,
	},
})

hl.config({
	scrolling = { column_width = 0.9 },
	input = {
		kb_layout = "us",
		-- kb_variant = "",
		-- kb_model = "",
		-- kb_options = "",
		-- kb_rules = "",

		repeat_delay = 450,
		repeat_rate = 30,
		follow_mouse = 2,
		mouse_refocus = false,
		-- accel_profile = "flat",

		sensitivity = 0.5,

		touchpad = {
            scroll_factor = 0.3,
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
hl.window_rule({
    name="Netbeans with TMC",
    match = {
        class="Netbeans with TMC",
        float = true,
    },
    center = true,
})
hl.window_rule({
    name="termite",
    match = {
        class="Termite",
    },
    float = true,
    no_dim=true,
})
hl.window_rule({
    name="^Arduino.*",
    match = {
        class="GtkMenuBar",
    },
    no_dim = true,
    decorate = false,
    dim_around = false,
    no_shadow = true,
    no_blur = true,
})
hl.window_rule({
    name="better picker",
    match = {
        class = "^(hyprland-share-picker)$"
    },
    size = "300 400",
    float = true,
    center = true,
})
hl.window_rule({
    name="codeblocks",
    match = {
        class="codeblocks",
    },
    no_dim = true,
})
