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
      brave
      tor-browser
      eza
      font-manager
      isoimagewriter
      ventoy-full
      nemo-with-extensions
      nemo-fileroller
      unzip
      supabase-cli
      postgresql_17
      (writeShellScriptBin "chknixpath" (builtins.readFile ../../scripts/chknixpath.sh))
    ];

  };


  imports = [
    ./settings
  ];
}
