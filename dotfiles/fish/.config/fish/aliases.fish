# Custom neofetch
alias axfetch 'clear && neofetch --config ~/.config/neofetch/adrien.conf --kitty '~/.config/neofetch/ax.png' --size 270px --colors 1 7 7 1 7 7'
alias kittyfetch 'clear && neofetch --config ~/.config/neofetch/kitty.conf'
alias sansfetch 'clear && neofetch --config ~/.config/neofetch/adrien.conf --kitty '~/.config/neofetch/sans.png' --size 270px --colors 1 7 7 1 7 7'
alias adrienfetch 'clear && neofetch --config ~/.config/neofetch/adrien.conf --kitty '~/.config/neofetch/adrien.png' --size 270px --colors 1 7 7 1 7 7'

alias rm 'trash-put'
# Cava gradient support for Tmux
alias cavax 'TERM=st-256color cava'

alias v 'nvim'

alias home 'nvim ~/nixos/home-manager/home.nix'
alias config 'nvim ~/nixos/nixos/configuration.nix'

alias flake 'nvim ~/nixos/flake.nix'

alias save 'sudo nixos-rebuild switch --flake /home/punisher/nixos#nixos'
