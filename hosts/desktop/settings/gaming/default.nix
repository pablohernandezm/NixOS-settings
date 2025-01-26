{ pkgs, ...}:
{
  home.packages = with pkgs; [
    itch
    prismlauncher
  ];
}
