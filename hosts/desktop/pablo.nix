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
      nodejs
      cargo
      brave
      eza
      font-manager
      isoimagewriter
      nemo
      (writeShellScriptBin "chknixpath" (builtins.readFile ../../scripts/chknixpath.sh))
    ];

  };

  imports = [
    ./settings
  ];
}
