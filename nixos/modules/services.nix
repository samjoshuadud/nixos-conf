{ pkgs, ... }:  # ← was missing pkgs
{
  services.blueman.enable = true;
  services.upower.enable = true;
  services.spice-vdagentd.enable = true;

  services.logind = {
    powerKey = "suspend";
    powerKeyLongPress = "poweroff";
    lidSwitch = "suspend";
  };

  virtualisation.docker.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
