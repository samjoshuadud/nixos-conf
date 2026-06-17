{ pkgs, antigravityNix, ... }:
{
  home.packages = with pkgs; [
    # Runtimes & compilers
    gcc
    go
    cargo
    nodejs_22
    fnm
    python3
    dotnet-sdk
    dotnet-ef

    # Nix tools
    nil
    alejandra

    # Dev utilities
    gh
    docker-compose

    antigravityNix.packages.x86_64-linux.google-antigravity-cli
  ];
}
