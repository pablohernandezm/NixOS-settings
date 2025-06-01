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
      rustfmt
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
      (writeShellScriptBin "chknixpath" (builtins.readFile ../../scripts/chknixpath.sh))
    ];

  };

  programs.obs-studio.enable = true;
  programs.obs-studio.plugins = with pkgs; [
    obs-studio-plugins.droidcam-obs
  ];

  imports = [
    ./settings
  ];
}
