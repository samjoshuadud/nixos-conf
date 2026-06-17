{ ... }:
{
  programs.git = {
    enable = true;
    userName = "samjoshuadud";
    userEmail = "calebjoshuaarmojallas@gmail.com";
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ~/.cache/ambxst/kitty.conf
    '';
    settings = {
      window_padding_width = 15;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
