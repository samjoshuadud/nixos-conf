{ pkgs, antigravityNix, anyNixShell, nixs-search, ... }:
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
    (any-nix-shell.overrideAttrs (old: {
      src = anyNixShell;
    }))
    nixs-search.packages.x86_64-linux.default
    asciinema

    bat

    slurp
    pulseaudio
    uwsm

    distrobox
    github-copilot-cli

    vscode
    virt-manager
  ];
}
