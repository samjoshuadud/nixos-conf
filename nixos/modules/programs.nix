{pkgs, ...}: {
  programs.hyprland.enable = true;

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
  # This single line handles BOTH nix-shell AND nix develop perfectly
  ${pkgs.any-nix-shell}/bin/any-nix-shell fish | source
'';
  programs.gpu-screen-recorder.enable = true;
  programs.dconf.enable=true;
  programs.nix-ld.enable = true;
  virtualisation.libvirtd = {
    enable = true;
  };
}
