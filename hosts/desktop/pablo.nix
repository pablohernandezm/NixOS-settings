{ pkgs, ... }:
{
  home = {
    username = "pablo";
    homeDirectory = "/home/pablo";
    stateVersion = "24.11";

    packages = with pkgs; [
      zig
      gcc
      go
      bun
      nodejs_22
      nodePackages.vercel
      rustc
      cargo
      eza
      font-manager
      nemo-fileroller
      unzip
      supabase-cli
      postgresql_17
      blender
      awscli2
      strawberry
      qimgv
      openshot-qt
      audacity
      brave
      abiword
      obsidian
      (writeShellScriptBin "chknixpath" (builtins.readFile ../../scripts/chknixpath.sh))
    ];

  };

  programs.bash = {
    enable = true;
    initExtra = ''
      cdn() {
        if [ -z "$(ls -d */ 2>/dev/null)" ]; then
          echo "No directories available"
          return 1
        fi
        PS3="Select directory (q to quit): "
        select dir in */; do
          case $REPLY in
            q|Q) break ;;
            *) if [ -n "$dir" ]; then
                 cd "$dir" && break
               else
                 echo "Invalid choice"
               fi ;;
          esac
        done
      }
    '';
  };

  programs.obs-studio.enable = true;
  programs.obs-studio.plugins = with pkgs; [
    obs-studio-plugins.droidcam-obs
  ];

  imports = [
    ./settings
  ];
}
