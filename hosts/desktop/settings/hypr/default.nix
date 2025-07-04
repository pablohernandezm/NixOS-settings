{...}: {
  imports = [
    ./hyprpolkitagent
    ./hyprshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    portalPackage = null;
     
    settings = {
      "$mod" = "SUPER";
      "$menu" = ''rofi -show drun -show-icons -run-command "uwsm app -- {cmd}"'';
      "$terminal" = "uwsm app -- kitty";
      "$browser" = "uwsm app -- flatpak run app.zen_browser.zen";
      "$emoji" = "rofi -modi emoji -show emoji";

      exec-once = [
        "systemctl --user enable --now hyprpolkitagent.service"
        "uwsm app -- waybar &"
        "uwsm app -- dunst &"
      ];

      input = {
        kb_layout	= "us";
        kb_variant = "altgr-intl";
      };

      bind =
        [
          "$mod, w, exec, pkill waybar && waybar &"
          "$mod, z, exec, $browser"
          "$mod, m, exec, $menu"
          "$mod, e, exec, $emoji"
          "$mod, t, exec, $terminal"
          "$mod, c, killactive,"
          "$mod, s, exec, uwsm app -- hyprshot -m region --freeze"
          "$mod Shift, s, exec, uwsm app -- hyprshot -m output"
          "$mod Alt, s, exec, uwsm app -- hyprshot -m window"

          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"

          "$mod Shift, j, movewindow, d"
          "$mod Shift, k, movewindow, u"
          "$mod Shift, h, movewindow, l"
          "$mod Shift, l, movewindow, r"

          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

          "$mod Shift, [, exec, hyprctl keyword general:layout 'dwindle'"
          "$mod shift, ], exec, hyprctl keyword general:layout 'master'"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      workspace = [
        # No gaps when only
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      windowrulev2 =   [
        "suppressevent maximize, class:.*" # Ignore maximize requests from apps.
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix some dragging issues with XWayland

        # Smart gaps 
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];
    };
  };
}
