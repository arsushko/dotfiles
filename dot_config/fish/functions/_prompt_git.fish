# Git segment. Currently a thin wrapper around fish's built-in prompt.
function _prompt_git
    echo -n (fish_git_prompt)
end
