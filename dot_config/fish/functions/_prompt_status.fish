# Prints the exit code of the last command, only if it failed.
function _prompt_status --argument-names last_status
    test "$last_status" -ne 0; or return

    set_color red
    echo -n " !$last_status"
    set_color normal
end
