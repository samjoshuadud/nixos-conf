{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # System monitors
    btop
    htop
    cava
    fastfetch

    # Terminal & shell tools
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

    # GUI apps
    google-chrome
    discord
    zenBrowser.packages."${pkgs.system}".default

    # Misc
    swaylock-effects
  ];
}
