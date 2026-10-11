# Settings for fish_git_prompt, used by functions/_prompt_git.fish.
#
# Output looks like: (master ↑1 ↓2 +3 ~2 ?1 $1)
#   +N staged   ~N modified   ?N untracked   xN conflicted   $ stashed
#   ↑N ahead of upstream   ↓N behind upstream
#
# Informative mode counts files, which can be slow on huge repositories. It
# can be disabled per repository with:
#   git config --local bash.showInformativeStatus false

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showupstream informative

# Plain characters, to stay compatible with any font. Each has a leading space
# because fish concatenates the flags, and the state separator is emptied so
# the first one doesn't get doubled up.
set -g __fish_git_prompt_char_stateseparator ''
set -g __fish_git_prompt_char_stagedstate ' +'
set -g __fish_git_prompt_char_dirtystate ' ~'
set -g __fish_git_prompt_char_untrackedfiles ' ?'
set -g __fish_git_prompt_char_invalidstate ' x'
set -g __fish_git_prompt_char_stashstate ' $'
set -g __fish_git_prompt_char_upstream_ahead ' ↑'
set -g __fish_git_prompt_char_upstream_behind ' ↓'
set -g __fish_git_prompt_char_cleanstate ''

# Colors, matching the old zsh prompt.
set -g __fish_git_prompt_color_branch white --bold
set -g __fish_git_prompt_color_stagedstate green
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_untrackedfiles normal
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_stashstate blue
set -g __fish_git_prompt_color_upstream yellow
