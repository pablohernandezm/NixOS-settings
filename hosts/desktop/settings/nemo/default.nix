{ pkgs, ...}:{
  home.packages = with pkgs; [
    nemo-with-extensions
    ffmpegthumbnailer
  ];

  xdg.desktopEntries.nemo = {
    name = "Nemo";
    icon = "nemo";
    terminal = false;
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
    categories = [ "System" "Utility" "FileManager" "GTK" ];
  };

  xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
        "inode/file" = [ "nemo.desktop" ]; 
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
        "x-scheme-handler/file" = [ "nemo.desktop" ];
    };
  };

  dconf = {
    settings = {
      "org/cinnamon/desktop/applications/terminal" = {
         exec = "kitty";
         # exec-arg = ""; # argument
      };
      "org/gnome/desktop/default-applications/terminal" = {
        exec = "kitty";
      };
    };
  };
}
