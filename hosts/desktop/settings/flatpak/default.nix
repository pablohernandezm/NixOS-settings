{inputs, ...}: {
  imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];

  services.flatpak.packages = [
    {
      appId = "com.stremio.Stremio";
      origin = "flathub";
    }
    {
      appId = "org.fedoraproject.MediaWriter";
      origin = "flathub";
    }
  ];
}
