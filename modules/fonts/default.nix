{pkgs, ...}:{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = ["JetBrainsMono" "Noto"];})
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
