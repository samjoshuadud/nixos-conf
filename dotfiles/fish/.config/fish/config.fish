if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting
starship init fish | source
source ~/.config/fish/aliases.fish
source ~/.config/fish/ffmpeg.fish
source ~/.config/fish/env.fish
zoxide init fish | source
set -Ux fish_user_paths "$HOME/.tmuxifier/bin" $fish_user_paths
set -U fish_user_paths /home/punisher/.dotnet/tools $fish_user_paths

set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -x ANDROID_HOME ~/Android/Sdk 
set -x PATH $PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools/bin
set -x PATH $JAVA_HOME/bin $PATH
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH
set -x TERM xterm-256color

set -x PATH /opt/lampp/bin $PATH

set -x NIXPKGS_ALLOW_UNFREE 1

fnm env --use-on-cd | source

pokemon-colorscripts --no-title --random --shiny

direnv hook fish | source
