{ config, ... }:
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

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      palette = "default";
      format = "[╭](fg:separator)$status$directory$git_branch$git_status$cmd_duration$time$line_break[╰](fg:separator)$character";

      palettes.default = {
        prompt_ok = "green";
        prompt_err = "red";
        icon = "bright-black";
        separator = "bright-black";
        directory = "red";
        duration = "yellow";
        git_branch = "cyan";
        git_status = "cyan";
      };

      character = {
        success_symbol = "[❯](fg:prompt_ok)";
        error_symbol = "[❯](fg:prompt_err)";
      };

      status = {
        format = "[─](fg:separator)[ $status](fg:red)";
        pipestatus = true;
        pipestatus_separator = "|";
        pipestatus_format = "[─](fg:separator)[ $pipestatus](fg:red)";
        disabled = false;
      };

      directory = {
        format = "[─](fg:separator)[ $path](fg:directory bold)";
        truncate_to_repo = false;
        truncation_length = 0;
      };

      git_branch = {
        format = "[─](fg:separator)[ $branch](fg:git_branch bold)";
      };

      git_status = {
        format = "[ $all_status$ahead_behind](fg:git_status)";
      };

      cmd_duration = {
        format = "[─](fg:separator)[󱐋 $duration](fg:duration)";
        min_time = 1000;
      };

      time = {
        format = "[─](fg:separator)[󰥔 $time](fg:duration bold)";
        disabled = true;
      };
    };
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      truecolor = true;
      force_tty = false;
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
      vim_keys = false;
      rounded_corners = true;
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_gpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";
      shown_boxes = "proc mem cpu net";
      update_ms = 1000;
      proc_sorting = "memory";
      proc_reversed = false;
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = false;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_filter_kernel = false;
      proc_aggregate = false;
      cpu_graph_upper = "total";
      cpu_graph_lower = "total";
      show_gpu_info = "Auto";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = false;
      show_uptime = true;
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      cpu_core_map = "";
      temp_scale = "celsius";
      base_10_sizes = false;
      show_cpu_freq = true;
      clock_format = "%X";
      background_update = true;
      custom_cpu_name = "";
      disks_filter = "";
      mem_graphs = true;
      mem_below_net = false;
      zfs_arc_cached = true;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = true;
      zfs_hide_datasets = false;
      disk_free_priv = false;
      show_io_stat = true;
      io_mode = false;
      io_graph_combined = false;
      io_graph_speeds = "";
      net_download = 100;
      net_upload = 100;
      net_auto = false;
      net_sync = false;
      net_iface = "";
      base_10_bitrate = "Auto";
      show_battery = true;
      selected_battery = "Auto";
      show_battery_watts = true;
      log_level = "WARNING";
      nvml_measure_pcie_speeds = true;
      rsmi_measure_pcie_speeds = true;
      gpu_mirror_graph = true;
    };
  };

  # Link custom btop themes folder
  xdg.configFile."btop/themes".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/btop/themes";

  programs.cava = {
    enable = true;
    settings = {
      general = {
        bar_width = 1;
        bar_spacing = 1;
      };
      input = {
        method = "pulse";
        source = "auto";
      };
      output = {
        method = "ncurses";
      };
      color = {
        foreground = "red";
        gradient = 0;
        gradient_color_1 = "'#7daea3'";
        gradient_color_2 = "'#a9b665'";
        gradient_color_3 = "'#d4a356'";
        gradient_color_4 = "'#d8a657'";
        gradient_color_5 = "'#e78a4e'";
        gradient_color_6 = "'#de854c'";
        gradient_color_7 = "'#e96c5f'";
        gradient_color_8 = "'#ea6962'";
      };
    };
  };

  # Link custom cava themes and shaders
  xdg.configFile."cava/shaders".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/cava/shaders";
  xdg.configFile."cava/themes".source  = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/cava/themes";

  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = "$(find \"\${XDG_CONFIG_HOME:-\$HOME/.config}/fastfetch/pngs/\" -name \"*.png\" | shuf -n 1)";
        height = 18;
      };
      display = {
        separator = " : ";
      };
      modules = [
        {
          type = "custom";
          format = "\u001b[31m    コンピューター";
        }
        {
          type = "custom";
          format = "┌──────────────────────────────────────────┐";
        }
        {
          type = "os";
          key = "   OS";
          keyColor = "red";
        }
        {
          type = "kernel";
          key = "   Kernel";
          keyColor = "red";
        }
        {
          type = "packages";
          key = "   Packages";
          keyColor = "green";
        }
        {
          type = "display";
          key = "   Display";
          keyColor = "green";
        }
        {
          type = "wm";
          key = "   WM";
          keyColor = "yellow";
        }
        {
          type = "terminal";
          key = "   Terminal";
          keyColor = "yellow";
        }
        {
          type = "custom";
          format = "└──────────────────────────────────────────┘";
        }
        "break"
        {
          type = "title";
          key = "  ";
        }
        {
          type = "custom";
          format = "┌──────────────────────────────────────────┐";
        }
        {
          type = "cpu";
          format = "{1}";
          key = "   CPU";
          keyColor = "blue";
        }
        {
          type = "gpu";
          format = "{2}";
          key = "   GPU";
          keyColor = "blue";
        }
        {
          type = "gpu";
          format = "{3}";
          key = "   GPU Driver";
          keyColor = "magenta";
        }
        {
          type = "memory";
          key = "  ﬙ Memory";
          keyColor = "magenta";
        }
        {
          type = "command";
          key = "  󱦟 OS Age ";
          keyColor = "31";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  󱫐 Uptime ";
          keyColor = "red";
        }
        {
          type = "custom";
          format = "└──────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
        "break"
      ];
    };
  };

  # Link custom fastfetch logo pngs
  xdg.configFile."fastfetch/pngs".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/fastfetch/pngs";
}
