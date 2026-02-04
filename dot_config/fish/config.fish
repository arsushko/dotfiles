function fish_prompt
    set -l last_status $status

    if test $EUID -eq 0
        string join '' -- (set_color red) '[' (set_color magenta) (prompt_pwd) (test $last_status -ne 0; and string join '' (set_color red) ' !' $last_status) (set_color red) '] '(set_color normal)
    else
        string join '' -- (set_color blue) '[' (set_color green) (prompt_pwd) (set_color normal) (fish_git_prompt) (test $last_status -ne 0; and string join '' (set_color red) ' !' $last_status) (set_color blue) '] '(set_color normal)
    end
end

if status is-interactive
    source $HOME/.local/bin/lscolors.sh

    basic_settings
    configure_aliases
    zoxide init fish | source
end

