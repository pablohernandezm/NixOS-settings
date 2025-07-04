{pkgs, ...} : {
  home.packages = with pkgs; [
    typst
    zathura
  ];


  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ]; # Replace with actual Flatpak .desktop file name
    };
  };
}
