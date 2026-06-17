{ pkgs, zenBrowser, antigravityNix, ... }:  # ← add these
{
  home.packages = with pkgs; [
    btop
    htop
    cava
    fastfetch
    swaylock-effects
    starship
    tmux
    tmuxifier
    zoxide
    fzf
    yazi
    bat
    ripgrep
    fd
    xdg-user-dirs
    pokemon-colorscripts
    lazygit
    lazysql
    google-chrome
    discord
    zenBrowser.packages."${pkgs.system}".default
  ];
}
