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
  ];
}
