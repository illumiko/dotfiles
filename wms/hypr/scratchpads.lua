local altmod = "ALT"
hl.workspace_rule({workspace="7",monitor=desktop,decorate=false});
local scratchpads = { "terminal", "emacs", "ymuse", "pulsemixer", "music","neovide" }
for _, value in ipairs(scratchpads) do
	hl.workspace_rule({ workspace = "special:" .. value, gaps_out = 80, gaps_in = 40 })
end

hl.on("hyprland.start", function()
    hl.exec_cmd("kitty pulsemixer", { workspace = "special:pulsemixer" })
    hl.exec_cmd("kitty ncmpcpp", { workspace = "special:music" })
    hl.exec_cmd("ymuse", { workspace = "special:ymuse" })
    hl.exec_cmd("kitty", { workspace = "special:terminal" })
    hl.exec_cmd("emacs", { workspace = "special:emacs" })
    hl.exec_cmd("neovide", { workspace = "special:neovide" })
end
)
hl.bind(altmod .. " + q", hl.dsp.workspace.toggle_special("music"))
hl.bind(altmod .. " + w", hl.dsp.workspace.toggle_special("pulsemixer"))
hl.bind(altmod .. " + e", hl.dsp.workspace.toggle_special("terminal"))
hl.bind(altmod .. " + a", hl.dsp.workspace.toggle_special("emacs"))
hl.bind(altmod .. " + s", hl.dsp.workspace.toggle_special("neovide"))
