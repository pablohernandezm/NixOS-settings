{ pkgs, ... }:
let
  themePackage = pkgs.rose-pine-gtk-theme;
  themeName = "rose-pine";
in
{
  imports = [
    ./cursor.nix
    ./icons.nix
  ];

  gtk.theme = {
    name = themeName;
    package = themePackage;
  };
}
