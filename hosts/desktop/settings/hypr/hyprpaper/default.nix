{pkgs, ...}: let
  currentFolder = builtins.toString ./preview.jpg;
  # wallpaper = pkgs.fetchurl {
  #   url = "https://unsplash.com/photos/Z6EpCdMcoUU/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8N3x8c3BhY2V8ZW58MHwwfHx8MTc1MTk0ODk0NXww&force=true";
  #   # url = "file://${currentFolder}";
  #   hash = "sha256-45TATty0jhEXQGPVKeYFYogRbeEs83AB2rZHaUJDb1I=";
  # };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        currentFolder
      ];
      wallpaper = ", ${currentFolder}";
    };
  };
}
