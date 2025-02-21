from libqtile.config import Click, Drag, DropDown, Group, Key, Match, ScratchPad, Screen
groups = [Group(i) for i in "123qweas"]
groups[0].label = " "
groups[1].label = " "
groups[2].label = "󱠏 "
groups[3].label = "󰙯 "
groups[4].label = "󱓧 "
groups[5].label = " "
groups[6].label = "󰑋 "
groups[7].label = " "

def dd(name,process):
    DropDown(name,process,width=0.4,x=0.3,y=0.2)
    return 

groups.append(ScratchPad('s', [
    DropDown('mp', 'kitty ncmpcpp',width=0.5,height=0.6,x=0.25,y=0.2),
    DropDown('vol', 'kitty pulsemixer',width=0.5,height=0.6,x=0.25,y=0.2),
    DropDown('t', 'kitty',width=0.5,height=0.6,x=0.25,y=0.2),
    # DropDown('mp', 'kitty ncmpcpp',width=0.4,x=0.3,y=0.2),
]))


