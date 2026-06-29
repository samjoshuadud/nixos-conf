{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    kitty
    neovim
    fish
    wakatime-cli
    trash-cli


    xdg-desktop-portal
    xdg-desktop-portal-wlr
    pipewire
    wireplumber


    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf

    gsettings-desktop-schemas
    glib
    dconf

    gnome-keyring
    libsecret
    greetd.tuigreet
  ];
}
