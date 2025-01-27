{ pkgs, ... }:
let
  iconPackage = pkgs.rose-pine-icon-theme;
  iconName = "rose-pine";
in
{
  gtk.iconTheme = {
    package = iconPackage;
    name = iconName;
  };

  services.dunst.iconTheme = {
    package = iconPackage;
    name = iconName;
  };
}
