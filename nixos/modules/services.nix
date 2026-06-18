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
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
     jack.enable = true;
  };

  security.rtkit.enable = true;
  services.dbus.enable = true;
  
}
