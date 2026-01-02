#!/bin/bash

# 1. Detect Distro
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        arch)   DISTRO_ICON="" ;;
        fedora) DISTRO_ICON="" ;;
        ubuntu) DISTRO_ICON="" ;;
        opensuse*)  DISTRO_ICON="" ;;
        *)      DISTRO_ICON="" ;;
    esac
else
    DISTRO_ICON=""
fi

# 2. Detect Context (Host vs Container)
# If CONTAINER_ID is set (Distrobox sets this), use it. Otherwise, say "host".
if [ -n "$CONTAINER_ID" ]; then
    CONTEXT_LABEL="$CONTAINER_ID"
else
    CONTEXT_LABEL="host"
fi

# 3. Load Git Prompt (Local Copy)
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# 4. Configure Git Status
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

# 5. Define Colors
RESET="\[\e[0m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
CYAN="\[\e[36m\]"  # Added Cyan for the context label

# 6. Build PS1
# Format: (CONTEXT) (ICON) user@host [path] (branch)
export PS1='[('$DISTRO_ICON')'$CYAN$CONTEXT_LABEL$RESET']'$GREEN'\u'$RESET'@'$BLUE'\h'$RESET'[\w]$(__git_ps1 " (%s)")\n-> '
