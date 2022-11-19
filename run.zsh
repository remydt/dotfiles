#!/usr/bin/env zsh

set -eu

export DOTFILES_PATH="${PWD}"

source "${DOTFILES_PATH}"/src/*.zsh

function install_modules() {
  for module in "${@}"
  do
    install_script="${DOTFILES_PATH}/modules/${module}/install.zsh"

    if [[ -f "${install_script}" ]] {
      "${install_script}"
    }
  done
}

if [[ -n ${@} ]] {
  install_modules "${@}"
} else {
  # Without arguments, install all modules.
  install_modules "brew" "code" "git" "iterm" "nvim" "ssh" "system" "zsh"
}


