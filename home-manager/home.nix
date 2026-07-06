{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos/dotfiles";
in
{
  imports = [
    ./packages/default.nix
    ./modules/theme.nix
    ./modules/programs.nix
    ./modules/tmux.nix
    ./modules/fish.nix
    ./modules/session.nix
  ];

  home.username = "punisher";
  home.homeDirectory = "/home/punisher";
  home.stateVersion = "26.05";

  xdg.configFile = {
    "hypr".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hypr";
    "nvim".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
    "cava".source      = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/cava";
    "fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fastfetch";
    "btop".source     = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/btop";

  };

  programs.home-manager.enable = true;
}
