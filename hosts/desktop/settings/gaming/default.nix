{ pkgs, ...}:
{
  home.packages = with pkgs; [
    itch
    heroic
    lutris
    prismlauncher
  ];
}
