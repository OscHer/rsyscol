#!/usr/bin/env bash

######################################################################
# @author      : Óscar Heredia (oscar@clickdefense.io)
# @file        : log.sh
# @created     : lunes feb 10, 2025 09:30:00 CET
#
# @description : Logging script for Bash with color-coded log levels.
######################################################################

# Define colors for each log level
COLOR_DEBUG="\e[37m"      # Gray
COLOR_INFO="\e[32m"       # Green
COLOR_NOTICE="\e[36m"     # Cyan
COLOR_WARNING="\e[93m"    # Orange
COLOR_ERROR="\e[31m"      # Red
COLOR_CRITICAL="\e[91m"   # Bright Red
COLOR_ALERT="\e[35m"      # Magenta
COLOR_EMERGENCY="\e[41;97m" # White on Red Background
COLOR_PROMPT="\e[94m"     # Light Blue
NC="\e[0m"                 # No Color

# Logging function
log() {
    local LEVEL="$1"
    shift
    local MESSAGE="$*"
    local COLOR
    
    case "$LEVEL" in
        DEBUG) COLOR=$COLOR_DEBUG ;;
        INFO) COLOR=$COLOR_INFO ;;
        NOTICE) COLOR=$COLOR_NOTICE ;;
        WARNING) COLOR=$COLOR_WARNING ;;
        ERROR) COLOR=$COLOR_ERROR ;;
        CRITICAL) COLOR=$COLOR_CRITICAL ;;
        ALERT) COLOR=$COLOR_ALERT ;;
        EMERGENCY) COLOR=$COLOR_EMERGENCY ;;
        PROMPT) COLOR=$COLOR_PROMPT ;;
        *) COLOR=$NC ;; # Default no color
    esac
    
    echo -e "${COLOR}[${LEVEL}]${NC} ${MESSAGE}"
}

# Function to generate demo logs
demo_logs() {
    log DEBUG "This is a debug message."
    log INFO "This is an info message."
    log NOTICE "This is a notice message."
    log WARNING "This is a warning message."
    log ERROR "This is an error message."
    log CRITICAL "This is a critical message."
    log ALERT "This is an alert message."
    log EMERGENCY "This is an emergency message."
    log PROMPT "This is a prompt message."
}

# Example usage (Uncomment to test)
# demo_logs

# To use this script in another file, add:
# source log.sh
# log INFO "Logging initialized successfully."

