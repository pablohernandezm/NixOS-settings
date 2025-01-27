{ pkgs, ... }:
let
  cursorTheme = "BreezeX-RosePine-Linux";
  cursorPackage = pkgs.rose-pine-cursor;
  cursorSize = 24;
in
{

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    # hyprcursor = {
    #   enable = true;
    #   size = 32;
    # };
    package = cursorPackage;
    name = cursorTheme;
    size = cursorSize;
  };

  gtk.enable = true;

  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprctl setcursor ${cursorTheme} ${toString cursorSize}"
  ];
}
