{ config, ... }:
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
    ".config/hypr".source      = config.lib.file.mkOutOfStoreSymlink "/home/punisher/nixos/dotfiles/hypr/.config/hypr";
    ".config/nvim".source      = config.lib.file.mkOutOfStoreSymlink "/home/punisher/nixos/dotfiles/nvim/.config/nvim";
    ".config/fish".source      = config.lib.file.mkOutOfStoreSymlink "/home/punisher/nixos/dotfiles/fish/.config/fish";
    ".config/tmux".source      = config.lib.file.mkOutOfStoreSymlink "/home/punisher/nixos/dotfiles/tmux/.config/tmux";
    ".config/cava".source      = config.lib.file.mkOutOfStoreSymlink "/home/punisher/nixos/dotfiles/cava";
    ".config/fastfetch".source = config.lib.file.mkOutOfStoreSymlink "/home/punisher/nixos/dotfiles/fastfetch";
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/punisher/nixos/dotfiles/starship.toml";
  };

  programs.home-manager.enable = true;
}
