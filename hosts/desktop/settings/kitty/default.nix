{...}:{
  programs.kitty.enable = true; # If using Home Manager

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-terminal-emulator" = [ "kitty.desktop" ];
      "x-scheme-handler/terminal" = [ "kitty.desktop" ]; # Important for any application that uses this
    };
  };

  xdg.desktopEntries.kitty = {
    name = "Kitty";
    genericName = "Terminal Emulator";
    exec = "kitty";
    icon = "kitty";
    terminal = false;
    categories = [ "System" "TerminalEmulator" ]; # Critical for this to be recognized as a terminal
  };
}
