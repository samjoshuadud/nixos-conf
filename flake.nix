{
  description = "Punisher's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    antigravity-nix = {
      url =  "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    any-nix-shell = {
      url = "github:samjoshuadud/any-nix-shell";
      flake = false;
    };
    nixs.url = "github:samjoshuadud/nixs";
    ambxst.url = "github:samjoshuadud/Ambxst";
    waylandar.url = "github:samjoshuadud/waylandar";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, antigravity-nix, any-nix-shell, nixs, ambxst, waylandar, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ambxst.nixosModules.default
        {
        nixpkgs.config.allowUnfree = true;
        }
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager  # ← fix here
        {
          home-manager.useGlobalPkgs = true;
          home-manager.extraSpecialArgs = { 
            zenBrowser = zen-browser; 
            antigravityNix = antigravity-nix;
            anyNixShell = any-nix-shell;
            nixs-search = nixs;
            Waylandar = waylandar;
          };
          home-manager.users.punisher = import ./home-manager/home.nix;
        }
      ];
    };
    };
}
