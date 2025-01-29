{ pkgs, ... }:
let
  themePackage = pkgs.rose-pine-gtk-theme;
  themeName = "rose-pine";
  extraConf = ''
  '';
in
{
  imports = [
    ./cursor.nix
    ./icons.nix
  ];

  gtk = {
    theme = {
      name = themeName;
      package = themePackage;
    };

    gtk2.extraConfig = ''
      gtk-application-prefer-dark-theme = true;
    '';

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
