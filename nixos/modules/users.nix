{ pkgs, ... }:
{
  users.users.punisher = {
    isNormalUser = true;
    description = "punisher";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };
}
