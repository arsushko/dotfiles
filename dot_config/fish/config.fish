# vim: ft=fish

# TODO: Set the color based on whether command failed
function fish_prompt
    if test $EUID -eq 0
        string join '' -- (set_color red) '[' (set_color magenta) (prompt_pwd) (set_color red) '] '(set_color normal)
    else
        string join '' -- (set_color blue) '[' (set_color green) (prompt_pwd) (set_color normal) (fish_git_prompt) (set_color blue) '] '(set_color normal)
    end
end

if status is-interactive
    source $HOME/.local/bin/lscolors.sh

    basic_settings
    configure_aliases
    zoxide init fish | source
end

