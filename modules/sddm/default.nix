{ pkgs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "sddm-astronaut-theme";
  services.displayManager.sddm.wayland.enable = true;
}
