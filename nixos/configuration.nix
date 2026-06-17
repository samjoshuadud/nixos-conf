{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/users.nix
    ./modules/hardware.nix
    ./modules/services.nix
    ./modules/programs.nix
    ./modules/packages.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than-14d";
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}
