{ pkgs, ...}:{
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
      (writeShellScriptBin "chknixpath" (builtins.readFile ../../scripts/chknixpath.sh))
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      # hyprcursor = {
      #   enable = true;
      #   size = 32;
      # };
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 32;
    };
  };

  gtk.enable = true;
  services.xsettingsd = {
    enable = true;
    settings = {
      "Gtk/CursorThemeName" = "BreezeX-RosePine-Linux";
      "Gtk/CursorThemeSize" = 32;
    };
  };

  imports = [
    ./settings
  ];
}
