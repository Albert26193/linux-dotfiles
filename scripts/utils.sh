#!/bin/bash

###################################################
# description: make output colorful
#          $1: input content
#      return: nothing
###################################################
UTILS_COLOR_RED="\033[31m"
UTILS_COLOR_GREEN="\033[32m"
UTILS_COLOR_YELLOW="\033[33m"
UTILS_COLOR_BLUE="\033[34m"
UTILS_COLOR_MAGENTA="\033[35m"
UTILS_COLOR_CYAN="\033[36m"
UTILS_COLOR_WHITE="\033[97m"
UTILS_COLOR_GRAY="\033[90m"
UTILS_COLOR_RESET="\033[0m"
UTILS_BACKGROUND_YELLOW="\033[43m"
UTILS_BACKGROUND_RED="\033[41m"
UTILS_BACKGROUND_GREEN="\033[42m"
UTILS_COLOR_WHITE="\033[97m"

utils_print_red_line() { printf "${UTILS_COLOR_RED}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_green_line() { printf "${UTILS_COLOR_GREEN}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_yellow_line() { printf "${UTILS_COLOR_YELLOW}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_blue_line() { printf "${UTILS_COLOR_BLUE}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_magenta_line() { printf "${UTILS_COLOR_MAGENTA}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_cyan_line() { printf "${UTILS_COLOR_CYAN}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_gray_line() { printf "${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_white_line() { printf "${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET}\n" "$1"; }

utils_print_red() { printf "${UTILS_COLOR_RED}%s${UTILS_COLOR_RESET} " "$1"; }
utils_print_green() { printf "${UTILS_COLOR_GREEN}%s${UTILS_COLOR_RESET} " "$1"; }
utils_print_yellow() { printf "${UTILS_COLOR_YELLOW}%s${UTILS_COLOR_RESET} " "$1"; }
utils_print_blue() { printf "${UTILS_COLOR_BLUE}%s${UTILS_COLOR_RESET} " "$1"; }
utils_print_magenta() { printf "${UTILS_COLOR_MAGENTA}%s${UTILS_COLOR_RESET} " "$1"; }
utils_print_cyan() { printf "${UTILS_COLOR_CYAN}%s${UTILS_COLOR_RESET} " "$1"; }
utils_print_gray() { printf "${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET} " "$1"; }
utils_print_white() { printf "${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET} " "$1"; }

utils_print_warning_line() { printf "${UTILS_BACKGROUND_YELLOW}${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_error_line() { printf "${UTILS_BACKGROUND_RED}${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET}\n" "$1"; }
utils_print_info_line() { printf "${UTILS_BACKGROUND_GREEN}%s${UTILS_COLOR_RESET}\n" "$1"; }

utils_print_warning() { printf "${UTILS_BACKGROUND_YELLOW}${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET}" "$1"; }
utils_print_error() { printf "${UTILS_BACKGROUND_RED}${UTILS_COLOR_WHITE}%s${UTILS_COLOR_RESET}" "$1"; }
utils_print_info() { printf "${UTILS_BACKGROUND_GREEN}%s${UTILS_COLOR_RESET}" "$1"; }

###################################################
# description: give colorful yn_prompt
#          $1: custom prompt to print
#      return: 0 or 1
###################################################
function utils_yn_prompt() {
    local yn_input=""
    while true; do
        printf "$1 ${UTILS_COLOR_CYAN}[y/n]: ${UTILS_COLOR_RESET}"
        read yn_input
        case "${yn_input}" in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) utils_print_red "Please answer yes[y] or no[n]." ;;
        esac
    done
}

###################################################
# description: print step information
#          $1: current step description
#      return: nothing
###################################################
function utils_print_step() {
    local current_step=$1
    utils_print_green "========================================="
    utils_print_green "================= STEP ${current_step} ================"
    utils_print_green "========================================="
}

###################################################
# description: give current os judgement
#      return: Ubuntu | macOS | Debian | CentOS
###################################################
function utils_check_os() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        local OS=$(echo $NAME | awk '{print$1}')
    elif type lsb_release >/dev/null 2>&1; then
        local OS=$(lsb_release -si)
    elif [[ -f /etc/lsb-release ]]; then
        source /etc/lsb-release
        local OS=$DISTRIB_ID
    elif [[ -f /etc/debian_version ]]; then
        local OS=Debian
    elif [[ -f /etc/centos-release ]]; then
        local OS=CentOS
    elif [[ "$(uname -s)" == "Darwin" ]]; then
        local OS=macOS
    else
        local OS=$(uname -s)
    fi

    case $OS in
    "Ubuntu" | "Debian" | "CentOS" | "macOS")
        echo $OS
        ;;
    *)
        echo ""
        ;;
    esac
}
