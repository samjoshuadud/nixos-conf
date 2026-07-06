{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      {
        plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
          pluginName = "tmux-spotlight";
          version = "unstable-2026-07-06";
          rtpFilePath = "spotlight.tmux";
          src = pkgs.fetchFromGitHub {
            owner = "MeinardEdrei";
            repo = "tmux-spotlight";
            rev = "8ff97b9b370eda01939f747d562df96ba15f655e";
            sha256 = "sha256-XfkawNryvvjNKMHzh2NAQ2ZTbX8QdnDLNlgZVIirtNE=";
          };
        };
      }
    ];

    extraConfig = ''
      # Set default shell
      set-option -g default-shell $SHELL

      # Set true color
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # Re-number windows and position
      set-option -g renumber-windows on
      set -g status-position bottom

      # Theme: borders
      set -g pane-border-lines single
      set -g pane-border-style fg=brightblack
      set -g pane-active-border-style fg=red

      # Theme: status
      set -g status-style bg=default,fg=brightblack
      set -g status-left "#[fg=brightblack,bright]#(basename \"#{pane_current_path}\")"
      set -g status-right "#[fg=brightblack,bright]#S"

      # Theme: status (windows)
      set -g window-status-format "●"
      set -g window-status-current-format "●"
      set -g window-status-current-style "#{?window_zoomed_flag,fg=yellow,fg=red,nobold}"
      set -g window-status-bell-style "fg=red,nobold"
      set -g status-justify absolute-centre

      # Smart pane switching — @pane-is-vim is set by smart-splits.nvim (zero latency)
      bind-key -n C-h if -F "#{@pane-is-vim}" 'send-keys C-h' 'select-pane -L'
      bind-key -n C-j if -F "#{@pane-is-vim}" 'send-keys C-j' 'select-pane -D'
      bind-key -n C-k if -F "#{@pane-is-vim}" 'send-keys C-k' 'select-pane -U'
      bind-key -n C-l if -F "#{@pane-is-vim}" 'send-keys C-l' 'select-pane -R'

      # Smart pane resizing
      bind-key -n M-h if -F "#{@pane-is-vim}" 'send-keys M-h' 'resize-pane -L 3'
      bind-key -n M-j if -F "#{@pane-is-vim}" 'send-keys M-j' 'resize-pane -D 3'
      bind-key -n M-k if -F "#{@pane-is-vim}" 'send-keys M-k' 'resize-pane -U 3'
      bind-key -n M-l if -F "#{@pane-is-vim}" 'send-keys M-l' 'resize-pane -R 3'

      # Yazi passthrough
      set -g allow-passthrough on

      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      # Keybindings for copy mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Custom keybindings
      bind g popup -d "#{pane_current_path}" -xC -yC -w 90% -h 90% -E lazygit
      bind p popup -d "#{pane_current_path}" -xC -yC -w 50% -h 50% 
      bind q popup -d "#{pane_current_path}" -xC -yC -w 90% -h 90% -E lazysql
      bind e popup -d "#{pane_current_path}" -xC -yC -w 90% -h 90% -E 'tmux new-session yazi \; set status off'

      # Open panes in current directory
      bind - split-window -c '#{pane_current_path}'
      bind / split-window -h -c '#{pane_current_path}'

      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"
    '';
  };
}
