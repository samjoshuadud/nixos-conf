{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos/dotfiles";
in
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

  xdg.configFile = {
    "hypr".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hypr";
    "nvim".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
    "fish".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fish";
    "tmux".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux";
    "cava".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/cava";
    "fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fastfetch";
    "starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/starship.toml";
  };

  programs.home-manager.enable = true;
}
