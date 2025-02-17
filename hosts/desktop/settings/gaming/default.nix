{ pkgs, ...}:
{
  home.packages = with pkgs; [
    itch
    heroic
    lutris
    prismlauncher
  ];

  xdg.desktopEntries.steam-run = {
    name = "Steam Run";
    exec = "steam-run %f";
    icon = "steam";
    type = "Application";
    mimeType = [ "application/x-shellscript" ];
    terminal = false;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-shellscript" = "steam-run.desktop";
    };
  };
}
