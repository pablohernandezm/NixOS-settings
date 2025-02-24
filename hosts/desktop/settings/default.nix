{ pkgs, ... }: {
  imports = [
    ./hypr
    ./waybar
    ./git
    ./clipboard
    ./gaming
    ./themes
    ./dunst
    ./neovim
    ./nemo
    ./flatpak
  ];
}
