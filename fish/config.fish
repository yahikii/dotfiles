if status is-interactive
	fish_add_path $HOME/.local/bin
	alias docker 'podman'
	alias vim="nvim"
    	alias vi="nvim"
end

# Set up starship
set -x STARSHIP_CONFIG ~/.config/starship.toml
starship init fish | source

# Set up direnv
direnv hook fish | source

set -gx EDITOR nvim
set -gx VISUAL nvim
