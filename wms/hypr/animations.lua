--
-- ------------
-- -- Curves --
-- ------------
--
-- -- ==== Curves | Bezier ====
--
-- hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
-- hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
-- hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
-- hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
-- hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
-- hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
-- hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
-- hl.curve("menu_decel", { type = "bezier", points = { { 0.2, 1 }, { 0, 1 } } })
-- hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })
-- hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
-- hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
-- hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
-- hl.curve("md2", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } }) -- use with .2s duration
--
-- ---- ==== Default Curves ====
--
-- --hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
--
-- --hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
--
-- --hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
--
-- --hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
--
-- ---- ==== Default springs ====
--
-- --hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
--
-- ----------------
--
-- -- Animations --
--
-- ----------------
--
-- -- ==== Window Animations ====
--
-- hl.animation({ leaf = "windows", enabled = true, speed = 1, 3, bezier = "md3_decel", style = "popin 60%" })
--
-- hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, 3, bezier = "md3_decel", style = "popin 60%" })
--
-- hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, 3, bezier = "md3_decel", style = "popin 60%" })
--
-- hl.animation({ leaf = "border", enabled = true, speed = 1, 10, bezier = "default" })
--
-- hl.animation({ leaf = "fade", enabled = true, speed = 1, 3, bezier = "md3_decel" })
--
-- hl.animation({ leaf = "layers", enabled = true, speed = 1, 2, bezier = "md3_decel", style = "slide" })
--
-- hl.animation({ leaf = "layersIn", enabled = true, speed = 1, 3, bezier = "menu_decel", style = "slide" })
--
-- hl.animation({ leaf = "layersOut", enabled = true, speed = 1, 1.6, bezier = "menu_accel", style = "slide" })
--
-- hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1, 2, bezier = "menu_decel" })
--
-- hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1, 4.5, bezier = "menu_accel" })
--
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 1, 7, bezier = "menu_decel", style = "slide" })
--
-- --hl.animation({ leaf = "workspaces",       enabled = true,  speed = 1, 2.5, bezier = "softAcDecel", style = "slide" })
--
-- --hl.animation({ leaf = "workspaces",       enabled = true,  speed = 1, 7,   bezier = "menu\_decel",  style = "slidefade 15%" })
--
-- --hl.animation({ leaf = "specialWorkspace", enabled = true,  speed = 1, 3,   bezier = "md3\_decel",   style = "slidefadevert 15%" })
--
-- hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1, 3, bezier = "md3_decel", style = "slidevert" })
--
-- ---- == Default Animations ==
--
-- --hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
--
-- --hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
--
-- --hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
--
-- --hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
--
-- --hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
--
-- --hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
--
-- --hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
--
-- --hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
--
-- --hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
--
-- --hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
--
-- --hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
--
-- --hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
--
-- --hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
--
-- --hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
--
-- --hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
--
-- --hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
--
-- --hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
-- -- Example per-device config
-- -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- -- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- yanked from
-- https://github.com/HyDE-Project/HyDE/tree/master/Configs/.local/share/hypr/lua/animations
local prod = function(ds)
    return ds * 0.3
end
hl.curve("macOpen", {type = "spring", mass = 1, stiffness = 110, dampening = 16})
hl.curve("macBounce", {type = "spring", mass = 1, stiffness = 80, dampening = 10})
hl.curve("macSmooth", {type = "bezier", points = {{0.25, 0.1}, {0.25, 1.0}}})
hl.animation({leaf = "fadeIn", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeOut", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeSwitch", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeShadow", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeDim", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeLayers", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeLayersIn", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeLayersOut", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadePopups", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadePopupsIn", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadePopupsOut", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "fadeDpms", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "windows", enabled = true, speed = prod(8), spring = "macOpen", style = "popin 90%"})
hl.animation({leaf = "windowsIn", enabled = true, speed = prod(8), spring = "macOpen", style = "popin 90%"})
hl.animation({leaf = "windowsOut", enabled = true, speed = prod(7), spring = "macBounce", style = "popin 90%"})
hl.animation({leaf = "windowsMove", enabled = true, speed = prod(5), bezier = "macSmooth", style = "slide"})
hl.animation({leaf = "border", enabled = true, speed = prod(1), bezier = "default"})
hl.animation({leaf = "borderangle", enabled = true, speed = prod(30), bezier = "default", style = "once"})
hl.animation({leaf = "fade", enabled = true, speed = prod(8), bezier = "default"})
hl.animation({leaf = "workspaces", enabled = true, speed = prod(6), bezier = "macSmooth", style = "slidefade 20%"})
hl.animation({leaf = "workspacesIn", enabled = true, speed = prod(6), bezier = "macSmooth", style = "slidefade 20%"})
hl.animation({leaf = "workspacesOut", enabled = true, speed = prod(6), bezier = "macSmooth", style = "slidefade 20%"})
hl.animation({leaf = "specialWorkspace", enabled = true, speed = prod(6), bezier = "macSmooth", style = "slidefade 20%"})
hl.animation({leaf = "specialWorkspaceIn", enabled = true, speed = prod(6), bezier = "macSmooth", style = "slidefade 20%"})
hl.animation({leaf = "specialWorkspaceOut", enabled = true, speed = prod(6), bezier = "macSmooth", style = "slidefade 20%"})
hl.animation({leaf = "zoomFactor", enabled = true, speed = prod(7), bezier = "default"})
hl.animation({leaf = "monitorAdded", enabled = true, speed = prod(7), bezier = "default"})
