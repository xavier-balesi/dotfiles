#!/usr/bin/env bash

set -e
set -x

CONFIG_DIR=${HOME}/config
GIT_EMAIL=xavier.balesi@protonmail.ch
GIT_NAME="Xavier BALESI"

######################################################################
#                                                                    #
# Logging functions                                                  #
#                                                                    #
######################################################################
COLOR_STD="\e[0m"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_BLUE="\e[3;34m"
COLOR_YELLOW="\e[3;33m"


function log() {
  local text=${1}
  local label=${2:-INFO}
  local color=${3:-COLOR_STD}
  local time=$(date --rfc-3339=seconds)

  echo -e "${time} [${!color}${label}${COLOR_STD}] ${text}"
}


function logError() { log "${*}" ERROR COLOR_RED; }
function logInfo() { log "${*}" INFO; }
function logWarning() { log "${*}" WARNING COLOR_YELLOW; }
function logDebug() { log "${*}" DEBUG COLOR_BLUE; }


######################################################################
#                                                                    #
# copy file from source to dest with logs                            #
# override destination if `force` is true                            #
#                                                                    #
######################################################################
function cpLog() {
  local source="${1}"
  local dest="${2}"
  local force="${3:-false}"
  
  option="--no-clobber"
  if [ -f "${dest}" ]; then
    if [[ "${force}" == true ]]; then
      logInfo "Destination file ${dest} exists, override !"
      option="--force"
    else
      logWarning "Destination file ${dest} exists, use force mode to override."
    fi
  fi
  cp ${option} "${source}" "${dest}"
  logInfo "Source file ${source} copied to ${dest}."
}


######################################################################
#                                                                    #
# update, upgrade and install git and ansible through apt            #
#                                                                    #
######################################################################
logInfo "Starting update and upgrade..."
sudo apt update
sudo apt upgrade -y
logInfo "System upgraded successfully !"

logInfo "Installing git and ansible..."
sudo apt install git ansible -y
logInfo "git and ansible installed successfully !"

logInfo "Cleaning apt files..."
sudo apt autoremove -y
sudo apt autoclean -y
logInfo "apt cleaned successfully !"


######################################################################
#                                                                    #
# configuring git                                                    #
#                                                                    #
######################################################################
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"

######################################################################
#                                                                    #
# clone dotfiles repository                                          #
#                                                                    #
######################################################################
mkdir -p "${CONFIG_DIR}"
cd "${CONFIG_DIR}"
if [[ ! -d "${CONFIG_DIR}/dotfiles" ]]; then
  git clone https://github.com/xavier-balesi/dotfiles.git
fi

cd dotfiles
BASE_DIR="$(pwd)"


######################################################################
#                                                                    #
# copy a simple vimrc for the base with few plugins                  #
#                                                                    #
######################################################################
cpLog "${BASE_DIR}/.vimrc" "${HOME}/.vimrc" "${FORCE}"

mkdir -p "${HOME}/.vim/bundle"
if [[ ! -d  "${HOME}/.vim/bundle/Vundle.vim" ]]; then
  git clone "https://github.com/VundleVim/Vundle.vim.git" "${HOME}/.vim/bundle/Vundle.vim"
fi
vim +VundleInstall +qall
