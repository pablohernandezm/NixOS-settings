{pkgs, ...}:{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.noto
      nerd-fonts.jetbrains-mono
      manrope
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Mono" ];
        sansSerif = [ "Manrope" ];
        monospace = [ "JetBrains Mono" ];
      };
    };
  };
}
