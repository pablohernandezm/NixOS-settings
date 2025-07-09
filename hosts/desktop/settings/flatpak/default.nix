{inputs, ...}: {
  imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];

  services.flatpak.packages = [
    {
      appId = "com.stremio.Stremio";
      origin = "flathub";
    }
    # { appId = "app.zen_browser.zen"; origin = "flathub"; }
  ];
}
