{ pkgs, ... }: {
  imports = [
    ./hypr
    ./waybar
    ./git
    ./clipboard
    ./gaming
    ./themes
    ./dunst
  ];
}
