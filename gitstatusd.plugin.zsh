#!/usr/bin/env zsh
# Gitstatusd Plugin for Oh-My-Zsh
# Copyright (C) 2020  Hans-Nikolai Viessmann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# this plugin changes the git_prompt_info functions to use the gitstatud
# tool by romkatv (see https://github.com/romkatv/gitstatus).

# we assume that gitstatusd is installed globally
[[ -f /usr/share/gitstatus/gitstatus.plugin.zsh ]] || 'return'

source /usr/share/gitstatus/gitstatus.plugin.zsh

# start the deamon
gitstatus_start GITSTATUS_ZSH

# redefine the git_prompt_info function, as defined in lib/git.zsh
function git_prompt_info() {
    local __prompt
    local __has
    if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
        if gitstatus_query GITSTATUS_ZSH && [[ $VCS_STATUS_RESULT == ok-sync ]]; then
            __prompt="$VCS_STATUS_LOCAL_BRANCH"
            if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
                __has=$(( VCS_STATUS_HAS_STAGED + VCS_STATUS_HAS_CONFLICTED + VCS_STATUS_HAS_UNSTAGED ))
            else
                __has=$(( VCS_STATUS_HAS_STAGED + VCS_STATUS_HAS_CONFLICTED + VCS_STATUS_HAS_UNSTAGED + VCS_STATUS_HAS_UNTRACKED ))
            fi
            if [[ $__has -gt 0 ]]; then
                __prompt="$__prompt$ZSH_THEME_GIT_PROMPT_DIRTY"
            else
                __prompt="$__prompt$ZSH_THEME_GIT_PROMPT_CLEAN"
            fi
        fi
        echo "$ZSH_THEME_GIT_PROMPT_PREFIX${__prompt}$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}
