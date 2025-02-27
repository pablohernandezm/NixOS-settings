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
      rustc
      rustfmt
      cargo
      brave
      eza
      font-manager
      isoimagewriter
      ventoy-full
      nemo-with-extensions
      nemo-fileroller
      unzip
      supabase-cli
      (writeShellScriptBin "chknixpath" (builtins.readFile ../../scripts/chknixpath.sh))
    ];

  };


  imports = [
    ./settings
  ];
}
