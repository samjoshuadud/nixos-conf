set -U fish_greeting
starship init fish | source
source ~/.config/fish/aliases.fish
source ~/.config/fish/env.fish
zoxide init fish | source
set -Ux fish_user_paths "$HOME/.tmuxifier/bin" $fish_user_paths
set -U fish_user_paths /home/punisher/.dotnet/tools $fish_user_paths

set -x ANDROID_HOME ~/Android/Sdk 
set -x PATH $PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools/bin
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

set -x NIXPKGS_ALLOW_UNFREE 1

fnm env --use-on-cd | source

pokemon-colorscripts --no-title --random --shiny

any-nix-shell fish --info-right | source

direnv hook fish | source
