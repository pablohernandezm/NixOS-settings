{ pkgs, ...}: {
  imports = [
    ./hypr
    ./waybar
    ./dunst
    ./rofi-wayland
    ./fonts
    ./pavucontrol
  ];
}
