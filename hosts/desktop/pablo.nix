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
      nemo-with-extensions
      nemo-fileroller
      unzip
      whatsapp-for-linux
      supabase-cli
      (writeShellScriptBin "chknixpath" (builtins.readFile ../../scripts/chknixpath.sh))
    ];

  };


  imports = [
    ./settings
  ];
}
