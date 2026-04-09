if status is-interactive
    # Commands to run in interactive sessions can go here
    end

# Set up starship
set -x STARSHIP_CONFIG ~/.config/starship.toml
starship init fish | source

# Set up direnv
direnv hook fish | source
