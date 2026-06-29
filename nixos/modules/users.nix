{ pkgs, ... }:
{
  users.users.punisher = {
    isNormalUser = true;
    description = "punisher";
    extraGroups = [ "networkmanager" "wheel" "docker" "kvm" "libvirtd"];
    shell = pkgs.fish;
  };
}
