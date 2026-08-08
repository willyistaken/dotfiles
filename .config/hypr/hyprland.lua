-- Hyprland config (Lua), migrated from hyprland.conf for Hyprland 0.55+.
-- Docs: https://wiki.hypr.land/Configuring/Start/
-- If hyprland.lua exists it is loaded INSTEAD of hyprland.conf, so the old
-- .conf is kept as a backup. To revert: remove/rename this file.


------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "eDP-1", mode = "2256x1504@60",    position = "0x1080", scale = 1.6 })
hl.monitor({ output = "DP-3",  mode = "1920x1080@74.97", position = "168x0",  scale = 1 })
-- Fallback rule for any other monitor (old "monitor=,highres,auto,1")
hl.monitor({ output = "", mode = "highres", position = "auto", scale = 1 })


---------------------
---- MY PROGRAMS ----
---------------------
local terminal    = "alacritty"
local fileManager = "thunar"
local menu        = "~/dotfiles/scripts/tofimain.sh"
local browser     = "firefox"


-------------------
---- AUTOSTART ----
-------------------
-- exec-once: run once at startup
hl.on("hyprland.start", function()
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("~/dotfiles/scripts/random_wallpaper.sh")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("chmod +777 -R /var/lib/iwd")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("rquickshare")
end)

-- exec (re-runs on every config load). NOTE: "YOUR_DARK_GTK3_THEME" is the
-- unchanged placeholder from the default config - replace it with a real GTK
-- theme name if you want this to do anything.
hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "YOUR_DARK_GTK3_THEME"') -- for GTK3 apps
hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')       -- for GTK4 apps


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") -- for Qt apps

-- Wayland and screensharing environment
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")


-----------------------
---- LOOK AND FEEL ----
-----------------------
-- See https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 0,

        border_size = 0,

        -- Resize windows by dragging borders/gaps
        resize_on_border = false,
        -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 5,

        -- Window transparency
        active_opacity   = 1,
        inactive_opacity = 1,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a, -- old rgba(1a1a1aee)
        },

        blur = {
            enabled  = true,
            size     = 5,
            passes   = 1,
            vibrancy = 0.1696,
            -- NOTE: old "ignorealpha = 0.1" was dropped - there is no global
            -- decoration.blur.ignore_alpha in 0.55 (it's a per-layer/window
            -- rule). Including unknown keys would error the whole config.
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true, -- You probably want this
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper  = 0,    -- 0/1 disables the anime mascot wallpapers
        disable_splash_rendering = true,
        disable_hyprland_logo    = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})


--------------------
---- ANIMATIONS ----
--------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default", style = "slidevert" })


---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:swapescape",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 4, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 4, direction = "right",    action = function() hl.exec_cmd(terminal) end })
hl.gesture({ fingers = 4, direction = "left",     action = function() hl.exec_cmd(browser) end })

-- Example per-device config (no active settings - left as a reference)
-- hl.device({ name = "razer-razer-atheris---mobile-gaming-mouse-1", sensitivity = -1 })


---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER" -- "Windows" key as main modifier

hl.bind("ALT + P",               hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + T",       hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("~/dotfiles/scripts/killapp.sh"))
hl.bind(mainMod .. " + Q",       hl.dsp.window.close())
hl.bind(mainMod .. " + M",       hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + F",       hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",       hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + B",       hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + I",       hl.dsp.exec_cmd("killall waybar || waybar"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("cliphist list | tofi | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker | wl-copy"))

-- Move focus with mainMod + HJKL
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move the active window with mainMod + arrows
hl.bind(mainMod .. " + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.window.move({ direction = "down" }))

-- Move window to relative workspace
hl.bind(mainMod .. " + SHIFT + up",   hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ workspace = "+1" }))


-- Cycle windows and bring to top
hl.bind(mainMod .. " + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + CTRL + SHIFT + R", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures"))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + ALT + SHIFT + CTRL + Q", hl.dsp.exit())

-- Type the clipboard ("ultimate paste")
hl.bind("CTRL + SHIFT + A", hl.dsp.exec_cmd("~/dotfiles/scripts/type_clipboard.sh"))

-- Media keys (locked = works while screen is locked, repeating = repeat on hold)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/dotfiles/scripts/VolumeControl/increase.sh"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/dotfiles/scripts/VolumeControl/decrease.sh"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("~/dotfiles/scripts/VolumeControl/mute.sh"),     { locked = true })

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

hl.bind("XF86Search", hl.dsp.exec_cmd("launchpad"), { locked = true, repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Laptop lid switch
hl.bind("switch:on:Lid Switch",  function() hl.dispatch(hl.dsp.dpms({ action = "off", monitor = "eDP-1" })) end, { locked = true })
hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd("hyprlock"), { locked = true })
hl.bind("switch:off:Lid Switch", function() hl.dispatch(hl.dsp.dpms({ action = "on", monitor = "eDP-1" })) end, { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Special-workspace tweaks (NOTE: match.workspace "s" carried over verbatim
-- from your old config - adjust if it isn't matching what you expect)
hl.window_rule({ name = "opacityforspecialworkspace", match = { workspace = "s" }, opacity = "0.8" })
hl.window_rule({ name = "blurforspecialworkspace",    match = { workspace = "s" }, no_blur = true })

hl.window_rule({
    match     = { class = "firefox", title = "^$" },
    opacity   = "1.0 override",
    no_blur   = true,
    no_shadow = true,
})

hl.window_rule({
    match   = { class = "^$", title = "^$" },
    opacity = "1.0 override",
    no_blur = true,
})
