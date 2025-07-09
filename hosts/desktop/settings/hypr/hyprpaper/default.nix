{pkgs, ...}: let
  wallpaper = pkgs.fetchurl {
    url = "https://unsplash.com/photos/oMpAz-DN-9I/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNzUyMDM0OTQ4fA&force=true";
    hash = "sha256-YT9d7Dm6caGbfE+pFmDGbcCXk3Ue+hJqOQlYpYjjuOI=";
  };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${builtins.toString wallpaper}"
      ];
      wallpaper = ", ${builtins.toString wallpaper}";
    };
  };
}
