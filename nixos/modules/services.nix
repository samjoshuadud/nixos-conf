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
  services.gnome.gnome-keyring.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %A, %B %d, %Y' --greeting 'Welcome to NixOS' --greet-align center --width 70 --window-padding 2 --container-padding 2 --prompt-padding 1 --asterisks --asterisks-char '•' --remember --remember-user-session --cmd start-hyprland";
        user = "greeter";
      };
    };
  };
  
}
