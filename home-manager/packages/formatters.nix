{ pkgs, ... }:
{
  home.packages = with pkgs; [
    stylua       # Lua
    prettier     # JS/TS/React/HTML/CSS/JSON  ← was nodePackages.prettier
    black        # Python                     ← was python3Packages.black
    isort        # Python                     ← was python3Packages.isort
    gofumpt      # Go
    goimports-reviser
    shfmt        # Shell
    alejandra    # Nix
  ];
}
