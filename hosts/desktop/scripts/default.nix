{pkgs, ...}: let
  scriptPaths = [
    ./nvimctl.nix
  ];

  importWithPkgs = path: import path {inherit pkgs;};
in {
  home.packages = builtins.map importWithPkgs scriptPaths;
}
