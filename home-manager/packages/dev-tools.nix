{ pkgs, antigravityNix, ... }:  # ← add this
{
  home.packages = with pkgs; [
    gcc
    go
    cargo
    nodejs_22
    fnm
    python3
    dotnet-sdk
    dotnet-ef
    nil
    alejandra
    gh
    antigravityNix.packages.x86_64-linux.google-antigravity-cli
  ];
}
