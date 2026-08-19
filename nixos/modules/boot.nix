{ lib, pkgs, ... }:
{
  # systemd-boot itself is unsigned, so plain systemd-boot can't pass Secure
  # Boot. lanzaboote signs the boot chain instead. Riot Vanguard requires
  # Secure Boot to be on for the Windows side, so this has to stay enabled.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  # sbctl one-time setup, in order:
  #   sudo sbctl create-keys                # keys land in /var/lib/sbctl
  #   sudo nixos-rebuild switch --flake .   # signs the boot chain
  #   sudo sbctl verify                     # confirm signed
  #   -> reboot into BIOS, put firmware in Setup Mode (ASUS: erase Platform Key)
  #   sudo sbctl enroll-keys --microsoft    # keeps MS certs so Windows still boots
  #   -> reboot, enable Secure Boot in BIOS
  environment.systemPackages = [ pkgs.sbctl ];

  # Kernel ntfs3 driver — needed to mount Windows partitions.
  boot.supportedFilesystems = [ "ntfs" ];

  # ESP is small and now holds two bootloaders' worth of entries.
  boot.loader.systemd-boot.configurationLimit = 10;
}
