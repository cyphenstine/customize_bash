#!/bin/bash

# 1. Detect Distro
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        arch)   DISTRO_ICON="<U+F303>" ;;
        fedora) DISTRO_ICON="<U+F30A>" ;;
        ubuntu) DISTRO_ICON="<U+F31B>" ;;
        opensuse*)  DISTRO_ICON="<U+F314>" ;;
        *)      DISTRO_ICON="<U+F17C>" ;;
    esac
else
    DISTRO_ICON="<U+F17C>"
fi

# 2. Load Git Prompt (Local Copy)
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# 3. Configure Git Status
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

# 4. Define Colors
RESET="\[\e[0m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
CYAN="\[\e[36m\]"

# 5. Build PS1
export PS1=''$CYAN'('$DISTRO_ICON')'$GREEN'\u'$RESET'@'$BLUE'\h'$RESET'[\w]$(__git_ps1 " (%s)")\n<U+F061> '
