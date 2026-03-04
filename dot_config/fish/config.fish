function fish_prompt
    set -l last_status $status

    # SSH prefix
    set -l prefix ""
    if set -q SSH_CLIENT; or set -q SSH_TTY
        set prefix (string join '' (set_color yellow) (hostname) (set_color blue) ':' (set_color normal))
    end

    # Error suffix
    set -l err ""
    if test $last_status -ne 0
        set err (string join '' (set_color red) ' !' $last_status)
    end

    # Bracket color and path color depend only on root vs normal
    if test $EUID -eq 0
        set -l bracket (set_color red)
        string join '' -- $prefix $bracket '[' (set_color magenta) (prompt_pwd) $err $bracket '] ' (set_color normal)
    else
        string join '' -- $prefix (set_color blue) '[' (set_color green) (prompt_pwd) (set_color normal) (fish_git_prompt) $err (set_color blue) '] ' (set_color normal)
    end
end

if status is-interactive
    source $HOME/.local/bin/lscolors.sh

    basic_settings
    configure_aliases
    zoxide init fish | source
end

