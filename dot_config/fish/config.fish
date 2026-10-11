if status is-interactive
    source $HOME/.local/bin/lscolors.sh

    basic_settings
    configure_aliases
    zoxide init fish | source
end

