{ ... }:
{
  imports = [
    ./packages/default.nix
    ./modules/theme.nix
    ./modules/programs.nix
    ./modules/session.nix
  ];

  home.username = "punisher";
  home.homeDirectory = "/home/punisher";
  home.stateVersion = "26.05";

  home.file = {
    ".config/hypr".source      = /home/punisher/nixos/dotfiles/hypr/.config/hypr;
    ".config/nvim".source      = /home/punisher/nixos/dotfiles/nvim/.config/nvim;
    ".config/fish".source      = /home/punisher/nixos/dotfiles/fish/.config/fish;
    ".config/tmux".source      = /home/punisher/nixos/dotfiles/tmux/.config/tmux;
    ".config/cava".source      = /home/punisher/nixos/dotfiles/cava;
    ".config/fastfetch".source = /home/punisher/nixos/dotfiles/fastfetch;
    ".config/starship.toml".source = /home/punisher/nixos/dotfiles/starship.toml;
  };

  programs.home-manager.enable = true;
}
