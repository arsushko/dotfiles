# Always shown, so the machine is identifiable in any kind of session (ssh,
# sudo -i, machinectl shell) without relying on inherited environment variables.
function _prompt_host
    set_color yellow
    echo -n (prompt_hostname)
    set_color blue
    echo -n ':'
    set_color normal
end
