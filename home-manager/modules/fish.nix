{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      rm = "trash-put";
      v = "nvim";
      home = "nvim ~/nixos/home-manager/home.nix";
      config = "nvim ~/nixos/nixos/configuration.nix";
      flake = "nvim ~/nixos/flake.nix";
      save = "sudo nixos-rebuild switch --flake /home/punisher/nixos#nixos";
    };

    plugins = [
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
    ];

    functions = {
      drconv = {
        body = ''
          if test (count $argv) -lt 1
              echo "Usage: drconv archivo1 archivo2 ..."
              return 1
          end

          for file in $argv
              if test -f $file
                  set output_file (dirname $file)/(basename -s .mp4 $file)_dr.mov
                  ffmpeg -i $file -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov $output_file
                  echo "Processed: $file -> $output_file"
              else
                  echo "Skipping: $file (not a regular file)"
              end
          end
        '';
      };

      vcompat = {
        body = ''
          ffmpeg -i $argv[1] -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -c:v libx264 -profile:v high -level:v 4.2 -pix_fmt yuv420p -movflags +faststart -c:a aac -strict -2 (dirname $argv[1])/(basename -s .mp4 $argv[1])_compat.mp4
        '';
      };

      vcompatlb = {
        body = ''
          if test (count $argv) -lt 1
              echo "Usage: vcompat archivo.mp4 [tasa_de_bits]"
              return 1
          end

          set input_file $argv[1]
          set output_file (dirname $input_file)/(basename -s .mp4 $input_file)_converted.mp4

          if test (count $argv) -ge 2
              set bitrate $argv[2]"M"
          else
              set bitrate 1"M"
          end

          ffmpeg -i $input_file -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -c:v libx264 -profile:v high -level:v 4.2 -pix_fmt yuv420p -movflags +faststart -b:v $bitrate -c:a aac -strict -2 $output_file
        '';
      };
    };

    shellInit = ''
      # Environment variables
      set -gx TERMINAL kitty
      set -gx EDITOR nvim
      set -gx NIXPKGS_ALLOW_UNFREE 1
      set -gx ANDROID_HOME "$HOME/Android/Sdk"
      set -gx GOPATH "$HOME/go"

      # Update PATH
      fish_add_path "$HOME/.tmuxifier/bin"
      fish_add_path "$HOME/.dotnet/tools"
      fish_add_path "$ANDROID_HOME/platform-tools"
      fish_add_path "$ANDROID_HOME/tools"
      fish_add_path "$ANDROID_HOME/tools/bin"
      fish_add_path "$GOPATH/bin"

      # XDG directory helper variables (updated via xdg-user-dirs)
      if type -q xdg-user-dir
        set -gx XDG_DESKTOP_DIR (xdg-user-dir DESKTOP)
        set -gx XDG_DOWNLOAD_DIR (xdg-user-dir DOWNLOAD)
        set -gx XDG_TEMPLATES_DIR (xdg-user-dir TEMPLATES)
        set -gx XDG_PUBLICSHARE_DIR (xdg-user-dir PUBLICSHARE)
        set -gx XDG_DOCUMENTS_DIR (xdg-user-dir DOCUMENTS)
        set -gx XDG_MUSIC_DIR (xdg-user-dir MUSIC)
        set -gx XDG_PICTURES_DIR (xdg-user-dir PICTURES)
        set -gx XDG_VIDEOS_DIR (xdg-user-dir VIDEOS)
      end

      # Local custom API hooks
      if test -e ~/.config/fish/api.fish
        source ~/.config/fish/api.fish
      end
    '';

    interactiveShellInit = ''
      set -g fish_greeting

      # Theme colors (migrated from fish_frozen_theme.fish)
      set -g fish_color_autosuggestion 555 brblack
      set -g fish_color_cancel -r
      set -g fish_color_command blue
      set -g fish_color_comment red
      set -g fish_color_cwd green
      set -g fish_color_cwd_root red
      set -g fish_color_end green
      set -g fish_color_error brred
      set -g fish_color_escape brcyan
      set -g fish_color_history_current --bold
      set -g fish_color_host normal
      set -g fish_color_host_remote yellow
      set -g fish_color_normal normal
      set -g fish_color_operator brcyan
      set -g fish_color_param cyan
      set -g fish_color_quote yellow
      set -g fish_color_redirection cyan --bold
      set -g fish_color_search_match white --background=brblack
      set -g fish_color_selection white --bold --background=brblack
      set -g fish_color_status red
      set -g fish_color_user brgreen
      set -g fish_color_valid_path --underline
      set -g fish_pager_color_completion normal
      set -g fish_pager_color_description B3A06D yellow -i
      set -g fish_pager_color_prefix normal --bold --underline
      set -g fish_pager_color_progress brwhite --background=cyan
      set -g fish_pager_color_selected_background -r

      # Run eye candy if interactive
      if status --is-interactive
        pokemon-colorscripts --no-title --random --shiny
      end

      # any-nix-shell integration
      if type -q any-nix-shell
        any-nix-shell fish --info-right | source
      end

      # tmuxifier integration
      if type -q tmuxifier
        tmuxifier init - fish | source
      end
    '';
  };

  # Enable zoxide and integrate with fish
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
