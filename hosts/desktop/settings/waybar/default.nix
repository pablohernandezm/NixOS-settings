{
  lib,
  pkgs,
  ...
}: let
  waybarConfigDir = "/home/pablo/nix/hosts/desktop/settings/waybar/waybar";

  targetConfigDir = "/home/pablo/.config/waybar";

  createWaybarSymlinksScript = pkgs.writeShellScript "create-waybar-symlinks" ''
    echo "Creating symlinks for Waybar configuration..."

    mkdir -p "$(dirname "${targetConfigDir}")"

    rm -rf "${targetConfigDir}"

    # Create the symlinks
    ln -sf "${waybarConfigDir}" "${targetConfigDir}"

    echo "Waybar symlinks created successfully."
  '';
in {
  home.activation = {
    # 'post' runs after all other Home Manager actions
    waybarSymlinks = lib.mkAfter ''
      ${createWaybarSymlinksScript}
    '';
  };
}
