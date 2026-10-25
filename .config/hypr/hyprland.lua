hl.monitor({
    output = "desc:LG Electronics 27GL850 908NTBKCE373",
    mode = "highres",
    position = "0x0",
    scale = "1",
    bitdepth = 10,
    transform = 0,
})


-- Some default env vars.
hl.env("XCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("MOZ_WEBRENDER", "1")
hl.env("MOZ_ACCELERATED", "1")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
--env = WLR_DRM_NO_ATOMIC,1 # For tearing

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

hl.window_rule({
    name = "windowrule-1",
    match = {
        class = "^(steam_app_\\d+)$",
    },
    workspace = "9 silent",
    suppress_event = "activatefocus",
})

hl.window_rule({
    name = "windowrule-2",
    match = {
        class = "^(steam_app_\\d+)$",
        title = "(Wine System Tray)",
    },
    -- Send game tray icon window to purgatory (solve some focus issue with the tray window)
    workspace = "99",
})

hl.window_rule({
    name = "windowrule-3",
    match = {
        title = "(ptsengine)",
    },
    float = true,
})

hl.workspace_rule({
    workspace = "w[tv1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "f[1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.window_rule({
    name = "windowrule-4",
    match = {
        float = 0,
        workspace = "w[tv1]",
    },
    border_size = 0,
    rounding = 0,
})

hl.window_rule({
    name = "windowrule-5",
    match = {
        float = 0,
        workspace = "f[1]",
    },
    border_size = 0,
    rounding = 0,
})

hl.window_rule({
    name = "windowrule-6",
    match = {
        title = "^(Picture-in-Picture|Firefox)$",
    },
    float = true,
    keep_aspect_ratio = true,
    size = "800 450",
    pin = true,
})

local mainMod = "ALT"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill fuzzel || fuzzel"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill fuzzel || hyprctl clients -j | jq -r '.[] | .workspace.name + \"\\t\" + .title + \"\\t\" + .address' | sort | fuzzel -d | cut -f 3 | xargs -r -I {} hyprctl dispatch focuswindow address:{}"))
hl.bind(mainMod .. " + T", hl.dsp.window.pin())
hl.bind(mainMod .. " + Y", hl.dsp.window.pin())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("pkill waybar || waybar"))

hl.bind(mainMod .. " + COMMA", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "l" })) end)
hl.bind(mainMod .. " + PERIOD", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "r" })) end)

hl.bind(mainMod .. " + SHIFT + N", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.group.prev())

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("h", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("l", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("ALT + R", hl.dsp.submap("reset"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

--hl.bind(mainMode .. " + P", hl.dsp.submap("passthrough"))
--hl.define_submap("passthrough", function()
--    hl.bind("escape", hl.dsp.submap("reset"))
--    hl.bind(mainMode .. " + P", hl.dsp.submap("reset"))
--end)

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("~/.config/hypr/gamemode.sh"))
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "intl",
        kb_model = "",
        kb_options = "caps:escape",
        kb_rules = "",
        repeat_delay = 300,
        repeat_rate = 25,
        follow_mouse = 0, -- 2 = Click on window to get kb focus
        mouse_refocus = false,
        touchpad = {
            natural_scroll = false,
        },
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },
    general = {
        -- See https://wiki.hyprland.org/Configuring/Variables/ for more
        gaps_in = 5,
        gaps_out = 7,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
        allow_tearing = false,
        snap = {
            enabled = true,
        },
    },
    decoration = {
        -- See https://wiki.hyprland.org/Configuring/Variables/ for more
        rounding = 10,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },
    group = {
        col = {
            border_active = { colors = { "rgba(90ceaaff)", "rgba(ecd3a0ff)" }, angle = 45 },
            border_inactive = { colors = { "rgba(86aaeccc)", "rgba(93cee9cc)" }, angle = 45 },
            border_locked_active = { colors = { "rgba(90ceaaff)", "rgba(ecd3a0ff)" }, angle = 45 },
            border_locked_inactive = { colors = { "rgba(86aaeccc)", "rgba(93cee9cc)" }, angle = 45 },
        },
        groupbar = {
            render_titles = true,
            gradients = true,
            col = {
                active = { colors = { "rgba(90ceaaff)", "rgba(ecd3a0ff)" }, angle = 45 },
                inactive = { colors = { "rgba(86aaecff)", "rgba(93cee9ff)" }, angle = 45 },
            },
            text_color = "rgba(000000ff)",
            font_size = 11,
        },
    },
    animations = {
        enabled = false,
        -- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    },
    dwindle = {
        -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        --pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- you probably want this
    },
    master = {
        -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        --new_is_master = true
    },
    misc = {
        mouse_move_focuses_monitor = false,
        vrr = 1,
        focus_on_activate = false,
        -- no_direct_scanout = false
    },
    cursor = {
        no_hardware_cursors = 2, -- auto: disabled on nvidia
        no_warps = true,
    },
    -- See https://wiki.hyprland.org/Configuring/Keywords/ for more
    -- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    --bind = $mainMod, E, togglesplit, # dwindle
    -- Switch to a tab in a group with N or P
    -- Move focus with mainMod + arrow keys
    -- Move focus with mainMod + arrow keys
    -- Switch workspaces with mainMod + [0-9]
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    -- Scroll through existing workspaces with mainMod + scroll
    --bind = $mainMod, mouse_down, workspace, e+1
    --bind = $mainMod, mouse_up, workspace, e-1
    -- Move/resize windows with mainMod + LMB/RMB and dragging
    -- resize submap
    -- passthrough submap
    -- Screenshot a window
    -- Screenshot a monitor
    -- Screenshot a region
})

hl.on("hyprland.start", function()
    hl.exec_cmd("$HOME/.config/waybar/launch-waybar.sh & $HOME/scripts/wayland_bg.sh & firefox")
    hl.exec_cmd("swaync exec-once = /usr/bin/gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("xrandr --output $(xrandr --listactivemonitors | grep 2560 | awk '{print $4}') --primary")
end)


