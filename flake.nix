{
  description = "My system settings";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = {nixpkgs, home-manager, nix-flatpak, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./modules

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pablo = import ./hosts/desktop/pablo.nix;
          home-manager.backupFileExtension = "backup";

          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];

      specialArgs = { inherit inputs; };
    };
  };
}
