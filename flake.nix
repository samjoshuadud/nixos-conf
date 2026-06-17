{
  description = "Punisher's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
        nixpkgs.config.allowUnfree = true;
        }
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager  # ← fix here
        {
          home-manager.useGlobalPkgs = true;
          home-manager.extraSpecialArgs = { zenBrowser = zen-browser; };
          home-manager.users.punisher = import ./home-manager/home.nix;
        }
      ];
    };
    };
}
